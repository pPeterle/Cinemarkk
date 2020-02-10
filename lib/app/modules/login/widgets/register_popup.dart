import 'package:cinemark_fake/app/modules/login/login_controller.dart';
import 'package:cinemark_fake/app/modules/login/widgets/animation_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_input.dart';

class RegisterPopup extends StatelessWidget {
  final LoginController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimationPopup(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                elevation: 0,
                backgroundColor: theme.backgroundColor,
                leading: IconButton(
                  onPressed: () {
                    controller.setRegisterPage(false);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  "Register",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
              SizedBox(height: 12),
              LoginInput(
                label: "Email",
                onTextChanged: controller.changeEmail,
              ),
              LoginInput(
                label: "Password",
                onTextChanged: controller.changePassword,
                obscureText: true,
              ),
              LoginInput(
                label: "Confirm Password",
                onTextChanged: controller.changeConfirmPassword,
                obscureText: true,
              ),
              SizedBox(height: 15),
              Center(
                child: Observer(
                  builder: (_) {
                    if (controller.registerError != null)
                      return Text(
                        controller.registerError,
                        style: TextStyle(color: Colors.redAccent),
                      );
                    else
                      return Container();
                  },
                ),
              )
            ],
          ),
        ),
      ),
      isShow: controller.isRegister,
    );
  }
}
