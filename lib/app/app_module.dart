import 'package:cinemark_fake/app/app_controller.dart';
import 'package:cinemark_fake/app/modules/home/home_module.dart';
import 'package:cinemark_fake/app/modules/login/login_module.dart';
import 'package:cinemark_fake/app/shared/repository/auth_repository.dart';
import 'package:cinemark_fake/app/shared/repository/local_storage_repository.dart';
import 'package:cinemark_fake/app/shared/repository/movie_repository.dart';
import 'package:cinemark_fake/app/shared/utils/api_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:cinemark_fake/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
        Bind((i) => MovieRepository(Modular.get<Dio>())),
        Bind((i) => AuthRepository()),
        Bind((i) => LocalStorageRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: LoginModule()),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
