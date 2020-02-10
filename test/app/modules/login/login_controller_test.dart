import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cinemark_fake/app/modules/login/login_controller.dart';
import 'package:cinemark_fake/app/modules/login/login_module.dart';

void main() {
  initModule(LoginModule());
  LoginController login;

  setUp(() {
    login = LoginModule.to.get<LoginController>();
  });
}
 