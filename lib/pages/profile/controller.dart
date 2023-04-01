import 'package:google_sign_in/google_sign_in.dart';
import 'package:lv_caller/common/store/store.dart';
import 'package:lv_caller/pages/profile/state.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController();

  final state = ProfileState();

  @override
  void onReady(){
    super.onReady();
  }

  Future<void> logout() async{
    await GoogleSignIn().signOut();

    await UserStore.to.onLogout();
  }
}
