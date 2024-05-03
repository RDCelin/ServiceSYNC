import 'package:flutter/material.dart';
import 'package:servicesync/%7C-%20services/client_service.dart';
import 'package:your_app/models/client.dart';
import 'package:your_app/services/client_service.dart';

class ManageClientsScreen extends StatelessWidget {
  final ClientService clientService = ClientService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Clients'),
      ),
      body: FutureBuilder<List<Client>>(
        future: clientService.getClients(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final clients = snapshot.data!;
            return ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                final client = clients[index];
                return ListTile(
                  title: Text(client.name),
                  // Implementar funcionalidad de edición y eliminación
                  // onTap: () => _editClient(client),
                  // onLongPress: () => _deleteClient(client),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar funcionalidad para agregar un nuevo cliente
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AddClientScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
