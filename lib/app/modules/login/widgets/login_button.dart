import 'package:cinemark_fake/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginButton extends StatelessWidget {
  final LoginController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
        width: double.infinity,
        child: Observer(
          builder: (_) {
            return AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: controller.isRegister.value ? 0 : 1,
              child: RaisedButton(
                onPressed: controller.isButtonLoginValid ? () {
                  if(controller.isLogin.value){
                    controller.login();
                  }
                  controller.setLoginPage(true);
                }: null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: theme.primaryColor,
                disabledColor: theme.accentColor,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
