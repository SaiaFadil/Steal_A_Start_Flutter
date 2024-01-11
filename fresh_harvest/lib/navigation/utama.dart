import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_harvest/menu/menu_home.dart';
import 'package:fresh_harvest/menu/menu_profile.dart';
import 'package:fresh_harvest/menu/menu_shop.dart';
import 'package:fresh_harvest/navigation/bottom_navbar.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';

class utama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BottomNavCubit(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: utamaPage(),
        ));
  }
}

class utamaPage extends StatefulWidget {
  @override
  _utamaPageState createState() => _utamaPageState();
}

class _utamaPageState extends State<utamaPage> {
  final _pageNavigation = [
    menu_home(),
    menu_shop(),
    menu_profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: CustomColors.whiteColor,
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    return _pageNavigation.elementAt(index);
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      elevation: 30.0,
      currentIndex: context.read<BottomNavCubit>().state,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme:
          IconThemeData(size: 20, color: CustomColors.primaryColor),
      fixedColor: CustomColors.primaryColor,
      unselectedItemColor: CustomColors.whiteColor,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      backgroundColor: CustomColors.whiteColor,
      unselectedLabelStyle: CustomText.TextArvo(1, CustomColors.whiteColor),
      selectedLabelStyle: CustomText.TextArvo(13, CustomColors.primaryColor),
      onTap: _getChangeBottomNav,
      items: [
        BottomNavigationBarItem(
            tooltip: "home",
            icon: Image.asset(
              "assets/images/nav_home.png",
              height: 25,
            ),
            label: "Home",
            activeIcon:
                Image.asset("assets/images/nav_home_on.png", height: 35)),
        BottomNavigationBarItem(
            tooltip: "Shop",
            icon: Image.asset(
              "assets/images/nav_shop.png",
              height: 25,
            ),
            label: "Shop",
            activeIcon:
                Image.asset("assets/images/nav_shop_on.png", height: 35)),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/nav_profile.png",
              height: 25,
            ),
            label: "Profile",
            activeIcon:
                Image.asset("assets/images/nav_profile_on.png", height: 35),
            tooltip: "Profil"),
      ],
    );
  }

  void _getChangeBottomNav(int index) {
    context.read<BottomNavCubit>().updateIndex(index);
  }
}
