import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loginz/resultWell.dart';
import 'analysis.dart';
import 'navbar.dart';
import 'resultNotWell.dart';

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navbar(),
      appBar: AppBar(
        // backgroundColor: Colors.teal,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.black],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: Text("About"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Welcome to',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'H-check',
                style: TextStyle(
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  ' Your heart health is of utmost importance, and our app is here to help you monitor and understand it. Heart disease is a serious condition that affects millions of people worldwide. It encompasses various cardiovascular conditions such as coronary artery disease, heart failure, arrhythmias, and more  click here to see your test.',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.teal.shade800, Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => analysis(),
                        ));
                  },
                  child: Text(
                    'Tests',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  minWidth: 200,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
