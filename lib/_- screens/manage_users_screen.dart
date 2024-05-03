import 'package:flutter/material.dart';
import 'package:your_app/models/user.dart';
import 'package:your_app/services/user_service.dart';

class ManageUsersScreen extends StatelessWidget {
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Users'),
      ),
      body: FutureBuilder<List<User>>(
        future: userService.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  // Implementar funcionalidad de edición y eliminación
                  // onTap: () => _editUser(user),
                  // onLongPress: () => _deleteUser(user),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar funcionalidad para agregar un nuevo usuario
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
