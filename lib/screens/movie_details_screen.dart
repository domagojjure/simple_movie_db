import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cast.dart';

class MovieDetails extends StatelessWidget {
  static final routeName = '/movie-details';
  var selectedMovie = ['test1', 'test2', 'test3'];
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final passedArgumentsFromMovieItem =
        ModalRoute.of(context)!.settings.arguments as List<Object>;
    //final List<Cast> cast = passedArgumentsFromMovieItem[3] as List<Cast>;

    //final mealId = ModalRoute.of(context)!.settings.arguments as String;
    //final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text((passedArgumentsFromMovieItem[0] as String)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    passedArgumentsFromMovieItem[1] as String,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Description'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(passedArgumentsFromMovieItem[2] as String)),
                ),
                itemCount: 1,
              ),
            ),
            buildSectionTitle(context, 'Cast'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        ('CAST'),
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMovie.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
