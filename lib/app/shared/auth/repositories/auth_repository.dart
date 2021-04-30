import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/errors/auth_error_interceptor.dart';
import '../../../core/responses/response_builder.dart';
import '../../../core/responses/response_default.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<DefaultResponse> signInWithGoogle() async {
    GoogleSignInAccount googleUser;
    try {
      googleUser = (await _googleSignIn.signIn())!;
      // ignore: unnecessary_null_comparison
      //if (googleUser == null) {
      // user canceled the sign-in, do your cancellation logic here.
      //  return;
      //}
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var user = await _auth.signInWithCredential(credential);
      print('Google Sign-In completed!');
      print(user);

      return ResponseBuilder.success<User>(
        object: _auth.currentUser,
        message: "Logado com sucesso !",
      );
    } on FirebaseAuthException catch (e) {
      //print(e.code);
      return ResponseBuilder.failed(
        object: e,
        message: e.code,
        errorInterceptor: AuthErrorInterceptor(e.code),
      );
    }
  }

  Future<DefaultResponse> signInEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return ResponseBuilder.success<User>(
        object: _auth.currentUser,
      );
    } on FirebaseAuthException catch (e) {
      return ResponseBuilder.failed(
        object: e,
        message: e.code,
        errorInterceptor: AuthErrorInterceptor(e.code),
      );
    }
  }

  Future<DefaultResponse> passwordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );
      return ResponseBuilder.success<User>(
        object: _auth.currentUser,
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return ResponseBuilder.failed(
        object: e,
        message: e.code,
        errorInterceptor: AuthErrorInterceptor(e.code),
      );
    }
  }

  Future<void> signOutWithGoogle() => _googleSignIn.disconnect();
}
