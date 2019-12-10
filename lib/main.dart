import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

void main() {

  //SystemChrome.setPreferredOrientations([
    //DeviceOrientation.landscapeLeft
  //]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Scrollables'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Activite> mesActivites = [
    Activite("Vélo", Icons.directions_bike),
    Activite("Peinture", Icons.palette),
    Activite("Golf", Icons.golf_course),
    Activite("Jeux Vidéos", Icons.videogame_asset),
    Activite("Bricolage", Icons.build),
    Activite("Vélo", Icons.directions_bike),
    Activite("Peinture", Icons.palette),
    Activite("Golf", Icons.golf_course),
    Activite("Jeux Vidéos", Icons.videogame_asset),
    Activite("Bricolage", Icons.build),
    Activite("Vélo", Icons.directions_bike),
    Activite("Peinture", Icons.palette),
    Activite("Golf", Icons.golf_course),
    Activite("Jeux Vidéos", Icons.videogame_asset),
    Activite("Bricolage", Icons.build),
    Activite("Vélo", Icons.directions_bike),
    Activite("Peinture", Icons.palette),
    Activite("Golf", Icons.golf_course),
    Activite("Jeux Vidéos", Icons.videogame_asset),
    Activite("Bricolage", Icons.build),
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    print(orientation);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ((orientation == Orientation.portrait)? liste() : grille()),
      ),
    );
  }

  Widget grille() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: mesActivites.length,
        itemBuilder: (context, i) {
          return Container(
            // margin: EdgeInsets.all(2.0),
            child: Card(
              elevation: 4.0,
              child: InkWell(
                onTap: (() => print('Tapped grille')),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(mesActivites[i].nom, style: TextStyle(color: Colors.teal, fontSize: 20.0),),
                    Icon(mesActivites[i].icone, color: Colors.teal, size: 45.0),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Widget liste() {
    return ListView.builder(
        itemCount: mesActivites.length,
        itemBuilder: (context, i) {
          Activite activite = mesActivites[i];
          String key = activite.nom;
          return new Dismissible(
            key: Key(key),
            child: Container(
              padding: EdgeInsets.all(5.0),
              height: 135.0,
              child: Card(
                elevation: 7.5,
                child: InkWell(
                  onTap: (() => print("Tapped")),
                  onLongPress: (() => print("Long pressed")),
                  child: new Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(activite.icone, color: Colors.teal[700], size: 75.0,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Activité', style: TextStyle(color: Colors.teal[200], fontSize: 20.0),),
                            Text(activite.nom, style: TextStyle(color: Colors.teal[700], fontSize: 30.0),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            background: Container(
              padding: EdgeInsets.only(right: 20.0),
              color: Colors.grey[800],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Supprimer",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.delete, color: Colors.white),
                ],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                print(activite.nom);
                mesActivites.removeAt(i);
              });
            },
          );
        });
  }

}

class Activite {
  String nom;
  IconData icone;

  Activite(this.nom, this.icone);
}
