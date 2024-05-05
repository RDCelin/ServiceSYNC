import 'package:proyecto_movil/_-%20models/user.dart';

class UserService {
  // Simulación de una lista de usuarios
  List<User> _users = [
    User(
        id: '1',
        name: 'Usuario 1',
        email: 'usuario1@example.com',
        role: 'coordinator'),
    User(
        id: '2',
        name: 'Usuario 2',
        email: 'usuario2@example.com',
        role: 'support'),
    User(
        id: '3',
        name: 'Usuario 3',
        email: 'usuario3@example.com',
        role: 'support'),
  ];

  // Método para obtener todos los usuarios
  Future<List<User>> getUsers() async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    return _users;
  }

  // Método para agregar un nuevo usuario
  Future<void> addUser(User user) async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    _users.add(user);
  }

  // Método para editar un usuario existente
  Future<void> editUser(User user) async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
    }
  }

  // Método para eliminar un usuario
  Future<void> deleteUser(User user) async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    _users.removeWhere((u) => u.id == user.id);
  }
}
