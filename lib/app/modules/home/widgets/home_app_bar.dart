import 'package:cinemark_fake/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController controller = Modular.get();
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Observer(
      builder: (_) {
        return AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          leading: controller.isSearch
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    controller.toggleSearch();
                  },
                )
              : IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: controller.logout,
                ),
          title: controller.isSearch
              ? TextField(
                  cursorColor: Colors.white,
                  autofocus: true,
                  controller: _editingController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hoverColor: Colors.white,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  onChanged: (text) {
                    controller.filter = text;
                  },
                )
              : Text(
                  "Cinemark",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            controller.isSearch
                ? IconButton(
                    icon: Icon(
                      Icons.cancel,
                      size: 28,
                    ),
                    onPressed: () {
                      _editingController.text = '';
                      controller.filter = '';
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 28,
                    ),
                    onPressed: () {
                      controller.toggleSearch();
                    },
                  ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
