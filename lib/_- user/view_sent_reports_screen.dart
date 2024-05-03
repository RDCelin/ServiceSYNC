import 'package:flutter/material.dart';
import 'package:your_app/models/report.dart';
import 'package:your_app/services/report_service.dart';

class ViewSentReportsScreen extends StatelessWidget {
  final ReportService reportService = ReportService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sent Reports'),
      ),
      body: FutureBuilder<List<Report>>(
        future: reportService.getSentReports(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final reports = snapshot.data!;
            return ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return ListTile(
                  title: Text('Client: ${report.clientId}'),
                  subtitle: Text('Description: ${report.description}'),
                  trailing: Text('Sent: ${report.sent ? 'Yes' : 'No'}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
