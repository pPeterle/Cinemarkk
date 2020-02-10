import 'package:cinemark_fake/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomNavigation extends StatelessWidget {
  final HomeController controler = Modular.get();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Observer(
      builder: (_) {
        return BottomNavigationBar(
          backgroundColor: theme.backgroundColor,
          selectedItemColor: theme.primaryColor,
          currentIndex: controler.indexPage,
          unselectedItemColor: Colors.white30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              title: Text("Em Cartaz"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              title: Text("Sessao"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Favoritos"),
            )
          ],
          onTap: controler.setPage,
        );
      },
    );
  }
}
