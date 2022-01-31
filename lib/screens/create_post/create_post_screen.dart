import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/helpers/helpers.dart';
import 'package:herd/screens/create_post/create_post_cubit/create_post_cubit.dart';
import 'package:herd/widgets/error_dialog.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class CreatePostScreen extends StatelessWidget {
  static const String routeName = '/createPost';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Create a post."),
        ),
        body: BlocConsumer<CreatePostCubit, CreatePostState>(
          listener: (context, state){
            if (state.status == CreatePostStatus.success) {
              _formKey.currentState.reset();
              context.read<CreatePostCubit>().reset();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('We\'re throwing together your post now.'),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.green,
                  )
              );
            } else if (state.status == CreatePostStatus.error){
              showDialog(
                  context: context,
                  builder: (context) => 
                ErrorDialog(content: state.failure.message),
              );
            }
          },
          builder: (context, state){
            return SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _selectPostImage(context),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.25,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: state.postImage != null
                      ? Image.file(state.postImage, fit: BoxFit.cover)
                          : const Icon(
                        Icons.image,
                        color: Colors.black,
                        size: 120,
                      ),
                    ),
                  ),

                  if (state.status == CreatePostStatus.submitting)
                    const LinearProgressIndicator(),
                  Padding(
                      padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(
                                  color: Colors.blue, width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(
                                  color: Colors.blue, width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(color: Colors.red, width: 2.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(color: Colors.red, width: 2.0),
                              ),
                              labelText: 'Title',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: Icon(
                                Icons.article_rounded,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (value) => context
                                .read<CreatePostCubit>()
                                .titleChanged(value),
                            validator: (value) => value.trim().isEmpty
                            ? "Title Cannot Be Empty."
                            : null,
                          ),
                          const SizedBox(height: 15,),
                          TextFormField(
                            maxLines: null,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(
                                  color: Colors.blue, width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                borderSide: BorderSide(
                                  color: Colors.blue, width: 2,
                                ),
                              ),
                              labelText: 'Your post text goes here.',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: Icon(
                                Icons.article_outlined,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (value) => context
                                .read<CreatePostCubit>()
                                .captionChanged(value),
                            validator: (value) => value.trim().isEmpty
                            ? null // They don't have to post a text body.
                            : null,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            child: Container(
                              child: TextButton(
                                onPressed: () => _submitForm(
                                    context,
                                    state.postImage,
                                    state.status == CreatePostStatus.submitting
                                ),
                                child: const Text(
                                  "Post",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        Colors.green
                                    ),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25.0),
                                        )
                                    )
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _selectPostImage(BuildContext context) async {
    final pickedFile = await ImageHelper.pickImageFromGallary(
        context: context,
        cropStyle: CropStyle.rectangle,
        title: 'Create Post',
    );
    if (pickedFile != null){
      context.read<CreatePostCubit>().postImageChanged(pickedFile);
    }
  }

  void _submitForm(BuildContext context, File postImage, bool isSubmitting){
    if (_formKey.currentState.validate()
    && !isSubmitting){
      context.read<CreatePostCubit>().submit();
    }
  }
}