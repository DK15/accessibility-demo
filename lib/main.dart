import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(new MyAppPage());

class MyAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accessibility Demo',
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Accessibility Demo'),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(15.0),
          //  child: FormUI()
          child: new Form(
            child: FormUI(),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return Column(
      children: <Widget>[
        Image.asset('assets/images.png', height: 100, width: 100, semanticLabel: 'Company logo'),

          // If you are using image from network, then wrap CachedNetworkImage with Semantics and use label property
//        Semantics(
//          child: CachedNetworkImage(
//            imageUrl: 'https://picsum.photos/250?image=9', height: 100, width: 100,
//          ),
//          label: 'Company logo',
//        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: 'Username',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Password',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye, semanticLabel: 'Password obscure',),
                  onPressed: () {},
                )
            ),
            obscureText: true,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Save username?'),
              Switch(
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeColor: Colors.green,
                activeTrackColor: Colors.greenAccent,
                value: isSwitched,
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  _showToastMessage();
                },
              )
            ],
          ),
        ),
        MergeSemantics(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_circle, semanticLabel: 'name'),
                title: Text("John Doe", style: TextStyle(color: Colors.blue),),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.email, semanticLabel: 'email',),
                title: Text("johndoe@test.com", style: TextStyle(color: Colors.blue),),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.business, semanticLabel: 'company name'),
                title: Text("ABC Inc.", style: TextStyle(color: Colors.blue),),
                onTap: () {},
              ),
            ],
          ),
        )
      ]
    );
  }

  void _showToastMessage() {
    Fluttertoast.showToast(
        msg: "This is Center Long Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}