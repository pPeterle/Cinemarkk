// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  Computed<List<NowPlaying>> _$listFilteredComputed;

  @override
  List<NowPlaying> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<NowPlaying>>(() => super.listFiltered))
      .value;
  Computed<List<NowPlaying>> _$getFavoritesFilteredComputed;

  @override
  List<NowPlaying> get getFavoritesFiltered =>
      (_$getFavoritesFilteredComputed ??=
              Computed<List<NowPlaying>>(() => super.getFavoritesFiltered))
          .value;

  final _$isSearchAtom = Atom(name: '_HomeBase.isSearch');

  @override
  bool get isSearch {
    _$isSearchAtom.context.enforceReadPolicy(_$isSearchAtom);
    _$isSearchAtom.reportObserved();
    return super.isSearch;
  }

  @override
  set isSearch(bool value) {
    _$isSearchAtom.context.conditionallyRunInAction(() {
      super.isSearch = value;
      _$isSearchAtom.reportChanged();
    }, _$isSearchAtom, name: '${_$isSearchAtom.name}_set');
  }

  final _$indexPageAtom = Atom(name: '_HomeBase.indexPage');

  @override
  int get indexPage {
    _$indexPageAtom.context.enforceReadPolicy(_$indexPageAtom);
    _$indexPageAtom.reportObserved();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.context.conditionallyRunInAction(() {
      super.indexPage = value;
      _$indexPageAtom.reportChanged();
    }, _$indexPageAtom, name: '${_$indexPageAtom.name}_set');
  }

  final _$listItensAtom = Atom(name: '_HomeBase.listItens');

  @override
  ObservableList<NowPlaying> get listItens {
    _$listItensAtom.context.enforceReadPolicy(_$listItensAtom);
    _$listItensAtom.reportObserved();
    return super.listItens;
  }

  @override
  set listItens(ObservableList<NowPlaying> value) {
    _$listItensAtom.context.conditionallyRunInAction(() {
      super.listItens = value;
      _$listItensAtom.reportChanged();
    }, _$listItensAtom, name: '${_$listItensAtom.name}_set');
  }

  final _$listFavoritesAtom = Atom(name: '_HomeBase.listFavorites');

  @override
  ObservableList<NowPlaying> get listFavorites {
    _$listFavoritesAtom.context.enforceReadPolicy(_$listFavoritesAtom);
    _$listFavoritesAtom.reportObserved();
    return super.listFavorites;
  }

  @override
  set listFavorites(ObservableList<NowPlaying> value) {
    _$listFavoritesAtom.context.conditionallyRunInAction(() {
      super.listFavorites = value;
      _$listFavoritesAtom.reportChanged();
    }, _$listFavoritesAtom, name: '${_$listFavoritesAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_HomeBase.filter');

  @override
  String get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$getMoviesAsyncAction = AsyncAction('getMovies');

  @override
  Future getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  void toggleSearch() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.toggleSearch();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPage(int page) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setPage(page);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListItens(List<NowPlaying> list) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setListItens(list);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFavorite(NowPlaying movie) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setFavorite(movie);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }
}
