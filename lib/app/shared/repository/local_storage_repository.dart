import 'dart:async';

import 'package:cinemark_fake/app/modules/home/widgets/movie.dart';
import 'package:cinemark_fake/app/shared/models/now_playing.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageRepository {
  Completer<Box<String>> _instace = Completer<Box<String>>();

  LocalStorageRepository() {
    _init();
  }

  _init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    final box = await Hive.openBox<String>("db");
    _instace.complete(box);
  }

  Future saveMovie(NowPlaying movie) async {
    final box = await _instace.future;
    if (movie.isFavorite)
      box.put(movie.id, movie.id);
    else
      deleteMovie(movie);
  }

  Future deleteMovie(NowPlaying movie) async {
    final box = await _instace.future;
    box.delete(movie.id);
  }

  Future<List<String>> getFavorites() async {
    final box = await _instace.future;
    return box.values.toList();
  }
}
