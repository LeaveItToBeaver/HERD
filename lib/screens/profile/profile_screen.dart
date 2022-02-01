import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/blocs/auth/auth_bloc.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:herd/screens/profile/widgets/widgets.dart';
import 'package:herd/widgets/user_cover_image.dart';
import 'package:herd/widgets/widgets.dart';
import 'dart:io';

import 'bloc/profile_bloc.dart';

class ProfileScreenArgs {
  final String userId;

  const ProfileScreenArgs({@required this.userId});
}
class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';

  static Route route({@required ProfileScreenArgs args}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
        builder: (context) => BlocProvider<ProfileBloc> (
          create: (_) => ProfileBloc(
            userRepository: context.read<UserRepository>(),
            postRepository: context.read<PostRepository>(),
            authBloc: context.read<AuthBloc>(),
          )..add(
            ProfileLoadUser(userId: args.userId),
          ),
          child: ProfileScreen(),
        ),
    );
  }

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state.status == ProfileStatus.error) {
        showDialog(
            context: context,
            builder: (context) => ErrorDialog(
                  content: state.failure.message,
                ));
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: _buildBody(state),
      );
    }
    );
  }

  Widget _buildBody(ProfileState state){
    switch(state.status) {
      case ProfileStatus.loading:
        return Center(child: CircularProgressIndicator());
      default:
        return RefreshIndicator(
          onRefresh: () async {
            context
                .read<ProfileBloc>()
                .add(ProfileLoadUser(userId: state.user.id));
            return true;
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: true,
                expandedHeight: 150.0,
                flexibleSpace: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: UserCoverImage(
                          isSelected: false,
                          coverImageUrl: state.user.coverImageURL,
                        )),
                  ],
                ),
                actions: <Widget>[
                  if (state.isCurrentUser)
                    IconButton(
                      onPressed: null,
                      icon: const Icon(
                        Icons.settings_rounded,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          context.read<AuthBloc>().add(AuthLogoutRequested()),
                      icon: const Icon(Icons.exit_to_app),
                    ),
                ],
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    elevation: 10,
                    shadowColor: Color(0xffc2ffc2),
                    borderOnForeground: false,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xffc2ffc2).withAlpha(85), width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 24, 5),
                          child: Row(
                            children: [
                              UserProfileImage(
                                radius: 40.0,
                                profileImageUrl: state.user.profileImageURL,
                              ),
                              ProfileStats(
                                isCurrentUser: state.isCurrentUser,
                                isFollowing: state.isFollowing,
                                posts: state.posts.length,
                                followers: state.user.followers,
                                following: state.user.following,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          child: ProfileInfo(
                            username: state.user.username,
                            bio: state.user.bio,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TabBar(
                    automaticIndicatorColorAdjustment: true,
                    controller: _tabController,
                    indicator: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [const Color(0xffebc2ff), const Color(0xffa488b3)]
                      ),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffc2ffc2),
                    ),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Posts',
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Comments',
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('History',
                            style: TextStyle(
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ],
                    onTap: (i) => context.read<ProfileBloc>()
                        .add(
                      ProfileToggleListView(isListView: i == 0)
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                  final post = state.posts[index];
                  return PostView(post: post);
                  },
                  childCount: state.posts.length,
                ),
              ),
            ],
          ),
        );
    }
  }
}
