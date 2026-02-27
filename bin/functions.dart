import 'dart:io';
import 'theaterNTI.dart';
//_______________________________________________________________________________________________________________________________
displayOptions(){
  print("Main menu:-\n1. Display seats");
  print("2. Book a seat");
  print("3. Display bookings");
  print("4. Exit");
}
//_______________________________________________________________________________________________________________________________
int userInput(){
  int choice;
  //print("Please enter your choice: ");
  choice = int.parse(stdin.readLineSync()!);
  return choice;
}
String userInputString(){
  String choice;
  //print("Please enter your choice: ");
  choice = stdin.readLineSync()!;
  return choice;
}
//_______________________________________________________________________________________________________________________________
displaySeats(List <List<String>> seats){
  seats.forEach(print);
}
//_______________________________________________________________________________________________________________________________
newBook(Map<List<int>, Map<String, String> >bookings, List<List<String>> seats){
  //Entering row
  //----------------------
  print("Enter the row number: ");
  int row =int.parse(stdin.readLineSync()!);
  if(row-1>LiRows|| row<=0){
    print("Invalid row number");
    return newBook(bookings, seats);
  }
  //Entering column
  print("Enter the column number: ");
  int col = int.parse(stdin.readLineSync()!);
  if(col>LiCols|| col<=0){
    print("Invalid row number");
    return newBook(bookings, seats);
  }
  //----------------------
  //Check if seat is booked
  if(seats[row-1][col-1]=="B"){
    print("*** Sorry This seat is booked! *** \nchoose another seat\n");
    return newBook(bookings, seats);
  }
  else{
    print("Enter your name: ");
    String name = stdin.readLineSync()!;
    print("Enter your phone number: ");
    String phone = stdin.readLineSync()!;
    bookings[[row,col]]={"Name":name,"Phone Number":phone};
    seats[row-1][col-1] = "B";
    print("Your Seat booked successfully ❤\n-----------------------------\nfor a new booking enter 2\nor choose from the");
  }
}
//_______________________________________________________________________________________________________________________________
displayBookings(Map bookings){
  bookings.forEach((key, value) {
    print("seat: ${key}: ${value}\n");
  });
}
resetSeats(Map bookings,List seats){
  int row, col;
  print("Please enter your choice:\n1. To reset a single seat\n2. To reset all seats\n3. To back for main menu");
  String choice = userInputString();
  switch(choice) {
    case "1":
      {
        print("Enter the row number: ");
        row = userInput();
        if(row>LiRows|| row<=0){
          print("Invalid row number");
          return resetSeats(bookings, seats);
        }
        print("Enter the Column number: ");
        col=userInput();
        if(col>LiCols|| col<=0) {
          print("Invalid Column number");
          return resetSeats(bookings, seats);
        }
        seats[row-1][col-1] = "E";
        bookings.removeWhere((key, value) => key[0]==row && key[1]==col);
        print("Seat reset successfully");
        return resetSeats(bookings, seats);
      }
    case "2":
      {
        print("Enter 0000 to confirm reset ");
        String choice=userInputString();

        if(choice=="0000"){
          for(int i=0;i<LiRows;i++) {
            for (int j = 0; j<LiCols; j++)
              seats[i][j] = "E";
          }
          bookings.clear();
          print("Seats reset successfully");
          return resetSeats(bookings, seats);
        }
        else{
          print("Invalid input");
          return resetSeats(bookings, seats);

      }}
    case "3":
      {
        return main;
      }
  }

}