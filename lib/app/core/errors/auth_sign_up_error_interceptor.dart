import '../interfaces/error_interceptor_interface.dart';

class AuthSignUpErrorInterceptor implements IErrorInterceptor {
  @override
  String handleError(String error) {
    switch (error) {
      case 'weak-password':
        return 'Acho que essa senha está muito curta, tente uma maior!';
      case 'invalid-email':
        return 'Ops! Esse email é inválido!';
      case 'operation-not-allowed':
        return 'Esse email já está cadastrado,'
            'se já tem uma conta basta fazer o login!';
      case 'email-already-in-use':
        return 'Esse email já está cadastrado,'
            'se já tem uma conta basta fazer o login!';
      default:
        return 'Não foi possível realizar o registro,'
            'tente novamente mais tarde.';
    }
  }
}
