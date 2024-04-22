import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    _model = Provider.of<SignupModel>(context, listen: false);

    // On page load action.
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      Navigator.of(context).pushNamed('HomePage');
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    textStyle: Theme.of(context).textTheme.headline5,
                  ),
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _model.textController1,
                  focusNode: _model.textFieldFocusNode1,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                  ),
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: _model.textController1Validator,
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _model.textController2,
                  focusNode: _model.textFieldFocusNode2,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: _model.textController2Validator,
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _model.textController3,
                  focusNode: _model.textFieldFocusNode3,
                  autofocus: false,
                  obscureText: !_model.passwordVisibility1,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => _model.passwordVisibility1 =
                            !_model.passwordVisibility1,
                      ),
                      child: Icon(
                        _model.passwordVisibility1
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: _model.textController3Validator,
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _model.textController4,
                  focusNode: _model.textFieldFocusNode4,
                  autofocus: false,
                  obscureText: !_model.passwordVisibility2,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm your password',
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => _model.passwordVisibility2 =
                            !_model.passwordVisibility2,
                      ),
                      child: Icon(
                        _model.passwordVisibility2
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: _model.textController4Validator,
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  child: Text('Create Account'),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'By signing up, you agree to our ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pushNamed('TermsOfService');
                      },
                      child: Text(
                        'Terms of Service',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).accentColor,
                            ),
                      ),
                    ),
                    Text(
                      ' and ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pushNamed('PrivacyPolicy');
                      },
                      child: Text(
                        'Privacy Policy',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).accentColor,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed('HomePage');
                  },
                  child: Text('Go to Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
