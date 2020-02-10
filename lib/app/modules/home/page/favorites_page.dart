import 'package:cinemark_fake/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesPage extends StatelessWidget {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: controller.getFavoritesFiltered.length,
          itemBuilder: (_, index) {
            final movie = controller.getFavoritesFiltered[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).backgroundColor,
              ),
              child: ListTile(
                title: Text(
                  movie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.only(left: 0),
                    child: Text(
                      "Ver Sessoes",
                      style: TextStyle(
                        color: Colors.greenAccent,
                      ),
                    )),
                    Spacer()
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.redAccent),
                  onPressed: () {
                    controller.setFavorite(movie);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
