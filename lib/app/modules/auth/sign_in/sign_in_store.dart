import 'package:mobx/mobx.dart';
import 'package:queen_validators/queen_validators.dart';

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
    return validateEmail() == null;
  }

  String? validateEmail() {
    print(email.isEmail);

    if (email.isEmpty) {
      // Check is Null
      return "Obrigatório";
    } else {
      if (email.isEmail) {
        // Check is Email
        return null;
      } else {
        return "Inválido";
      }
    }
  }
}
