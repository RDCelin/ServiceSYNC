import 'package:flutter/material.dart';
import 'package:your_app/screens/manage_clients_screen.dart';
import 'package:your_app/screens/view_reports_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Your App'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Manage Clients'),
                Tab(text: 'View Reports'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ManageClientsScreen(),
              ViewReportsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
