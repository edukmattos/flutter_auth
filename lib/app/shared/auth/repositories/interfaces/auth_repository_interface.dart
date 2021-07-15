import '../../../../core/responses/response_default.dart';

abstract class IAuthRepository {
  Future<DefaultResponse> authRepoSignInWithGoogle();
  Future<DefaultResponse> authRepoSignInEmailPassword({
    required String email,
    required String password,
  });
  Future<DefaultResponse> authRepoPasswordReset(String email);
  Future<DefaultResponse> authRepoSignUpEmailPassword(
      {required String email, required String password});

  Future<void> authRepoSignOutWithGoogle();
}
