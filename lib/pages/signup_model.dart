import 'package:flutter/material.dart';

class SignupModel extends ChangeNotifier {
  late FocusNode unfocusNode;
  late FocusNode textFieldFocusNode1;
  late TextEditingController textController1;
  late String? Function(BuildContext, String?) textController1Validator;
  late FocusNode textFieldFocusNode2;
  late TextEditingController textController2;
  late String? Function(BuildContext, String?) textController2Validator;
  late FocusNode textFieldFocusNode3;
  late TextEditingController textController3;
  late bool passwordVisibility1;
  late String? Function(BuildContext, String?) textController3Validator;
  late FocusNode textFieldFocusNode4;
  late TextEditingController textController4;
  late bool passwordVisibility2;
  late String? Function(BuildContext, String?) textController4Validator;

  SignupModel() {
    unfocusNode = FocusNode();
    textFieldFocusNode1 = FocusNode();
    textController1 = TextEditingController();
    textFieldFocusNode2 = FocusNode();
    textController2 = TextEditingController();
    textFieldFocusNode3 = FocusNode();
    textController3 = TextEditingController();
    passwordVisibility1 = false;
    textFieldFocusNode4 = FocusNode();
    textController4 = TextEditingController();
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    // Dispose all focus nodes and text controllers
    unfocusNode.dispose();
    textFieldFocusNode1.dispose();
    textController1.dispose();
    textFieldFocusNode2.dispose();
    textController2.dispose();
    textFieldFocusNode3.dispose();
    textController3.dispose();
    textFieldFocusNode4.dispose();
    textController4.dispose();
    super.dispose();
  }
}
