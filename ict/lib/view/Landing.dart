import 'package:flutter/material.dart';
import 'add_animal_screen.dart'; // Import the AddAnimalScreen
import 'animal.dart';

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
        title: Text('Animal List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: animals.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    // Use Row to arrange elements horizontally
                    children: [
                      Image.asset(
                        animals[index].imageUrl,
                        width: 100, // Set the width of the image
                        height: 100, // Set the height of the image
                      ),
                      SizedBox(
                          width: 10), // Add some spacing between image and text
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
          ElevatedButton(
            onPressed: addAnimal,
            child: Text("Add Animal"),
          ),
        ],
      ),
    );
  }
}
