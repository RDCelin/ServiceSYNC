import 'package:flutter/material.dart';
import 'package:proyecto_movil/_-%20services/report_service.dart';

class SendReportScreen extends StatelessWidget {
  final ReportService reportService = ReportService();

  SendReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Report'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle button press to send report
          },
          child: Text('Send Report'),
        ),
      ),
    );
  }
}
