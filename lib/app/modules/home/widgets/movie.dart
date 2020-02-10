import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemark_fake/app/modules/home/home_controller.dart';
import 'package:cinemark_fake/app/shared/mixins/dialod_mixin.dart';
import 'package:cinemark_fake/app/shared/models/now_playing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class Movie extends StatelessWidget with DialogMixin{
  final NowPlaying movie;
  final HomeController controller = Modular.get();

  Movie({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: movie.images.first.url,
            height: 160,
            placeholder: (context, url) => Container(
              color: theme.scaffoldBackgroundColor,
              height: 160,
              width: 160 * 0.7,
              child: Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => Container(
              color: theme.scaffoldBackgroundColor,
              height: 160,
              width: 160 * 0.7,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  movie.genres.first,
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          color: Colors.greenAccent,
                        ),
                        SizedBox(width: 8),
                        Text(
                          controller.getTimeString(movie.duration),
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellowAccent,
                          ),
                          SizedBox(width: 8),
                          Text(
                            movie.priority.toString(),
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () async {
                          if (await canLaunch(movie.trailers.first.url)) {
                            launch(movie.trailers.first.url);
                          } else {
                            showDialogError(context, "Trailer nao encontrado");
                          }
                        },
                        color: theme.primaryColor,
                        child: Text(
                          "Trailer",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          movie.isFavorite? Icons.favorite:  Icons.favorite_border,
                          color: Colors.redAccent,
                        ),
                        onPressed: () {
                          controller.setFavorite(movie);
                        }),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
