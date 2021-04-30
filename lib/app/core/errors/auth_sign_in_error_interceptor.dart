import 'package:easy_localization/easy_localization.dart';

import '../interfaces/error_interceptor_interface.dart';

class AuthSignInErrorInterceptor implements IErrorInterceptor {
  AuthSignInErrorInterceptor(String error);

  @override
  String handleError(String error) {
    print(error);
    switch (error) {
      case 'user-disabled':
        var msg = tr('auth.errors.user_disabled');
        return msg;

      case 'wrong-password':
        var msg = tr('auth.errors.wrong_password');
        return msg;

      case 'user-not-found':
        var msg = tr('auth.errors.user_not_found');
        return msg;

      case 'operation-not-allowed':
        return 'Esse email já está cadastrado, '
            'se já tem uma conta basta fazer o login!';

      case 'invalid-credencial':
        return 'Esse email já está cadastrado, '
            'se já tem uma conta basta fazer o login!';

      case 'invalid-verification-code':
        return 'Esse email já está cadastrado, '
            'se já tem uma conta basta fazer o login!';

      case 'invalid-verification-id':
        return 'Esse email já está cadastrado, '
            'se já tem uma conta basta fazer o login!';

      case 'account-exists-with-different-credencial':
        return 'Esse email já está cadastrado, '
            'se já tem uma conta basta fazer o login!';

      default:
        return 'Não foi possível realizar o registro, '
            'tente novamente mais tarde.';
    }
  }
}
