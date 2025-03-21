import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'navbar.dart';

class doctors extends StatefulWidget {
  late String email;

  navbar(String e) {
    this.email = e;
  }

  @override
  _doctorsState createState() => _doctorsState();
}

class _doctorsState extends State<doctors> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Dr Ali", "age": 22, "phone": 3432455},
    {"id": 2, "name": "Dr Ahmed", "age": 22, "phone": 98989},
    {"id": 3, "name": "Dr mahmoud", "age": 22, "phone": 736462},
    {"id": 4, "name": "Dr ayman ", "age": 35, "phone": 67234},
    {"id": 5, "name": "Dr Candy", "age": 30, "phone": 56779},
    {"id": 6, "name": "Dr Colin", "age": 55, "phone": 234},
    {"id": 7, "name": "Dr Audra", "age": 30, "phone": 1294588},
    {"id": 8, "name": "Dr Banana", "age": 35, "phone": 4577},
    {"id": 9, "name": "Dr Caversky", "age": 43, "phone": 6745},
    {"id": 10, "name": "Dr Becky", "age": 32, "phone": 198458},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: navbar(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.black],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: const Text('Doctors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.teal.shade700,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          trailing: Text(
                              'Phone Number : ${_foundUsers[index]["phone"].toString()} ',
                              style: TextStyle(color: Colors.white)),
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                          title: Text(_foundUsers[index]['name'],
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                              '${_foundUsers[index]["age"].toString()} years old',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
