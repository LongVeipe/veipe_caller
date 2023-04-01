import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lv_caller/common/style/color.dart';
import 'package:lv_caller/common/values/colors.dart';
import 'package:lv_caller/common/values/shadows.dart';
import 'package:lv_caller/pages/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    _buildProfilePhoto(),
                    _buildCompleteButton(),
                    _buildLogoutButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Profile",
        style: TextStyle(
          color: AppColor.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            borderRadius: BorderRadius.circular(60.w),
            boxShadow: [
              Shadows.buttonGreyShadow,
            ],
          ),
          child: Image.asset(
            "assets/images/account_header.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 0.w,
            right: 0,
            child: GestureDetector(
              onTap: null,
              child: Container(
                padding: EdgeInsets.all(7.w),
                height: 35.w,
                width: 35.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Image.asset("assets/icons/edit.png"),
              ),
            ))
      ],
    );
  }

  Widget _buildCompleteButton() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        width: 295.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.circular(5.w),
          boxShadow: [
            Shadows.buttonGreyShadow,
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile",
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          title: "Are you sure to logout?",
          textCancel: 'Cancel',
          textConfirm: 'Confirm',
          confirmTextColor: Colors.white,
          onCancel: () {},
          onConfirm: () {
            controller.logout();
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        width: 295.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: AppColors.primarySecondaryElementText,
          borderRadius: BorderRadius.circular(5.w),
          boxShadow: [
            Shadows.buttonGreyShadow,
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logout",
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
