import 'package:cinemark_fake/app/modules/home/home_controller.dart';
import 'package:cinemark_fake/app/modules/home/widgets/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NowPlayingPage extends StatelessWidget {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: controller.listFiltered.length,
        itemBuilder: (_, index) {
          final movie = controller.listFiltered[index];
          return Movie(movie: movie);
        },
      );
    });
    // return FutureBuilder<List<NowPlaying>>(
    //   future: controller.nowPlaying,
    //   builder: (_, snapshot) {
    //     if (snapshot.hasError) {
    //       //showDialogError(context, snapshot.error);
    //       return RaisedButton(
    //         onPressed: () {
    //           showDialogError(context, snapshot.error);
    //         },
    //         child: Text("kpdsakodasokd"),
    //       );
    //     } else if (!snapshot.hasData) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else {
    //       r
    //     }
    //   },
    // );
  }
}
