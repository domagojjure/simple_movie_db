import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cast.dart';
import '../api/api.dart';

class MovieDetails extends StatelessWidget {
  static final routeName = '/movie-details';
  final api = new ApiService();

  Widget getCast(int movieId, int index) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none ||
            projectSnap.data == null) {
          print(movieId);
          //print('project snapshot data is: ${projectSnap.data}');
          return Container(
            child: Text('Null'),
          );
        } else {
          final List<Cast> castData = projectSnap.data as List<Cast>;
          return Text(
              '${castData[index].name} as ${castData[index].character} ');
        }
      },
      future: ApiService().getCastList(movieId as int),
    );
  }

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

  Widget buildContainer2(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 300,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final passedArgumentsFromMovieItem =
        ModalRoute.of(context)!.settings.arguments as List<Object>;
    final movieId = passedArgumentsFromMovieItem[0];

    //final List<Cast> cast = passedArgumentsFromMovieItem[3] as List<Cast>;

    //final mealId = ModalRoute.of(context)!.settings.arguments as String;
    //final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text((passedArgumentsFromMovieItem[1] as String)),
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
                    passedArgumentsFromMovieItem[2] as String,
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
                      child: Text(passedArgumentsFromMovieItem[3] as String)),
                ),
                itemCount: 1,
              ),
            ),
            buildSectionTitle(context, 'Cast'),
            buildContainer2(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: getCast(movieId as int,
                            index) //Text('${movieId}'), //getCast(movieId as int),
                        ),
                    Divider()
                  ],
                ),
                itemCount: 10, //ovo je duljina glumaca
              ),
            ),
          ],
        ),
      ),
    );
  }
}
