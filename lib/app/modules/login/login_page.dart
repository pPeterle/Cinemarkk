import 'package:cinemark_fake/app/modules/login/login_controller.dart';
import 'package:cinemark_fake/app/modules/login/widgets/login_button.dart';
import 'package:cinemark_fake/app/modules/login/widgets/login_popup.dart';
import 'package:cinemark_fake/app/modules/login/widgets/login_text.dart';
import 'package:cinemark_fake/app/modules/login/widgets/register_button.dart';
import 'package:cinemark_fake/app/modules/login/widgets/register_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final LoginController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  LoginText(),
                  SizedBox(
                    height: 40,
                  ),
                  LoginButton(),
                  SizedBox(height: 15),
                  RegisterButton(),
                  SizedBox(height: 15),
                  Observer(
                    builder: (_) {
                      if (controller.isLoading)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else
                        return Container();
                    },
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: LoginPopup(),
            ),
            Positioned(
              top: 0,
              child: RegisterPopup(),
            ),
          ],
        ),
      ),
    );
  }
}
