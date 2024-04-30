import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class UClistadeUSModel extends ChangeNotifier {
  final unfocusNode = FocusNode();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  void initState() {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
