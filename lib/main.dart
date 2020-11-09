import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_test/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controllerX = new TextEditingController();
  final TextEditingController _controllerY = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _controllerX,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: "Column",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Value Can\'t Be Empty';
                    } else if (value == "0") {
                      return 'Value Can\'t Be Zero';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controllerY,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: "Row",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Value Can\'t Be Empty';
                    } else if (value == "0") {
                      return 'Value Can\'t Be Zero';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondPage(
                                  column: int.parse(_controllerX.text),
                                  row: int.parse(_controllerY.text),
                                )),
                      );
                    }
                  },
                  child: Text("submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
