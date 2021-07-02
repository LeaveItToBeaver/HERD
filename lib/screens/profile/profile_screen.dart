import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/blocs/auth/auth_bloc.dart';
import 'package:herd/widgets/widgets.dart';

import 'bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget{
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state){
          if (state.status == ProfileStatus.error) {
            showDialog(
                context: context,
                builder: (context) => ErrorDialog(
                  content: state.failure.message,
                )
            );
          }
        },
        builder: (context, state){
          return Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  snap: false,
                  floating: true,
                  expandedHeight: 180.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(state.user.username),
                    //background: ,
                  ),
                  actions: <Widget>[
                    if (state.isCurrentUser)
                      IconButton(
                        onPressed: () => context.read<AuthBloc>().add(AuthLogoutRequested()),
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
                      Padding(padding: EdgeInsets.fromLTRB(24, 10, 24, 5),
                        child: Row(
                        children: [
                          UserProfileImage(
                              radius: 40.0,
                              profileImageUrl: state.user.profileImageURL,
                          ),
                          ProfileStatus(
                            isCurrentUser.stats
                          ),
                        ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}