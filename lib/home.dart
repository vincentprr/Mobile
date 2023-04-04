import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:td2_2223/AddTask.dart';
import 'package:td2_2223/mainview.dart';
import 'package:td2_2223/form/MyCustomForm.dart';
import 'package:td2_2223/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() =>
    _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    Ecran1(),
    Ecran2(),
    const Ecran3(),
    const EcranSettings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Application TD2',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddTask(),
                    ));
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox.shrink(),
    );
  }
}
