import 'dart:io';
// booked => true
// empty => false
void main(){
  List<List<bool>> seats = List.generate(5, (int index)=> List.filled(5, false));
  Map<List<int>, Map<String, String>> bookings = {};

  bool flag = true;
  while(flag){
    displayOptions();
    int choice = userInput();
    switch(choice){
      case 1:
        //displaySeats();
      case 2:
        //newBook();
      case 3:
        //displayBookings();
      case 4:
        flag = false;
      default:
        print("Invalid choice");
    }
  }

}
displayOptions(){
  print("1. Display seats");
  print("2. Book a seat");
  print("3. Display bookings");
  print("4. Exit");
}
userInput(){
  int choice;
  print("Enter your choice: ");
  choice = int.parse(stdin.readLineSync()!);

}