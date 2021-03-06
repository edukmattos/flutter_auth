import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../errors/auth_error_interceptor.dart';
import '../../responses/response_builder.dart';
import '../../responses/response_default.dart';
import '../../shared_preferences/repositories/interfaces/shared_repository_interface.dart';
import '../../shared_preferences/repositories/shared_repository.dart';
import 'interfaces/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  ISharedRepository sharedRepository = SharedRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<DefaultResponse> authRepoSignInWithGoogle() async {
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
      print("user");
      var userDisplayName = _auth.currentUser!.displayName;
      sharedPrefsUserDisplayNameSave(userDisplayName);

      var userDisplayEmail = (_auth.currentUser!.email);
      sharedPrefsUserEmailSave(userDisplayEmail);

      return ResponseBuilder.success<User>(
        object: _auth.currentUser,
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

  Future<DefaultResponse> authRepoSignInEmailPassword({
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
      print(e.code);
      return ResponseBuilder.failed(
        object: e,
        message: e.code,
        errorInterceptor: AuthErrorInterceptor(e.code),
      );
    }
  }

  Future<DefaultResponse> authRepoPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );
      Modular.to.pushNamed('/sign_in');
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

  Future<DefaultResponse> authRepoSignUpEmailPassword(
      {required String email, required String password}) async {
    try {
      return await _auth
          .createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .then((user) {
        Modular.to.pushNamed('/home');
        return ResponseBuilder.success<User>(
          object: _auth.currentUser,
        );
      });
    } on FirebaseAuthException catch (e) {
      return ResponseBuilder.failed(
        object: e,
        message: e.code,
        errorInterceptor: AuthErrorInterceptor(e.code),
      );
    }
  }

  Future<void> authRepoSignOutWithGoogle() => _googleSignIn.signOut();

  sharedPrefsUserDisplayNameSave(value) async {
    await sharedRepository.setValue<String>('userDisplayName', value);
  }

  sharedPrefsUserEmailSave(value) async {
    await sharedRepository.setValue<String>('userEmail', value);
  }

  sharedPrefsUserDisplayNameLoad() async {
    await sharedRepository.getValue<String>('userDisplayName');
  }

  sharedPrefsUserEmailLoad() async {
    await sharedRepository.getValue<String>('userEmail');
  }
}
