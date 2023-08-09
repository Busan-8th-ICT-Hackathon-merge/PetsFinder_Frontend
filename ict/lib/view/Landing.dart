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
        imageUrl: "cat_image_url"),
    Animal(
        name: "Dog",
        type: "Dog",
        age: 3,
        weight: 8.2,
        imageUrl: "dog_image_url"),
    Animal(
        name: "Rabbit",
        type: "Rabbit",
        age: 1,
        weight: 2.0,
        imageUrl: "rabbit_image_url"),
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
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(animals[index].imageUrl),
                    ),
                    title: Text(
                        "${animals[index].name} type: ${animals[index].type}"),
                    subtitle: Text(
                        "Age: ${animals[index].age}, Weight: ${animals[index].weight} kg"),
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
