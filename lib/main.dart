import 'package:flutter/material.dart';
import './screens/category_selecter_screen.dart';
import 'screens/list_screen_movies.dart';
import './screens/list_screen_shows.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'simple imdb',
      home: CategorySelecter(),
      routes: {
        CategorySelecter.routeName: (ctx) => CategorySelecter(),
        ListScreenMovies.routeName: ((ctx) => ListScreenMovies()),
        ListScreenShows.routeName: (ctx) => ListScreenShows(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: ((context) =>
                CategorySelecter())); //ovo je kad se ne zna di se ide pa defualt screen
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple imdb'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
