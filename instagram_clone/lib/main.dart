import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/create_post.dart';
import 'package:instagram_clone/pages/home.dart';
import 'package:instagram_clone/pages/notifications.dart';
import 'package:instagram_clone/pages/profile.dart';
import 'package:instagram_clone/pages/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
    List<Widget> pages = [
      HomePage(),
      SearchPage(),
      CreatePostPage(),
      NotificationsPage(),
      ProfilePage()
    ];

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Instagram"),
        ),
        body: TabBarView(children: pages),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                icon: Icon(Icons.add),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
              ),
            ],
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
