import 'package:chatify/app/auth/auth_controller.dart';
import 'package:chatify/app/modules/profile/widgets/profile_menu_widget.dart';
import 'package:chatify/app/routes/app_pages.dart';
import 'package:chatify/app/utils/color_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'My Profile',
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: authController.currentLoggedInUserModel.value
                                .photoUrl!.isEmpty
                            ? Image.asset(
                                'assets/logo/noimage.png',
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                authController
                                    .currentLoggedInUserModel.value.photoUrl!,
                                fit: BoxFit.cover,
                              ),
                      )),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                            authController
                                    .currentLoggedInUserModel.value.name ??
                                "Lorem Ipsum",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            textAlign: TextAlign.center,
                          )),
                      Text(
                        authController.currentLoggedInUserModel.value.email ??
                            'lorem.ipsum@gmail.com',
                        style: GoogleFonts.inter(textStyle: TextStyle()),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                          onPressed: () => Get.toNamed(Routes.CHANGE_PROFILE),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            backgroundColor: ColorList.primaryColor,
                          ),
                          child: Text('Edit Profile'))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  children: [
                    ProfileMenuWidget(
                      menuIcon: Icon(
                        Icons.person_outline_outlined,
                        size: 32,
                      ),
                      menuTitle: 'Edit Profile',
                      onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    ProfileMenuWidget(
                      menuIcon: Icon(
                        Icons.compass_calibration_outlined,
                        size: 30,
                      ),
                      menuTitle: 'Update Status',
                      onTap: () => Get.toNamed(Routes.UPDATE_STATUS),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ProfileMenuWidget(
                        menuIcon: Icon(
                          Icons.logout_outlined,
                          size: 26,
                        ),
                        menuTitle: 'Log Out',
                        onTap: () => authController.logout(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
