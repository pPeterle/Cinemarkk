import 'package:cinemark_fake/app/shared/models/now_playing.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final Dio _dio;

  MovieRepository(this._dio);

  Future<List<NowPlaying>> fetchNowPlaying() async {
    try {
      final response =
          await _dio.get("templates/nowplaying/11?partnership=cinemark");
      final list = List<NowPlaying>();
      for (var json in response.data as List) {
        final movie = NowPlaying.fromJson(json);
        list.add(movie);
      }
      return list;
    } catch (e) {
      return Future.error(e.message);
    }
  }
}
