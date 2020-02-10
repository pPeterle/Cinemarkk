import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../login_controller.dart';

class RegisterButton extends StatelessWidget {
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
              opacity: controller.isLogin.value ? 0 : 1,
              child: OutlineButton(
                  onPressed: controller.isButtonRegisterValid
                      ? () {
                          if (controller.isRegister.value) {
                            controller.registerUser();
                          }
                          controller.setRegisterPage(true);
                        }
                      : null,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  borderSide: BorderSide(color: theme.accentColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: theme.primaryColor,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          color: theme.accentColor,
                          fontSize: 22,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: theme.accentColor,
                      )
                    ],
                  )),
            );
          },
        ));
  }
}
