import 'package:flutter/material.dart';
import 'add_animal_screen.dart'; // Import the AddAnimalScreen
import 'animal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => LandingState();
}

class LandingState extends State<Landing> {
  List<Animal> animals = [
    Animal(
        name: "Cat",
        type: "Cat",
        age: 2,
        weight: 4.5,
        imageUrl: "assets/cat_image_url.jpg"),
    Animal(
        name: "Dog",
        type: "Dog",
        age: 3,
        weight: 8.2,
        imageUrl: "assets/dog1.jpg"),
    Animal(
        name: "Rabbit",
        type: "Rabbit",
        age: 1,
        weight: 2.0,
        imageUrl: "assets/rabbit_image_url.jpg"),
    // Add more animals as needed
  ];

  void addAnimal() async {
    Animal? newAnimal = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddAnimalScreen()),
    );

    if (newAnimal != null) {
      setState(() {
        animals.add(newAnimal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2, // Adjust the value to control the shadow intensity
        title: Row(
          children: [
            Image.asset(
              'assets/logo.PNG', // Replace with your logo asset path
              width: 150, // Increase the width value for a larger logo
              height: 50, // Increase the height value for a larger logo
            ),
            SizedBox(width: 10),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: 8, vertical: 8), // Adjust the vertical margin
            child: ElevatedButton(
              onPressed: addAnimal,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF65451F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize:
                    Size(70, 36), // Adjust the width and height as needed
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 2), // Add horizontal padding
                child: Text("Add Animal"),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 16, // Set the desired top spacing
          ),
          Expanded(
            child: ListView.separated(
              itemCount: animals.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        animals[index].imageUrl,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${animals[index].name} type: ${animals[index].type}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Age: ${animals[index].age}, Weight: ${animals[index].weight} kg",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
