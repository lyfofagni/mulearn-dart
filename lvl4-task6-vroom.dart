import 'dart:io';

class Car {
  Car(this.name, this.price);
  String name;
  double price;

  void changePrice(double newPrice) {
    price = newPrice;
  }
}

class Person {
  Person(this.name, this.ownedCars, this.moneyLeft);
  String name;
  List<Car> ownedCars;
  double moneyLeft;

  void buyCar(Car car) {
    if (moneyLeft >= car.price) {
      ownedCars.add(car);
      print("\n${car.name} was added to your collection.");
      viewOwnedCars(this);
      moneyLeft -= car.price;
      print("Money left in bank is \$$moneyLeft");
    } else {
      print("\nInsufficient bank balance");
    }
  }

  void sellCar(Car car) {
    if (ownedCars.remove(car)) {
      print('${car.name} was sold');
      viewOwnedCars(this);
      moneyLeft += car.price;
      print("Money in your bank is \$$moneyLeft");
    } else {
      print('${car.name} is not present in your owned cars');
    }
  }
}

void viewOwnedCars(Person person) {
  print('Owned cars:');
  for (Car car in person.ownedCars) {
    print('${car.name}');
  }
}

void main() {
  print("🚗 Welcome to the Car Buying & Selling Platform 🚗");

  Car bmw = Car("BMW", 42000);
  Car mercedes = Car("Mercedes", 48000);
  Car porsche = Car("Porsche", 60000);
  Car lexus = Car("Lexus", 39000);

  List<Car> carInventory = [bmw, mercedes, porsche, lexus];

  stdout.write("Enter your name: ");
  String name = stdin.readLineSync() ?? "Anonymous";

  stdout.write("Enter your bank balance: ");
  double bankBalance = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  Person person1 = Person(name, [], bankBalance);

  while (true) {
    print('\n--- MENU ---');
    print('1. Buy Car');
    print('2. Sell Car');
    print('3. View Owned Cars');
    print('4. Update Car Price');
    print('5. View Car Inventory');
    print('6. Exit');
    stdout.write("Enter your choice (1-6): ");
    
    int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    switch (choice) {
      case 1:
        for (int i = 0; i < carInventory.length; i++) {
          print('${i + 1}. ${carInventory[i].name} - \$${carInventory[i].price.toStringAsFixed(2)}');
        }
        stdout.write('Enter the number of the car you want to buy: ');
        int carIndex = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        if (carIndex > 0 && carIndex <= carInventory.length) {
          person1.buyCar(carInventory[carIndex - 1]);
        } else {
          print('Invalid choice.');
        }
        break;

      case 2:
        if (person1.ownedCars.isEmpty) {
          print('You do not own any cars.');
        } else {
          print('Owned Cars:');
          for (int i = 0; i < person1.ownedCars.length; i++) {
            print('${i + 1}. ${person1.ownedCars[i].name} - \$${person1.ownedCars[i].price}');
          }
          stdout.write('Enter the number of the car to sell: ');
          int carIndex = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
          if (carIndex > 0 && carIndex <= person1.ownedCars.length) {
            person1.sellCar(person1.ownedCars[carIndex - 1]);
          } else {
            print('Invalid choice.');
          }
        }
        break;

      case 3:
        if (person1.ownedCars.isEmpty) {
          print('You do not own any cars.');
        } else {
          print('Owned Cars:');
          for (int i = 0; i < person1.ownedCars.length; i++) {
            print('${i + 1}. ${person1.ownedCars[i].name} - \$${person1.ownedCars[i].price}');
          }
        }
        break;

      case 4:
        for (int i = 0; i < carInventory.length; i++) {
          print('${i + 1}. ${carInventory[i].name} - \$${carInventory[i].price.toStringAsFixed(2)}');
        }
        stdout.write('Enter the number of the car to change price: ');
        int carIndex = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

        if (carIndex > 0 && carIndex <= carInventory.length) {
          stdout.write('Enter new price: ');
          double newPrice = double.tryParse(stdin.readLineSync() ?? '') ?? carInventory[carIndex - 1].price;
          carInventory[carIndex - 1].changePrice(newPrice);
          print('Price updated successfully.');
        } else {
          print('Invalid choice.');
        }
        break;

      case 5:
        print('Available Cars in Inventory:');
        for (int i = 0; i < carInventory.length; i++) {
          print('${i + 1}. ${carInventory[i].name} - \$${carInventory[i].price.toStringAsFixed(2)}');
        }
        break;

      case 6:
        print("Thank you for using the platform. Goodbye!");
        return;

      default:
        print("❌ Invalid option. Please select a number from 1 to 6.");
    }
  }
}
