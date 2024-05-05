import 'package:proyecto_movil/_-%20models/client.dart';
//import 'package:get/get.dart';

class ClientService {
  List<Client> get _clients => [
        Client(id: '1', name: 'Cliente 1'),
        Client(id: '2', name: 'Cliente 2'),
        Client(id: '3', name: 'Cliente 3'),
      ];
  //final _clients = List<Client>.empty().obs;
  //void addClient(Client client) {
  //_clients.add(client);
  // Método para obtener todos los clientes
  Future<List<Client>> getClients() async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    return _clients;
  }

  // Método para agregar un nuevo cliente
  Future<void> addClient(Client client) async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    _clients.add(client);
  }

  // Método para editar un cliente existente
  Future<void> editClient(Client client) async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    final index = _clients.indexWhere((c) => c.id == client.id);
    if (index != -1) {
      _clients[index] = client;
    }
  }

  // Método para eliminar un cliente
  Future<void> deleteClient(Client client) async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    _clients.removeWhere((c) => c.id == client.id);
  }
}
