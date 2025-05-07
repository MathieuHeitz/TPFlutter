import 'package:flutter/material.dart';

class LayoutHelper {

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600;
  }

  static double width(BuildContext context) {
    return  MediaQuery.of(context).size.width;
  }

  static Orientation orientation(BuildContext context) {
    return  MediaQuery.of(context).orientation;
  }
}

class ResponsiveNavigation extends StatefulWidget {

  const ResponsiveNavigation({super.key});

  @override
  State<StatefulWidget> createState() => _ResponsiveNavigation();
}

class _ResponsiveNavigation extends State<ResponsiveNavigation> {

  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    Center(child: Text('Accueil')),
    Center(child: Text('Profil')),
    Center(child: Text('Paramètres')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final isTablet = LayoutHelper.isTablet(context);
    final isLandscape = LayoutHelper.orientation(context) == Orientation.landscape;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('Navigation Adaptative'),
        ),
        drawer: isTablet || isLandscape
            ? Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Menu', style: TextStyle(color:Colors.white)),
              ),
              ListTile(
                title: const Text('Accueil'),
                selected: _selectedIndex == 0,
                onTap:  () => _onItemTapped(0),
              ),
              ListTile(
                title: const Text('Profil'),
                selected: _selectedIndex == 1,
                onTap:  () => _onItemTapped(1),
              ),
              ListTile(
                title: const Text('Paramètres'),
                selected: _selectedIndex == 2,
                onTap:  () => _onItemTapped(2),
              ),
            ],
          ),
        )
            : null,
        body: _pages[_selectedIndex],
        bottomNavigationBar: (!isTablet && !isLandscape)
            ? BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
          ],
        )
            : null
    );
  }

}