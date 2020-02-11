import 'package:flutter/material.dart';
import 'package:flutter_app/tabs/map_tab.dart';
import 'package:flutter_app/tabs/list_tab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titre de la page'),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          MapTab(),
          ListTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
              await Navigator.of(context).pushNamed('addcompany');
        },
        child: Icon(Icons.business),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (int index) {
          setState(() {
            _tabController.index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Carte')),
          BottomNavigationBarItem(
              icon: Icon(Icons.line_weight), title: Text('Liste')),
        ],
      ),
    );
  }
}
