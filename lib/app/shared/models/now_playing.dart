class NowPlaying {
  String id;
  String title;
  String originalTitle;
  String countryOrigin;
  int priority;
  String contentRating;
  String duration;
  String synopsis;
  String cast;
  String director;
  String distributor;
  bool inPreSale;
  String type;
  String urlKey;
  bool isPlaying;
  PremiereDate premiereDate;
  String creationDate;
  String city;
  String siteURL;
  bool isFavorite = false;
  List<Images> images;
  List<String> genres;
  List<String> tags;
  List<Trailers> trailers;

  NowPlaying(
      {this.id,
      this.title,
      this.originalTitle,
      this.countryOrigin,
      this.priority,
      this.contentRating,
      this.duration,
      this.synopsis,
      this.cast,
      this.director,
      this.distributor,
      this.inPreSale,
      this.type,
      this.urlKey,
      this.isPlaying,
      this.premiereDate,
      this.creationDate,
      this.city,
      this.siteURL,
      this.images,
      this.genres,
      this.isFavorite,
      this.tags,
      this.trailers});

  NowPlaying.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    originalTitle = json['originalTitle'];
    countryOrigin = json['countryOrigin'];
    priority = json['priority'];
    contentRating = json['contentRating'];
    duration = json['duration'];
    synopsis = json['synopsis'];
    cast = json['cast'];
    director = json['director'];
    distributor = json['distributor'];
    inPreSale = json['inPreSale'];
    type = json['type'];
    urlKey = json['urlKey'];
    isPlaying = json['isPlaying'];
    premiereDate = json['premiereDate'] != null
        ? new PremiereDate.fromJson(json['premiereDate'])
        : null;
    creationDate = json['creationDate'];
    city = json['city'];
    siteURL = json['siteURL'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    genres = json['genres'].cast<String>();
    tags = json['tags'].cast<String>();
    if (json['trailers'] != null) {
      trailers = new List<Trailers>();
      json['trailers'].forEach((v) {
        trailers.add(new Trailers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['originalTitle'] = this.originalTitle;
    data['countryOrigin'] = this.countryOrigin;
    data['priority'] = this.priority;
    data['contentRating'] = this.contentRating;
    data['duration'] = this.duration;
    data['synopsis'] = this.synopsis;
    data['cast'] = this.cast;
    data['director'] = this.director;
    data['distributor'] = this.distributor;
    data['inPreSale'] = this.inPreSale;
    data['type'] = this.type;
    data['urlKey'] = this.urlKey;
    data['isPlaying'] = this.isPlaying;
    if (this.premiereDate != null) {
      data['premiereDate'] = this.premiereDate.toJson();
    }
    data['creationDate'] = this.creationDate;
    data['city'] = this.city;
    data['siteURL'] = this.siteURL;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['genres'] = this.genres;
    data['tags'] = this.tags;
    if (this.trailers != null) {
      data['trailers'] = this.trailers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PremiereDate {
  String localDate;
  bool isToday;
  String dayOfWeek;
  String dayAndMonth;
  String hour;
  String year;

  PremiereDate(
      {this.localDate,
      this.isToday,
      this.dayOfWeek,
      this.dayAndMonth,
      this.hour,
      this.year});

  PremiereDate.fromJson(Map<String, dynamic> json) {
    localDate = json['localDate'];
    isToday = json['isToday'];
    dayOfWeek = json['dayOfWeek'];
    dayAndMonth = json['dayAndMonth'];
    hour = json['hour'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localDate'] = this.localDate;
    data['isToday'] = this.isToday;
    data['dayOfWeek'] = this.dayOfWeek;
    data['dayAndMonth'] = this.dayAndMonth;
    data['hour'] = this.hour;
    data['year'] = this.year;
    return data;
  }
}

class Images {
  String url;
  String type;

  Images({this.url, this.type});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}

class Trailers {
  String type;
  String url;
  String embeddedUrl;

  Trailers({this.type, this.url, this.embeddedUrl});

  Trailers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    embeddedUrl = json['embeddedUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    data['embeddedUrl'] = this.embeddedUrl;
    return data;
  }
}