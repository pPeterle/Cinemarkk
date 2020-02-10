import 'package:cinemark_fake/app/shared/repository/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  final AuthRepository _authRepository = Modular.get();

  Observable<bool> isLogin = Observable(false);

  Observable<bool> isRegister = Observable(false);

  @observable
  String email;

  @observable
  String password;

  @observable
  String confirmPassword;

  @observable
  String registerError;

  @observable
  String loginError;

  @observable
  bool isLoading = false;

  @computed
  bool get isButtonRegisterValid {
    if ((email != null &&
            email.isNotEmpty &&
            password != null &&
            password.isNotEmpty &&
            confirmPassword != null &&
            confirmPassword.isNotEmpty &&
            confirmPassword == password &&
            !isLoading) ||
        !isRegister.value) {
      return true;
    } else
      return false;
  }

  @computed
  get isButtonLoginValid {
    if ((email != null &&
            email.isNotEmpty &&
            password != null &&
            password.isNotEmpty &&
            !isLoading) ||
        !isLogin.value) {
      return true;
    } else
      return false;
  }

  _LoginBase(){
    _init();
  }

  void _init() {
    _authRepository.getUser().then((user) {
      if (user != null) {
        Modular.to.pushReplacementNamed("/home");
      }
    });
  }

  @action
  setLoginPage([bool value = true]) {
    isLogin.value = value;
    isRegister.value = false;
  }

  @action
  setRegisterPage([bool value = true]) {
    isRegister.value = value;
    isLogin.value = false;
  }

  @action
  void changeEmail(String e) => email = e;

  @action
  void changePassword(String p) => password = p;

  @action
  void changeConfirmPassword(String p) => confirmPassword = p;

  @action
  Future registerUser() async {
    isLoading = true;
    _authRepository.createUser(email, password).catchError((error) {
      registerError = error;
      isLoading = false;
    }).then((user) {
      isLoading = false;
      if (user != null) {
        Modular.to.pushReplacementNamed("/home");
      }
    });
  }

  Future login() async {
    isLoading = true;
    _authRepository.login(email, password).catchError((error) {
      loginError = error;
      isLoading = false;
    }).then((user) {
      isLoading = false;
      if (user != null) {
        Modular.to.pushReplacementNamed("/home");
      }
    });
  }
}
