import 'package:cinemark_fake/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginText extends StatelessWidget {
  final LoginController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Observer(builder: (_) {
      return AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: controller.isLogin.value || controller.isRegister.value ? 0: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              "Cinemark",
              style: TextStyle(
                  fontSize: 50,
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 30),
            Text(
              "Welcome to \nthe new \nScope Cinemas",
              style: TextStyle(
                fontSize: 40,
                color: Color.fromRGBO(224, 224, 224, 1),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "New level of features \nwith new app",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white30,
              ),
            ),
          ],
        ),
      );
    });
  }
}
