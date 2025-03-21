import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loginz/resultWell.dart';
import 'ResultNotWell.dart';
import 'navbar.dart';

class analysis extends StatefulWidget {
  @override
  State<analysis> createState() => _analysisState();
}

class _analysisState extends State<analysis> {
  final ageController = TextEditingController();

  final sexController = TextEditingController();

  final chestPainController = TextEditingController();

  final bloodSugarController = TextEditingController();

  final restingElectrograficController = TextEditingController();

  final exerciseIndusedAnginaController = TextEditingController();

  final slopeController = TextEditingController();

  final majorVesselesController = TextEditingController();

  final thalController = TextEditingController();

  final rsetBloodPressureController = TextEditingController();

  final cholestroleController = TextEditingController();

  final maxHeartRateController = TextEditingController();

  final stDepressionController = TextEditingController();

  int age = 20;

  bool isMale = true;
  bool _isLoading = false;

  var formKey = GlobalKey<FormState>();

  int finalThal = 0;

  int finalChest = 0;

  int finalSlope = 0;

  int finalEcg = 0;

  int finalGender = 0;

  int finalExang = 0;

  List<String> thalList = [
    'Normal',
    'Fixed defect',
    'Reversible defect',
    'Unknown'
  ];

  String? thalItem = 'Normal';

  String thalFinal = '';

  List<String> chestList = [
    'Typical angina',
    'Atypical angina',
    'Non-anginal pain',
    'Asymptomatic'
  ];

  String? chestItem = 'Typical angina';

  String chestFinal = '';

  List<String> slopeList = [
    'Up sloping',
    'Flat',
    'Downsloping',
  ];

  String? slopeItem = 'Up sloping';

  String slopeFinal = '';

  List<String> ecgList = [
    'Normal',
    'ST-T wave Abnormality',
    'probable or definite LVH',
  ];

  String? ecgItem = 'Normal';

  String ecgFinal = '';

  List<String> genderList = [
    'Male',
    'Female',
  ];

  String? genderItem = 'Male';

  String genderFinal = '';

  List<String> exangList = [
    'Induced angina',
    'No induced angina',
  ];

  String? exangItem = 'Induced angina';

  String exangFinal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Analysis'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: ageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        final double? number = double.tryParse(value);
                        if (number == null || number < 1.0 || number > 100.0) {
                          return 'number between 1.0 and 100.0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(), labelText: 'Age'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Gender'),
                        value: genderItem,
                        items: genderList
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        onChanged: (item) => setState(() {
                              genderItem = item;
                              genderFinal = genderItem!;
                              if (genderItem == 'Female') {
                                finalGender = 0;
                              } else if (genderItem == 'Male') {
                                finalGender = 1;
                              }
                              print(finalGender);
                            }))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Chest pain type'),
                        value: chestItem,
                        items: chestList
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        onChanged: (item) => setState(() {
                              chestItem = item;
                              chestFinal = chestItem!;
                              if (chestItem == 'Typical angina') {
                                finalChest = 0;
                              } else if (chestItem == 'Atypical angina') {
                                finalChest = 1;
                              } else if (chestItem == 'Non-anginal pain') {
                                finalChest = 2;
                              } else {
                                finalChest = 3;
                              }
                              print(finalChest);
                            })),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: rsetBloodPressureController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        final double? number = double.tryParse(value);
                        if (number == null || number < 50.0 || number > 200.0) {
                          return 'number between 50.0 and 200.0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: '  Resting blood pressure'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: cholestroleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        final double? number = double.tryParse(value);
                        if (number == null ||
                            number < 100.0 ||
                            number > 600.0) {
                          return 'number between 100.0 and 600.0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: ' Serum cholestrole '),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: bloodSugarController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        final double? number = double.tryParse(value);
                        if (number == null ||
                            number < 100.0 ||
                            number > 200.0) {
                          return 'number between 100.0 and 200.0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: ' Fasting Blood Sugar  '),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Rest ecg'),
                        value: ecgItem,
                        items: ecgList
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 10),
                                  overflow: TextOverflow.ellipsis,
                                )))
                            .toList(),
                        onChanged: (item) => setState(() {
                              ecgItem = item;
                              ecgFinal = ecgItem!;
                              if (ecgItem == 'Normal') {
                                finalEcg = 0;
                              } else if (ecgItem == 'ST-T wave Abnormality') {
                                finalEcg = 1;
                              } else if (ecgItem ==
                                  'probable or definite LVH') {
                                finalEcg = 2;
                              }
                              print(finalEcg);
                            })),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: maxHeartRateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        final double? number = double.tryParse(value);
                        if (number == null || number < 50.0 || number > 250.0) {
                          return 'number between 50.0 and 150.0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'maximum heart rate'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(), labelText: 'Exang'),
                        value: exangItem,
                        items: exangList
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        onChanged: (item) => setState(() {
                              exangItem = item;
                              exangFinal = exangItem!;
                              if (exangItem == 'No induced angina') {
                                finalExang = 0;
                              } else if (exangItem == 'Induced angina') {
                                finalExang = 1;
                              }
                              print(finalExang);
                            })),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: stDepressionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        final double? number = double.tryParse(value);
                        if (number == null || number < 0.0 || number > 10.0) {
                          return 'number between 0.0 and 10.0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: ' ST depression induced by exercise'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(), labelText: 'Slope'),
                        value: slopeItem,
                        items: slopeList
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        onChanged: (item) => setState(() {
                              slopeItem = item;
                              slopeFinal = slopeItem!;
                              if (slopeItem == 'Up sloping') {
                                finalSlope = 0;
                              } else if (slopeItem == 'Flat') {
                                finalSlope = 1;
                              } else if (slopeItem == 'Downsloping') {
                                finalSlope = 2;
                              }
                              print(finalSlope);
                            })),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: majorVesselesController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        final double? number = double.tryParse(value);
                        if (number == null || number < 0.0 || number > 4.0) {
                          return 'number between 0.0 and 4.0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'number of major vessels'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Thalasemia'),
                        value: thalItem,
                        items: thalList
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        onChanged: (item) => setState(() {
                              thalItem = item;
                              print(thalItem);
                              thalFinal = thalItem!;
                              if (thalItem == 'Normal') {
                                finalThal = 0;
                              } else if (thalItem == 'Fixed defect') {
                                finalThal = 1;
                              } else if (thalItem == 'Reversible defect') {
                                finalThal = 2;
                              } else {
                                finalThal = 3;
                              }
                              print(finalThal);
                            }))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.teal.shade800,
                          Colors.black
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: double.infinity,
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        elevation: 5.0,
                        height: 40,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            double bloodSugar =
                                double.parse(bloodSugarController.text);
                            if (bloodSugar < 120.0) {
                              // Blood sugar is below 120, return 0
                              print('Blood sugar is below 120');
                              bloodSugar = 0;
                              print('$bloodSugar');
                            } else {
                              // Blood sugar is above 120, return 1
                              print('Blood sugar is above 120');
                              bloodSugar = 1;
                              print('$bloodSugar');
                            }

                            print("api work");
                            final response = await http.post(
                              Uri.parse(
                                  'https://final-hear-diseas-prediction.onrender.com/predictApi'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'Age': ageController.text,
                                'Sex': "$finalGender",
                                'CP': "$finalChest",
                                'trestbps': rsetBloodPressureController.text,
                                'chol': cholestroleController.text,
                                'fbs': "$bloodSugar",
                                'restecg': "$finalEcg",
                                'thalach': maxHeartRateController.text,
                                'exang': "$finalExang",
                                'oldpeak': stDepressionController.text,
                                'Slope': "$finalSlope",
                                'ca': majorVesselesController.text,
                                'thal': "$finalThal",
                              }),
                            );
                            final responseBody = response.body;
                            //print the response
                            print(responseBody);
                            final json = jsonDecode(response.body);
                            print(json['prediction']);
                            if (json['prediction'] == 'yes') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => notWell(),
                                  ));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => resultWell(),
                                  ));
                            }
                            CollectionReference collRef = FirebaseFirestore
                                .instance
                                .collection('HeartD2');
                            collRef.add({
                              'Age': ageController.text,
                              'CP': "$finalChest",
                              'Sex': "$finalGender",
                              'Slope': "$finalSlope",
                              'ca': majorVesselesController.text,
                              'chol': cholestroleController.text,
                              'exang': "$finalExang",
                              'fbs': "$bloodSugar",
                              'oldpeak': stDepressionController.text,
                              'restecg': "$finalEcg",
                              'thal': "$finalThal",
                              'thalach': maxHeartRateController.text,
                              'trestbps': rsetBloodPressureController.text,
                              'prediction': responseBody,
                            });
                          }
                        },
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : const Text("Submit",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                )))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
                                  // 'Age': ageController.text,
                                  // 'CP': "$finalChest",
                                  // 'Sex': "$finalGender",
                                  // 'Slope': "$finalSlope",
                                  // 'ca': majorVesselesController.text,
                                  // 'chol': cholestroleController.text,
                                  // 'exang': "$finalExang",
                                  // 'fbs': bloodSugarController.text,"$bloodSugar"
                                  // 'oldpeak': stDepressionController.text,
                                  // 'restecg': "$finalEcg",
                                  // 'thal': "$finalThal",
                                  // 'thalach': maxHeartRateController.text,
                                  // 'trestbps': rsetBloodPressureController.text,

                                   