import 'functions.dart';
List<List<String>> seats = List.generate(LiRows, (int index)=> List.filled(LiCols, "E"));
Map<List<int>, Map<String, String> > bookings = {};
int LiRows=5, LiCols=5;
void main(){
  bool flag = true;
  //list to store seats
//map to store bookings
  print("Welcome To Our Theater ❤" );
  while(flag){
    displayOptions();
    int choice = userInput();
    switch(choice){
      case 1:
        //print seats
        displaySeats(seats);
      case 2:
        newBook(bookings, seats);
      case 3:
        displayBookings(bookings);
      case 4:
        flag = false;
      case 0000:
        resetSeats(bookings, seats);

        default:
        print("Invalid choice, please try again");
    }
  }

}
