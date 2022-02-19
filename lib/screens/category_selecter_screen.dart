import 'package:flutter/material.dart';
import 'package:simple_imdb/screens/list_screen_movies.dart';
import './list_screen_shows.dart';

class CategorySelecter extends StatelessWidget {
  static const routeName = '/category-selecter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('simple imdb')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(children: [
          Center(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ListScreenMovies.routeName);
                      },
                      child: Text(
                        'Top Movies',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ListScreenShows.routeName);
                      },
                      child: Text('Top Shows',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
