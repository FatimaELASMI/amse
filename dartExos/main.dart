import 'dart:io';

void main() {
    // Exerice 1
    
    stdout.write("What's your name? ");
    String? name = stdin.readLineSync();

    print("Hi, $name! What is your age?");
    int age = int.parse(stdin.readLineSync()!);

    int yearsToHunderd = 100 - age;
    print("$name, You have $yearsToHunderd years to be 100");

//    Exercice 2 

 stdout.write("Hi, please choose a number: ");
  int number = int.parse(stdin.readLineSync()!);
    
    if (number % 2 == 0) {
        print("Chosen number is even");
    }
    else {
        print("Chosen number is odd");
    }

    // Exercice3

     List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
     print('The elements less than 5 are');
       print( [for (var x in a) if (x < 5) x]);

    // Exercice 4 

     stdout.write("Please choose a number: ");
  int n = int.parse(stdin.readLineSync()!);
  for (var x = 1; x <= n; x++) {
    if (n % x == 0) {
      print(x);
    }
  }

//   Exercice 5 

  List<int> c = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  List<int> b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 89];
  print('This list contains only the elements that are common between the two previous list');
  print(Set.from(c).intersection(Set.from(b)).toList());

}
