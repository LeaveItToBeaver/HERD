import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/blocs/auth/auth_bloc.dart';
import 'package:herd/screens/profile/widgets/widgets.dart';
import 'package:herd/widgets/user_cover_image.dart';
import 'package:herd/widgets/widgets.dart';

import 'bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

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
        body: CustomScrollView(
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
                        coverImageUrl: state.user.coverImageURL,
                      )
                  ),
                ],
              ),
              actions: <Widget>[
                if (state.isCurrentUser)
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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(24, 10, 24, 5),
                    child: Row(
                      children: [
                        UserProfileImage(
                          radius: 40.0,
                          profileImageUrl: state.user.profileImageURL,
                        ),
                        ProfileStats(
                          isCurrentUser: state.isCurrentUser,
                          isFollowing: state.isFollowing,
                          posts: 0,
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
            )
          ],
        ),
      );
    });
  }
}
