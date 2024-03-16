import 'dart:io';

// Interface definition
abstract class Animal {
  void makeSound();
}

// Base class
class AnimalBase implements Animal {
  @override
  void makeSound() {
    print('Generic animal sound');
  }
}

// Dog class inheriting from AnimalBase
class Dog extends AnimalBase {
  Dog(String name, int age);

  @override
  void makeSound() {
    print('Woof!');
  }
}

// Class to read data from file and initialize Dog objects
class DogLoader {
  List<String> _dogData = [];

  DogLoader(String filename) {
    _loadDataFromFile(filename);
  }

  void _loadDataFromFile(String filename) {
    try {
      final file = File(filename);
      _dogData = file.readAsLinesSync();
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  List<Dog> createDogsFromData() {
    List<Dog> dogs = [];
    for (var data in _dogData) {
      var parts = data.split(',');
      var name = parts[0];
      var age = int.tryParse(parts[1]) ?? 0;
      dogs.add(Dog(name, age));
    }
    return dogs;
  }
}

void main() {
  // Initializing dogs from file
  var dogLoader = DogLoader('dogs.txt');
  var dogs = dogLoader.createDogsFromData();

  // Demonstrating inheritance and method override
  for (var dog in dogs) {
    dog.makeSound(); // This will print "Woof!" for each dog
  }

  // Demonstrating the use of a loop
  for (var i = 0; i < 3; i++) {
    print('Loop iteration $i');
  }
}
