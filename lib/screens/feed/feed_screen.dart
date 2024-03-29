import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/screens/feed/bloc/feed_bloc.dart';
import 'package:herd/widgets/post_widgets/text_post_view.dart';
import 'package:herd/widgets/widgets.dart';

class FeedScreen extends StatefulWidget {
  static const String routeName = '/feed';

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset >=
                _scrollController.position.maxScrollExtent &&
            !_scrollController.position.outOfRange &&
            context.read<FeedBloc>().state.status != FeedStatus.paginating) {
          context.read<FeedBloc>().add(FeedPaginatePosts());
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedBloc, FeedState>(
      listener: (context, state) {
        if (state.status == FeedStatus.error) {
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(content: state.failure.message),
          );
        } else if (state.status == FeedStatus.paginating) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text("Fetching more Posts.")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("HERD"),
            actions: [
              if (state.posts.isEmpty && state.status == FeedStatus.loaded)
                IconButton(
                    onPressed: () =>
                        context.read<FeedBloc>().add(FeedFetchPosts()),
                    icon: const Icon(Icons.refresh)),
            ],
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(FeedState state) {
    switch (state.status) {
      case FeedStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      default:
        return RefreshIndicator(
          onRefresh: () async {
            context.read<FeedBloc>().add(FeedFetchPosts());
            return true;
          },
          child: ListView.builder(
              controller: _scrollController,
              itemCount: state.posts.length,
              itemBuilder: (BuildContext context, int index) {
                final post = state.posts[index];
                return PostView(post: post);
              }),
        );
    }
  }
}
