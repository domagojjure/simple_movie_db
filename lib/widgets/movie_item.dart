import 'package:flutter/material.dart';
import '../screens/movie_details_screen.dart';
import '../models/cast.dart';

class MovieItem extends StatelessWidget {
  final int id;
  final String releaseDate;
  final String title;
  final String imageUrl;
  final String overview;
  //final List<Cast> cast;
  MovieItem(
    this.id,
    this.releaseDate,
    this.title,
    this.imageUrl,
    this.overview,
  );

  void selectMovie(BuildContext context) {
    Navigator.of(context).pushNamed(MovieDetails.routeName,
        arguments: [id, title, imageUrl, overview]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMovie(context), //odavdje se ide u detalje filma
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black45,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_balance),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 140,
                        child: Text(
                          '${title}',
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule),
                          SizedBox(
                            width: 5,
                          ),
                          Text(releaseDate),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'glumac',
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
