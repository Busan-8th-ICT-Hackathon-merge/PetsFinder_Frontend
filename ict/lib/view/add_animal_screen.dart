import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'animal.dart'; // Import the Animal class

class AddAnimalScreen extends StatelessWidget {
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
      selectedImageUrl = pickedFile.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add New Animal'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => _popScreen(context), // Call _popScreen function
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
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(labelText: 'Type'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: weightController,
                  decoration: InputDecoration(labelText: 'Weight'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick an Image'),
                ),
                SizedBox(height: 16.0),
                selectedImageUrl.isNotEmpty
                    ? Image.file(
                        File(selectedImageUrl),
                        height: 200,
                      )
                    : Container(),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text;
                    String type = typeController.text;
                    int age = int.tryParse(ageController.text) ?? 0;
                    double weight =
                        double.tryParse(weightController.text) ?? 0.0;
                    if (selectedImageUrl.isEmpty) {
                      selectedImageUrl = "base.url";
                    }
                    if (name.isNotEmpty &&
                        age > 0 &&
                        weight > 0 &&
                        selectedImageUrl.isNotEmpty) {
                      Animal newAnimal = Animal(
                        name: name,
                        type: type,
                        age: age,
                        weight: weight,
                        imageUrl: selectedImageUrl,
                      );
                      Navigator.pop(context,
                          newAnimal); // Return the newAnimal to Landing
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
                ),
              ],
            ),
          ),
        ));
  }
}
