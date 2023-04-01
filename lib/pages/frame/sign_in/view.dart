import 'package:lv_caller/common/values/colors.dart';
import 'package:lv_caller/pages/frame/sign_in/controller.dart';
import 'package:lv_caller/pages/frame/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primarySecondaryBackground,
        body: Center(
          child: Column(
            children: [
              _buildLogo(),
              _buildThirdPartyLogin(SignInController.googleType, icon: 'google'),
              _buildThirdPartyLogin(SignInController.facebookType, icon: 'facebook'),
              _buildThirdPartyLogin(SignInController.appleType, icon: 'apple'),
              _buildDivider(),
              _buildThirdPartyLogin(SignInController.phoneType),
              SizedBox(
                height: 35.h,
              ),
              _buildSignUpWidget(),
            ],
          ),
        ));
  }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
      child: Text(
        'LV Caller',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 34.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildThirdPartyLogin(String loginType, {String? icon}) {
    return GestureDetector(
      onTap: (){
        controller.handleSignIn(loginType);
      },
      child: Container(
        width: 259.w,
        height: 44.h,
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            if (icon != null)
              Container(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Image.asset('assets/icons/$icon.png'),
              ),
            Container(
              child: Text(
                'Sign in with $loginType',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 35.h),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            height: 2.h,
            indent: 50,
            color: AppColors.primarySecondaryElementText,
          )),
          const Text('   or   '),
          Expanded(child: Divider(height: 2.h, color: AppColors.primarySecondaryElementText, endIndent: 50)),
        ],
      ),
    );
  }

  Widget _buildSignUpWidget() {
    return GestureDetector(
      onTap: (){print(11111);},
      child: Column(
        children: [
          Text(
            'Already have an account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 12.sp,
            ),
          ),
          Text(
            'Sign up here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryElement,
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
          )
        ],
      ),
    );
  }
}
