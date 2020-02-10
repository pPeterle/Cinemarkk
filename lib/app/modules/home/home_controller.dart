import 'package:cinemark_fake/app/modules/home/widgets/movie.dart';
import 'package:cinemark_fake/app/shared/models/now_playing.dart';
import 'package:cinemark_fake/app/shared/repository/auth_repository.dart';
import 'package:cinemark_fake/app/shared/repository/local_storage_repository.dart';
import 'package:cinemark_fake/app/shared/repository/movie_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  MovieRepository _repository = Modular.get();
  AuthRepository _authRepository = Modular.get();
  LocalStorageRepository _localStorageRepository = Modular.get();

  @observable
  bool isSearch = false;

  @observable
  int indexPage = 0;

  @observable
  ObservableList<NowPlaying> listItens = List<NowPlaying>().asObservable();

  @observable
  ObservableList<NowPlaying> listFavorites = List<NowPlaying>().asObservable();

  @observable
  String filter = '';

  @computed
  List<NowPlaying> get listFiltered {
    if (filter.isEmpty)
      return listItens;
    else {
      return listItens
          .where(
              (item) => item.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @computed
  List<NowPlaying> get getFavoritesFiltered {
    if (filter.isEmpty)
      return listFavorites;
    else {
      return listFavorites
          .where(
              (item) => item.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @action
  getMovies() async {
    final list = await _repository.fetchNowPlaying();
    final favorites = await _localStorageRepository.getFavorites();
    list.map((item) {
      if (favorites.contains(item.id)) {
        item.isFavorite = true;
      }
      return item;
    }).toList();
    listFavorites = list.where((element) => element.isFavorite).toList().asObservable();
    listItens = list.asObservable();
  }

  @action
  void toggleSearch() => isSearch = !isSearch;

  @action
  void setPage(int page) => indexPage = page;

  @action
  void setListItens(List<NowPlaying> list) {
    listItens = list.asObservable();
  }

  @action
  setFavorite(NowPlaying movie) {
    if (movie.isFavorite) {
      movie.isFavorite = false;
      listFavorites.remove(movie);
    } else {
      movie.isFavorite = true;
      listFavorites.add(movie);
    }
    final position = listItens.indexOf(movie);
    listItens.removeWhere((element) => element.id == movie.id);
    listItens.insert(position, movie);
    _localStorageRepository.saveMovie(movie);
  }

  String getTimeString(String time) {
    int hours = (int.parse(time) / 60).truncate();
    int minutes = int.parse(time) - (60 * hours);

    return hours.toString() + "h" + " $minutes" + "m";
  }

  void logout() async {
    await _authRepository.logout();
    Modular.to.pushReplacementNamed("/");
  }
}
