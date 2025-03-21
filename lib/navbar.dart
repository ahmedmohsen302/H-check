import 'package:flutter/material.dart';
import 'package:loginz/PersonalData.dart';
import 'package:loginz/analysis.dart';
import 'package:loginz/login.dart';
import 'package:loginz/newPassword.dart';
import 'package:loginz/doctors.dart';
import 'package:loginz/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'advice.dart';

class navbar extends StatelessWidget {
  late String email;

  second(String e) {
    this.email = e;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(''),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/heart2.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.teal,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/heart teal.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (s) {
                return welcome();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.article_outlined),
            title: Text('Analysis'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (s) {
                return analysis();
              }));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('Some Advices'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (s) {
                return advices();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Doctors'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (s) {
                return doctors();
              }));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.door_sliding),
            title: Text('Log out'),
            onTap: () {
              Future<void> clearUserSession() async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();
              }

              Navigator.of(context).push(MaterialPageRoute(builder: (s) {
                return LoginPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
