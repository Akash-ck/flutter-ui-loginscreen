import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:log/login.dart';
import 'package:log/user.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    List data;
    int currentIndex = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('Listview using local json file'),
        ),
        bottomNavigationBar: GestureDetector(
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              items: [


                BottomNavigationBarItem(
                    icon: Icon(Icons.verified),
                    label: 'Template',
                    backgroundColor: Colors.red),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                    backgroundColor: Colors.greenAccent),

              ],

              onTap: (index) {
                setState(() {
                  currentIndex = index;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsUI()));

                });
              }),
        ),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/templates.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var newData = json.decode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 250,
                            child: Image.asset(newData[index]['image']),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            newData[index]['name'],
                            //'Note Title',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            newData[index]['description'],
                            //'Note Text',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 10),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                      //SizedBox(width: 20),
                    ],
                  );
                },
                itemCount: newData == null ? 0 : newData.length,
              );
            },
          ),
        ));
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Screen 1")),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(child: Text("Screen 2")),
    );
  }
}
