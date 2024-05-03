import 'package:flutter/material.dart';
import 'package:your_app/services/report_service.dart';

class OfflineManager {
  final ReportService reportService = ReportService();

  // Método para sincronizar reportes cuando se recupera la conexión a internet
  Future<void> syncReports() async {
    final unsyncedReports = await reportService.getUnsyncedReports();
    for (var report in unsyncedReports) {
      await reportService.sendReport(report);
    }
  }
}
