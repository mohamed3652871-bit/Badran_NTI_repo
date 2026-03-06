import 'dart:io';


String? validateNonEmpty(String input){
if(input.isNotEmpty){
return input;
}
return null;
}


void main() {
  int? x ;
  x= int.tryParse (stdin.readLineSync()?? " " )?? 1 ;
print(x);
}

