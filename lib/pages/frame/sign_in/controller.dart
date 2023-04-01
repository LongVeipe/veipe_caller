import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:lv_caller/common/entities/entities.dart';
import 'package:lv_caller/common/routes/routes.dart';
import 'package:lv_caller/pages/frame/sign_in/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  static const String googleType = 'Google';
  static const String facebookType = 'Facebook';
  static const String appleType = 'Apple';
  static const String phoneType = 'Phone number';

  SignInController();

  final title = "LV Caller";
  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [

  ]);

  Future<void> handleSignIn(String type) async {
    //1: Google ~~ 2: Facebook ~~ 3: AppleId ~~ 4: Phone
    try {
      switch (type) {
        case googleType:
          GoogleSignInAccount? account = await _googleSignIn.signIn();
          if(account != null){
            final gAuthentication = await account.authentication;
            final credential = GoogleAuthProvider.credential(
              idToken: gAuthentication.idToken,
              accessToken: gAuthentication.accessToken,
            );
            await FirebaseAuth.instance.signInWithCredential(credential);
            String? displayName = account.displayName;
            String email = account.email;
            String id = account.id;
            String photoUrl = account.photoUrl ?? "assets/icons/google.png";

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.type = type;
            asyncPostAllData();
          }
          break;
        case facebookType:
        case appleType:
        case phoneType:
        default:
          break;
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error with login $error');
      }
    }
  }

  void asyncPostAllData(){
    Get.offAllNamed(AppRoutes.INITIAL);
  }
}
