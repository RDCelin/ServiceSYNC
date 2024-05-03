import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
          // Define your app's theme here.
          ),
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late FocusNode _textFieldFocusNode1;
  late FocusNode _textFieldFocusNode2;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textFieldFocusNode1 = FocusNode();

    _textController2 = TextEditingController();
    _textFieldFocusNode2 = FocusNode();
//añadir !. donde esta  . cuando pueda ser null
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _textController1.text = 'Username';
      _textController2.text = 'Password';
    });
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textFieldFocusNode1.dispose();

    _textController2.dispose();
    _textFieldFocusNode2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _textFieldFocusNode1.canRequestFocus
            ? FocusScope.of(context).requestFocus(_textFieldFocusNode1)
            : FocusScope.of(context).unfocus();
        _textFieldFocusNode2.canRequestFocus
            ? FocusScope.of(context).requestFocus(_textFieldFocusNode2)
            : FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'ServiceSYNC',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _textController1,
                      focusNode: _textFieldFocusNode1,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _textController2,
                      focusNode: _textFieldFocusNode2,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Signup');
                    },
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
