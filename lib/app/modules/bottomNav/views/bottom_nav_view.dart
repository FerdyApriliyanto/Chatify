import 'package:chatify/app/modules/find_friend/controllers/find_friend_controller.dart';
import 'package:chatify/app/modules/find_friend/views/find_friend_view.dart';
import 'package:chatify/app/modules/home/controllers/home_controller.dart';
import 'package:chatify/app/modules/home/views/home_view.dart';
import 'package:chatify/app/modules/profile/controllers/profile_controller.dart';
import 'package:chatify/app/modules/profile/views/profile_view.dart';
import 'package:chatify/app/utils/color_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  final homeController = Get.put(HomeController());
  final findFriendController = Get.put(FindFriendController());
  final profileController = Get.put(ProfileController());

  final List<Widget> _screens = [HomeView(), FindFriendView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.index.value,
            children: _screens,
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.index.value,
              onTap: (newindex) {
                controller.setIndex(newindex);
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: ColorList.primaryColor,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline_rounded, size: 28),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 30),
                  label: 'Find',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded, size: 32),
                  label: 'Profile',
                ),
              ])),
    );
  }
}
