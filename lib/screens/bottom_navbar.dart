import 'dart:ffi';

import 'package:ecom_app/cart/cartlist.dart';
import 'package:ecom_app/cart/singleProductScrn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../cart/allProduct.dart';
import 'home.dart';

class PerNavBar extends StatefulWidget {
  const PerNavBar({super.key});

  @override
  State<PerNavBar> createState() => PerNavBarState();
}

class PerNavBarState extends State<PerNavBar> {
  List<Widget> _buildScreens() {
    return [
      const EHomePage(),
      const AllProducts(),
      const CartList(),
    ];
//List scns=[Img(),Design(),HomeScreen()];
  }

  List<PersistentBottomNavBarItem>
      _navbaritems() //list of perssistentnavbaritems that needed to display in bottom nav
  {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.home),
          activeColorPrimary: CupertinoColors.darkBackgroundGray,
          inactiveColorPrimary: CupertinoColors.black),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.shopping_cart),
          activeColorPrimary: CupertinoColors.darkBackgroundGray,
          inactiveColorPrimary: CupertinoColors.black),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          activeColorPrimary: CupertinoColors.darkBackgroundGray,
          inactiveColorPrimary: CupertinoColors.black),
    ];
  }

  Widget build(BuildContext context) {
    //prop in presist no need of scaffold

    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navbaritems(),
      confineInSafeArea: true,
      backgroundColor: const Color.fromARGB(255, 165, 184, 193),
      handleAndroidBackButtonPress:
          true, //back to home page whenever click backbutton
      resizeToAvoidBottomInset: true, //to avoid overflow
      stateManagement:
          true, ////can move to other pages without losing data that typed in that page
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,

      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(5),
        colorBehindNavBar: Colors.white,
      ),
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ), //screen changing speed

      navBarStyle: NavBarStyle.style1,
    );
  }
}
