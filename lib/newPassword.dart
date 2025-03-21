import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'navbar.dart';

class newPassword extends StatelessWidget {
  var passwordController = TextEditingController();
  var cPasswordController = TextEditingController();
  var nPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navbar(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('change your password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: nPasswordController,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'old password',
                  prefix: Icon(Icons.lock),
                  suffix: Icon(Icons.remove_red_eye)),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'New password',
                  prefix: Icon(Icons.lock),
                  suffix: Icon(Icons.remove_red_eye)),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              controller: cPasswordController,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'confirm new password',
                  prefix: Icon(Icons.lock),
                  suffix: Icon(Icons.remove_red_eye)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
