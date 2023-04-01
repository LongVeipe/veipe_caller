import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lv_caller/common/values/colors.dart';
import 'package:lv_caller/pages/frame/message/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: _headBar(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _headBar() {
    return Center(
      child: Container(
        width: 320.w,
        height: 44.w,
        margin: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () => controller.goToProfile(),
                  child: Container(
                    width: 44.h,
                    height: 44.h,
                    decoration: BoxDecoration(
                        color: AppColors.primarySecondaryBackground,
                        borderRadius: BorderRadius.all(Radius.circular(22.h)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            offset: const Offset(0, 1),
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ]),
                    child: controller.state.headDetail.value.avatar == null
                        ? Image.asset("assets/images/account_header.png")
                        : Text("hhihi"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                    right: 0,
                    child: Container(
                  width: 14.w,
                  height: 14.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(width: 2.w, color: AppColors.primaryElementText),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
