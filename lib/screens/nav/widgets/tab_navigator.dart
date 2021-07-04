import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/blocs/auth/auth_bloc.dart';
import 'package:herd/config/custom_router.dart';
import 'package:herd/enums/bottom_nav_item.dart';
import 'package:herd/repositories/repositories.dart';
import 'package:herd/screens/profile/bloc/profile_bloc.dart';
import 'package:herd/screens/profile/profile_screen.dart';
import 'package:herd/screens/screens.dart';

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';
  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavItem item;

  const TabNavigator({
    Key key,
    @required this.navigatorKey,
    @required this.item
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders();
    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoot,
      onGenerateInitialRoutes: (_, initialRoute){
        return [
          MaterialPageRoute(
            settings: RouteSettings(name: tabNavigatorRoot),
              builder: (context) => routeBuilders[initialRoute](context),
          ),
        ];
      },
      onGenerateRoute: CustomRouter.onGeneratedRoute,
    );
  }



  Map<String, WidgetBuilder> _routeBuilders() {
    return {tabNavigatorRoot: (context) => _getScreen (context, item)};
  }

  Widget _getScreen(BuildContext context, BottomNavItem item) {
    switch (item) {
      case BottomNavItem.search:
        return SearchScreen();
      case BottomNavItem.feed:
        return FeedScreen();
      case BottomNavItem.create:
        return CreatePostsScreen();
      case BottomNavItem.notifications:
        return NotificationScreen();
      case BottomNavItem.profile:
        return BlocProvider<ProfileBloc>(
          create: (_) => ProfileBloc(
            userRepository: context.read<UserRepository>(),
            authBloc: context.read<AuthBloc>()
          )..add(
            ProfileLoadUser(userId: context.read<AuthBloc>().state.user.uid),
          ),
          child: ProfileScreen(),
        );
      default:
        return Scaffold();
    }
  }
}