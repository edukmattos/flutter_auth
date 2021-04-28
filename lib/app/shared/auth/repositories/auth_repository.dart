import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> signInWithGoogle() async {
    GoogleSignInAccount googleUser;
    String msg = "";
    try {
      googleUser = (await _googleSignIn.signIn())!;
      // ignore: unnecessary_null_comparison
      if (googleUser == null) {
        // user canceled the sign-in, do your cancellation logic here.
        return;
      }
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var user = await _auth.signInWithCredential(credential);
      print('Google Sign-In completed!');
      print(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-disabled':
          //print('Google Sign-In error: User disabled');
          msg = tr('auth.sign_in_google.errors.user_disabled');
          print(msg);
          break;
        case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
          print(
              'Google Sign-In error: Account already exists with a different credential.');
          break;
        case 'ERROR_INVALID_CREDENTIAL':
          print('Google Sign-In error: Invalid credential.');
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          print('Google Sign-In error: Operation not allowed.');
          break;
        default:
          print('Google Sign-In error');
          break;
      }
      print(e);
    } catch (e) {
      print('Google Sign-In error EEE');
      print(e);
    }
  }

  Future<void> signOutWithGoogle() => _googleSignIn.disconnect();
}
