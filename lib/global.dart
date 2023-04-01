import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:lv_caller/common/services/services.dart';
import 'package:lv_caller/common/store/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Global{
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Get.put<StorageService>(await StorageService().init());
    Get.put<UserStore>(UserStore());
  }
}