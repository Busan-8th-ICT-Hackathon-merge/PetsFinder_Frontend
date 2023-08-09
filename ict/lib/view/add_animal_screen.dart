import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'animal.dart'; // Import the Animal class

class AddAnimalScreen extends StatefulWidget {
  @override
  _AddAnimalScreenState createState() => _AddAnimalScreenState();
}

class _AddAnimalScreenState extends State<AddAnimalScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String selectedImageUrl = ''; // Store selected image URL

  void _popScreen(BuildContext context) {
    Navigator.pop(context); // Simply close the screen without returning a value
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImageUrl = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        titleSpacing: -8,
        title: Text(
          'Add New Animal',
          style: TextStyle(color: Colors.black), // Set text color to black
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black, // Set icon color to black
          ),
          onPressed: () => _popScreen(context),
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the entire body with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: '이름'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: typeController,
                decoration: InputDecoration(labelText: '종류'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick an Image'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF65451F), // Set button color
                ),
              ),
              SizedBox(height: 10),
              selectedImageUrl.isNotEmpty
                  ? Column(
                      children: [
                        Image.file(
                          File(selectedImageUrl),
                          height: 200,
                        ),
                        SizedBox(height: 16),
                      ],
                    )
                  : Container(),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: '나이'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: weightController,
                decoration: InputDecoration(labelText: '몸무게(kg)'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String type = typeController.text;
                  int age = int.tryParse(ageController.text) ?? 0;
                  double weight = double.tryParse(weightController.text) ?? 0.0;
                  if (selectedImageUrl.isEmpty) {
                    selectedImageUrl = "assets/dog2.jpg";
                  }
                  if (name.isNotEmpty &&
                      type.isNotEmpty &&
                      age > 0 &&
                      weight > 0) {
                    Animal newAnimal = Animal(
                      name: name,
                      type: type,
                      age: age,
                      weight: weight,
                      imageUrl: "assets/dog2.jpg",
                    );
                    Navigator.pop(
                        context, newAnimal); // Return the newAnimal to Landing
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Incomplete Information'),
                          content: Text(
                            'Please fill in all the required information.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Add Animal'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF65451F), // Set button color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
