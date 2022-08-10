import 'package:flutter/material.dart';
import 'package:kvn_media/views/popular_view.dart';
import 'package:kvn_media/views/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kvn Media',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.dark()
      ),
      home: const KvnHome(title: 'Kvn Media'),
    );
  }
}

class KvnHome extends StatefulWidget {
  const KvnHome({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<KvnHome> createState() => _KvnHomeState();
}

class _KvnHomeState extends State<KvnHome> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const PopularView(),
    const KvnScrollViewSearch(),
    // const AboutPage(),
    /*
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),*/
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // backgroundColor: const MaterialColor(0xFF202324, color),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: const MaterialColor(0xFF000000, color),
        // unselectedItemColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outlined),
            label: 'Popular',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
            // backgroundColor: Colors.green,
          ),
          /* BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'About',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              // backgroundColor: Colors.pink,
            ),*/
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
