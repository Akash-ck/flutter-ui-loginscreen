import 'package:flutter/material.dart';
import 'dart:convert';

class gridview extends StatefulWidget {
  @override
  _gridviewState createState() => _gridviewState();
}

class _gridviewState extends State<gridview> {


  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("FROM json FILE"),
      ),
      body: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/templates.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var newData = json.decode(snapshot.data.toString());

              return Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              height: 300,
                              width: 200,
                              child: Image.asset(
                                newData[index]['image'],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              newData[index]['name'],
                            ),
                            subtitle: Text(
                              newData[index]['description'],
                              //'Note Text',
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              );
            }),
      ),
    );
  }
}


