import 'package:flutter/material.dart';

import 'navbar.dart';

class advices extends StatefulWidget {
  const advices({super.key});

  @override
  State<advices> createState() => _advicesState();
}

class _advicesState extends State<advices> {
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
        title: Text("Best ways to stay safe"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Preventing Heart Disease: Simple Steps for a Healthy Heart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Heart disease is a leading cause of death worldwide. According to the World Health Organization, an estimated 17.9 million people die from cardiovascular diseases each year. The good news is that many cases of heart disease can be prevented by making simple lifestyle changes. In this article, we'll explore some of the most effective ways to keep your heart healthy.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "1. Eat a heart-healthy diet",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Eating a heart-healthy diet is one of the most important steps you can take to prevent heart disease. This means choosing foods that are low in saturated and trans fats, cholesterol, and sodium, and high in fiber, vitamins, and minerals. Some examples of heart-healthy foods include fruits, vegetables, whole grains, lean meats, and fish. To make healthier food choices, try to limit your intake of processed and fast foods, sugary drinks, and snacks high in salt and fat.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "2. Exercise regularly",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Regular physical activity can help lower your risk of heart disease by strengthening your heart and improving blood flow. Aim for at least 150 minutes of moderate-intensity aerobic exercise or 75 minutes of vigorous-intensity aerobic exercise per week. This could include activities such as brisk walking, cycling, swimming, or dancing. You should also try to incorporate strength training exercises at least two days per week to help build muscle and improve overall fitness.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "3. Maintain a healthy weight",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Being overweight or obese can put extra strain on your heart and increase your risk of developing heart disease. To achieve and maintain a healthy weight, aim for a body mass index (BMI) between 18.5 and 24.9. This can be achieved by making healthier food choices, increasing physical activity, and reducing sedentary behavior. You should also try to get enough sleep and manage stress, as these can also affect your weight and overall health.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "4. Don't smoke",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Smoking is one of the most significant risk factors for heart disease. It damages your blood vessels and can lead to a buildup of plaque in your arteries, which can increase your risk of heart attack and stroke. If you smoke, quitting is the best thing you can do for your heart health. Talk to your healthcare provider about strategies to quit smoking, such as nicotine replacement therapy, medications, or counseling. You can also seek support from family, friends, or support groups.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Conclusion",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Preventing heart disease is all about making healthy lifestyle choices. By eating a heart-healthy diet, exercising regularly, maintaining a healthy weight, and not smoking, you can significantly reduce your risk of developing heart disease. Remember, it's never too late tostart taking care of your heart. Take the first step today and make a commitment to a healthier lifestyle.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
