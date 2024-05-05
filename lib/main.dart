import 'package:flutter/material.dart';

import 'package:proyecto_movil/_-%20screens/view_reports_screen.dart';
import 'package:proyecto_movil/_-%20screens/manage_clients_screen.dart';

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
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              Colors.blue, // Use primarySwatch to generate a color scheme
        ).copyWith(
          // Define your custom background colors here
          background: Colors.white, // Example primary background color
          onBackground: Colors.grey, // Example secondary background color
        ),
        // Other theme properties...
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
              ManageClientsScreen(refreshCallback: () {}),
              ViewReportsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
