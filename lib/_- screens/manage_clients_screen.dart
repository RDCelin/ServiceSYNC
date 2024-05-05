import 'package:flutter/material.dart';
import 'package:proyecto_movil/_-%20services/client_service.dart';
import 'package:proyecto_movil/_-%20models/client.dart';

//import 'package:get/get.dart';
// ignore: must_be_immutable
class ManageClientsScreen extends StatelessWidget {
  final ClientService clientService = ClientService();
  final Function refreshCallback; // Callback function to refresh the UI
  int n = 3;

  ManageClientsScreen({super.key, required this.refreshCallback});
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
          openDialog(context); // Call the openDialog function
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Define openDialog function
  Future<void> openDialog(BuildContext context) async {
    String? _textFieldValue; // Variable to store the value of the text field
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Nombre cliente'), // Use quotes for string literals
        content: TextField(
          onChanged: (value) {
            _textFieldValue = value; // Update the value of the text field
          },
        ),
        actions: [
          ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cerrar'),
            ),
            TextButton(
              onPressed: () async {
                // Check if the text field is not empty
                if (_textFieldValue != null && _textFieldValue!.isNotEmpty) {
                  await ClientService().addClient(
                      Client(id: n.toString(), name: _textFieldValue!));
                  n = n + 1; // Increment the id counter
                  refreshCallback();

                  print(await clientService.getClients());
                  Navigator.of(context).pop();
                } else {
                  // Show a snackbar if the text field is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter a valid client name.'),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            )
          ]),
        ],
      ),
    );
  }
}
