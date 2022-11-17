import 'package:appmanagement/app/modules/authentification/views/authentification_view.dart';
import 'package:appmanagement/app/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../modules/welcome/views/welcome_view.dart';

class ServiceAuth {
  static final firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredentialData =
            await firebaseAuth.signInWithCredential(credential);

        ///Here to check isNewUser OR Not
        if (userCredentialData.additionalUserInfo!.isNewUser) {
        } else {
          await Get.offAllNamed('/home');
        }
      }
    } catch (ex) {
      Get.back();
    }
  }

  Future<bool?> createUserWithEmailAndPassword(
      String? email, String? password, bool isAdmin, String codeAdmin) async {
    try {
      UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      User user = credential.user!;
      await DatabaseUser(isAdmin: isAdmin, user: user).setUser(codeAdmin);
      return true;
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String? email, String? password) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      User user = credential.user!;
      return true;
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());

      return null;
    }
  }

  static Future<void> signOut() async {
    await firebaseAuth.signOut();
    await _googleSignIn.signOut();
    await Get.offAll(() => const AuthentificationView());
  }
}
