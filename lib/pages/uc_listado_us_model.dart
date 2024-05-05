import 'package:flutter/material.dart';

//import 'package:flutter_animate/flutter_animate.dart';
//import 'package:flutterflow_ui/flutterflow_ui.dart';
class UClistadeUSModel extends ChangeNotifier {
  final unfocusNode = FocusNode();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  void initState() {}

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
