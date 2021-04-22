import 'package:mobx/mobx.dart';
import 'package:string_validator/string_validator.dart' as stringValidator;
import 'package:validators/validators.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  @observable
  String email = "";

  @action
  changeEmail(String value) {
    email = value;
    print(value);
  }

  @observable
  String password = "";

  @action
  changePassword(String value) => password = value;

  @computed
  bool get isFormValid {
    return validateEmail() == null && validatePassword() == null;
  }

  String? validateEmail() {
    var isValid = isNull(email);
    if (isValid) {
      return "Obrigatório";
    } else {
      var isValid = stringValidator.isEmail(email);
      if (isValid) {
        return null;
      } else {
        return "Inválido";
      }
    }
  }

  String? validatePassword() {
    var isValid = isNull(password);
    if (isValid) {
      return "Obrigatório";
    } else {
      var lenght = 8;
      var isValid = stringValidator.isLength(password, lenght);
      if (isValid) {
        return null;
      } else {
        return "Mín: $lenght digitos";
      }
    }
  }
}
