import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navbar.dart';

class personalData extends StatelessWidget {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navbar(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Change your data',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'user name',
                  prefix: Icon(Icons.verified_user)),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'email address',
                prefix: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'phone number',
                prefix: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 20),
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
