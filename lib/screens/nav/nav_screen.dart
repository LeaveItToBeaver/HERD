import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/enums/enums.dart';
import 'package:herd/screens/nav/cubit/bottom_nav_bar_cubit.dart';
import 'package:herd/screens/nav/widgets/bottom_nav_bar.dart';

class NavScreen extends StatelessWidget {
  static const String routeName = '/nav';

  static Route route(){
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (_, __, ___,) => BlocProvider<BottomNavBarCubit>(
          create: (_) => BottomNavBarCubit(),
          child: NavScreen()
      ),
    );
  }

  final Map<BottomNavItem, IconData> items = const {
    BottomNavItem.search: Icons.search,
    BottomNavItem.feed: Icons.home,
    BottomNavItem.create: Icons.add,
    BottomNavItem.anonFeed: Icons.home_outlined,
    BottomNavItem.notifications: Icons.notifications,
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state){
          return Scaffold(
            body: Text('Nav Screen'),
            bottomNavigationBar: BottomNavBar(
              items: items,
              selectedItem: state.selectedItem,
              onTap: (index) {
                final selecteItem = BottomNavItem.values[index];
                context.read<BottomNavBarCubit>().updateSelectedItem(selecteItem);
              },
            ),
          );
        }
      ),
    );
  }
}