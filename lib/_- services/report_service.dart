import 'package:your_app/models/report.dart';

class ReportService {
  // Simulación de una lista de reportes
  List<Report> _reports = [
    Report(
        id: '1',
        userId: '1',
        clientId: '1',
        description: 'Reporte 1',
        startTime: DateTime.now(),
        duration: Duration(hours: 1)),
    Report(
        id: '2',
        userId: '1',
        clientId: '2',
        description: 'Reporte 2',
        startTime: DateTime.now(),
        duration: Duration(hours: 2)),
    Report(
        id: '3',
        userId: '2',
        clientId: '3',
        description: 'Reporte 3',
        startTime: DateTime.now(),
        duration: Duration(hours: 1)),
  ];

  // Método para obtener todos los reportes
  Future<List<Report>> getReports() async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    return _reports;
  }

  // Método para agregar un nuevo reporte
  Future<void> addReport(Report report) async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    _reports.add(report);
  }

  // Método para editar un reporte existente
  Future<void> editReport(Report report) async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    final index = _reports.indexWhere((r) => r.id == report.id);
    if (index != -1) {
      _reports[index] = report;
    }
  }

  // Método para eliminar un reporte
  Future<void> deleteReport(Report report) async {
    // Simular una llamada a una API o una base de datos
    await Future.delayed(Duration(seconds: 1));
    _reports.removeWhere((r) => r.id == report.id);
  }
}
