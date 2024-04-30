import 'package:flutter/material.dart';

import 'signup_model.dart';
export 'signup_model.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late SignupModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = SignupModel(); // Creating instance of SignupModel
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Navigator.of(context).pushNamed('HomePage');
    });

    _model.textController1 = TextEditingController();
    _model.textFieldFocusNode1 = FocusNode();

    _model.textController2 = TextEditingController();
    _model.textFieldFocusNode2 = FocusNode();

    _model.textController3 = TextEditingController();
    _model.textFieldFocusNode3 = FocusNode();

    _model.textController4 = TextEditingController();
    _model.textFieldFocusNode4 = FocusNode();

    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    // Dispose text controllers and focus nodes
    _model.textController1!.dispose();
    _model.textController2!.dispose();
    _model.textController3!.dispose();
    _model.textController4!.dispose();
    _model.textFieldFocusNode1!.dispose();
    _model.textFieldFocusNode2!.dispose();
    _model.textFieldFocusNode3!.dispose();
    _model.textFieldFocusNode4!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_model.unfocusNode.canRequestFocus) {
          FocusScope.of(context).requestFocus(_model.unfocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // Using default TextStyle instead of GoogleFonts
                    letterSpacing: 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Enter your full name',
                      hintStyle: TextStyle(
                        // Using default TextStyle instead of GoogleFonts
                        letterSpacing: 0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(
                      // Using default TextStyle instead of GoogleFonts
                      letterSpacing: 0,
                    ),
                    validator: _model.textController1Validator.call,
                  ),
                ),
                // Similar TextFormField widgets for other fields
                // (omitted for brevity)
                // ...
                // FFButtonWidget for create account button
                // and Go to Home button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
