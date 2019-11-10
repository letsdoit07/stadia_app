import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stadia App',
      theme: ThemeData(primarySwatch: Colors.deepOrange, fontFamily: "Raleway"),
      home: MainScreen(),
    );
  }
}

var screens = [HomeScreen(), HomeScreen(), ExploreScreen()];

class MainScreen extends StatefulWidget { 
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          MdiIcons.ticket,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {}),
                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.videogame_asset,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(
                              Icons.group,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/images/profile.png",
                          width: 25,
                          height: 25,
                        )
                      ],
                    )
                  ],
                ),
              ),
              screens[_selectedIndex],
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BottomNavigationBar(
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  unselectedIconTheme: IconThemeData(size: 20.0),
                  selectedIconTheme: IconThemeData(size: 30.0),
                  unselectedFontSize: 15.0,
                  unselectedItemColor: Colors.white,
                  selectedItemColor: Colors.deepOrange,
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    this.setState(() {
                      _selectedIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Store"),
                        ),
                        icon: Icon(Icons.shopping_basket)),
                    BottomNavigationBarItem(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Home"),
                        ),
                        icon: Icon(Icons.games)),
                    BottomNavigationBarItem(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Explore"),
                        ),
                        icon: Icon(Icons.explore))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final gameImages = ["apex", "destiny", "fc3", "mk11", "nfs", "pubg"];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        children: List.generate(gameImages.length, (index) {
          return Card(
            child: Image.asset("assets/images/${gameImages[index]}.jpg", fit: BoxFit.cover),
          );
        }),
      ),
    ));
  }
}

class ExploreScreen extends StatelessWidget {
  final data = [
    {
      "banner": "apex_banner",
      "title": "Youtube",
      "message": "Welcome to Youtube"
    },
    {
      "banner": "destiny_banner",
      "title": "Stadia",
      "message": "Stadia Community Forums"
    },
    {"banner": "pubg_banner", "title": "Youtube", "message": "PUBG Events"}
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          "assets/images/stadia_mono.png",
          color: Colors.white10,
          fit: BoxFit.cover,
          scale: 10.0,
          alignment: Alignment.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(MdiIcons.youtube),
                          color: Colors.white,
                          onPressed: () {}),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          icon: Icon(MdiIcons.reddit),
                          color: Colors.white,
                          onPressed: () {}),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          icon: Icon(MdiIcons.twitter),
                          color: Colors.white,
                          onPressed: () {}),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          icon: Icon(MdiIcons.facebook),
                          color: Colors.white,
                          onPressed: () {}),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          icon: Icon(MdiIcons.instagram),
                          color: Colors.white,
                          onPressed: () {}),
                    ],
                  ),
                ),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/${data[index]["banner"]}.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox.expand(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.black87,Colors.transparent
                                        ],
                                        begin: Alignment.bottomCenter,end: Alignment.topCenter)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text(data[index]["title"],style: TextStyle(color: Colors.white,fontSize: 15),),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(data[index]["message"],style: TextStyle(color: Colors.white,fontSize: 25.0),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      );
                    })
              ],
            ),
          ),
        )
      ],
    ));
  }
}
