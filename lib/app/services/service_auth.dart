// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import '../modules/welcome/views/welcome_view.dart';

// class ServiceAuth {
//  static final firebaseAuth=FirebaseAuth.instance;
//   static final GoogleSignIn _googleSignIn = GoogleSignIn();

//   static Future<void> signInWithGoogle() async {
//     try {
//       final googleUser = await GoogleSignIn().signIn();
//       final googleAuth = await googleUser?.authentication;

//       if (googleAuth != null) {
//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         final userCredentialData =
//             await firebaseAuth.signInWithCredential(credential);

//         ///Here to check isNewUser OR Not
//         if (userCredentialData.additionalUserInfo!.isNewUser) {
//         } else {
//           await Get.offAllNamed('/home');
//         }
//       }
//     } catch (ex) {
//       Get.back();
//     }
//   }

  

//   Future<void> signOut() async {
//     await firebaseAuth.signOut();
//     await _googleSignIn.signOut();

//     // await Get.offAll(() => const WelcomePage());
//   }
// }
