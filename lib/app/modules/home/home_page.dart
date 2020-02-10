import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemark_fake/app/modules/home/home_controller.dart';
import 'package:cinemark_fake/app/modules/home/page/favorites_page.dart';
import 'package:cinemark_fake/app/modules/home/page/now_playing_page.dart';
import 'package:cinemark_fake/app/modules/home/widgets/custom_bottom_navigation.dart';
import 'package:cinemark_fake/app/modules/home/widgets/home_app_bar.dart';
import 'package:cinemark_fake/app/modules/home/widgets/movie.dart';
import 'package:cinemark_fake/app/shared/mixins/dialod_mixin.dart';
import 'package:cinemark_fake/app/shared/models/now_playing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with DialogMixin {

  @override
  void initState() {
    super.initState();
    controller.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Observer(builder: (_) {
         if(controller.indexPage == 0) return NowPlayingPage();
         if(controller.indexPage == 1) return Container();
         if(controller.indexPage == 2) return FavoritesPage();
         else throw Exception("index errado");
      },
      ),
           
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
