import 'package:lv_caller/common/routes/names.dart';
import 'package:lv_caller/pages/frame/message/state.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  MessageController();

  final state = MessageState();

  Future<void> goToProfile() async{
    await Get.toNamed(AppRoutes.Profile);
  }
}
