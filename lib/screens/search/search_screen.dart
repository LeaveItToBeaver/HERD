import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/user_widgets/user_profile_image.dart';
import '../profile/profile_screen.dart';
import 'cubit/search_cubit.dart';
import 'package:herd/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName ='/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case SearchStatus.error:
                          return CenteredText(
                            text: state.failure.message,
                          );
                        case SearchStatus.loading:
                          return const Center(child: CircularProgressIndicator());
                      //case SearchStatus.initial:
                        case SearchStatus.loaded:
                          return state.users.isNotEmpty ? ListView.builder(
                              itemCount: state.users.length,
                              itemBuilder: (BuildContext context, int index){
                                final user = state.users[index];
                                return ListTile(
                                  leading: UserProfileImage(
                                    radius: 22.0,
                                    profileImageUrl: user.profileImageURL,
                                  ),
                                  title: Text(
                                    user.username,
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                  onTap: () => Navigator.of(context).pushNamed(
                                    ProfileScreen.routeName,
                                    arguments: ProfileScreenArgs(userId: user.id),
                                  ),
                                );
                              }
                          ) : CenteredText(
                            text: "No users were found.",
                          );
                        default:
                          return const SizedBox.shrink(
                          );
                      }
                    },
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(
                        color: Color(0xffc2ffc2), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(
                        color: Colors.black, width: 2.0),
                  ),
                  labelText: 'Search',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.read<SearchCubit>().clearSearch();
                      _textController.clear();
                    },
                  ),
                ),
                textInputAction: TextInputAction.search,
                textAlignVertical: TextAlignVertical.center,
                onSubmitted: (value) {
                  if(value.trim().isNotEmpty){
                    context.read<SearchCubit>().searchUsers(value.trim());
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}