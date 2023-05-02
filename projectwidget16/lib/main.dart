import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  void _onTappedItem(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  static const List<Widget> _pages = <Widget>[
  Icon(Icons.call,size: 150,)  ,
    Icon(Icons.camera,size: 150,),
    Icon(Icons.chat,size: 150,)
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        iconSize: 50,
        unselectedIconTheme: IconThemeData(
          color: Colors.greenAccent[50]
        ),
        selectedIconTheme: IconThemeData(
            color: Colors.teal[50]
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.call),label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.camera),label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'Chat'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text('Muhammed Essa'),
                accountEmail: Text('muhammed@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Text('ME',style: TextStyle(fontSize: 40),),
            ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text('ContactUS'),
              onTap: (){
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
      body:  Center(

        child:  _pages.elementAt(_selectedIndex),
      ),
     );
  }


}
