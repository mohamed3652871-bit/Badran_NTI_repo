import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

var dio = Dio( BaseOptions(
    baseUrl: 'https://ntitodo-production-779a.up.railway.app/api/'
));
//-----------------------------------------------------------------
void displayAuthMenu(){
  print('1. login');
  print('2. register');
  print('3. exit');
}
//-----------------------------------------------------------------
T userInput<T>(T? Function(String input) validator){
  while(true){
    String input = stdin.readLineSync()??"";
    T? result = validator(input);
    if(result != null){
      return result;
    }
  }
}
//-----------------------------------------------------------------
String? validateNonEmpty(String input){
  if(input.isNotEmpty){
    return input;
  }
  return null;
}


//-----------------------------------------------------------------

Future<Either<String, Map<String, dynamic>>> login() async{
  print("Enter username");
  String username = userInput(validateNonEmpty);
  print("Enter password");
  String password = userInput(validateNonEmpty);
  try{
    var loginResponse = await dio.post(
        'login',
        data: FormData.fromMap({
          'username': username,
          'password': password
        })
    );
    var successResponse = loginResponse.data as Map<String, dynamic>;
    return Right(successResponse);
  }
  catch(e){
    print(e.toString());
    if(e is DioException && e.response?.data != null){
      var errorResponse = e.response?.data as Map<String, dynamic>;
      return Left(errorResponse['message']?? 'Unknown error');
    }
    else{
      return Left('An Error occurred.\nTry again later');
    }
  }

}


//-----------------------------------------------------------------


Future<Either<String, Map<String, dynamic>>> register() async{
var username = userInput(validateNonEmpty);
var password = userInput(validateNonEmpty);
try{
var registerResponse = await dio.post(
'register',
data: FormData.fromMap({
'username': username,
'password': password
})
);
var successResponse = registerResponse.data as Map<String, dynamic>;
return Right(successResponse);
}
catch(e){
if(e is DioException){
var errorResponse = e.response?.data as Map<String, dynamic>;
return Left(errorResponse['message']?? 'try another user');
}
else{
return Left('An Error occurred.\nTry again later');
}
}
}

//-----------------------------------------------------------------
//-----------------------------------------------------------------
//-----------------------------------------------------------------
//-----------------------------------------------------------------
//-----------------------------------------------------------------


void main()async{
  Map<String, dynamic> userData = {};

  while(true){
    displayAuthMenu();
    int authChoice = userInput((String input){
      int? choice = int.tryParse(input);
      if(choice != null){
        if(choice >= 1 && choice <= 3){
          return choice;
        }
      }
      return null;
    });

    if(authChoice == 1){
      var result = await login();
      bool loggedInFlag = false;
      result.fold(
              (String errorMsg){
            print("Login Failed: $errorMsg");
          },
              (Map<String, dynamic> userResponse){
            loggedInFlag = true;
            userData = userResponse;
          }
      );
      if(loggedInFlag == true){
        print("Login successful");
        break;
      }
    }
    else if(authChoice == 2) {
      var result = await register();
      bool loggedInFlag = false;
      result.fold(
              (String errorMsg){
            print("register Failed: $errorMsg");
          },
              (Map<String, dynamic> userResponse){
            loggedInFlag = true;
            userData = userResponse;
          }
      );
      if(loggedInFlag == true){
        print("register successful");
        break;
      }
    }
    else if(authChoice == 3){
      print("Exiting...");
      break;
    }

  }


  print(userData.toString());
}




/*

  1. login
  2. register


  1. get tasks
  2. add task
  3. update task
  4. delete task
  */

//-----------------------------------------------------------------
// try{
//   var newTaskResponse = await dio.post(
//     'new_task',
//     data: FormData.fromMap({
//     'title': 'task 001',
//     'description': 'description of task 001',
//     }),
//     options: Options(
//       headers: {
//         'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc3MjI2NDAzMSwianRpIjoiNGE3Y2IwNWMtMzA2OS00MGU3LTk0NTctY2NiMGIwOWVmMjNlIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MywibmJmIjoxNzcyMjY0MDMxLCJjc3JmIjoiOGY4ODE3YTAtY2EwNy00NWMzLWIxYzMtZWE0MDdjYTJlNDIzIiwiZXhwIjoxNzcyMjY0OTMxfQ.E509X_myu3gXkEdIok1xsbU-ptmx-mv2CGlKGWgiD_Q'
//       }
//     )
//   );

//   print(newTaskResponse.data.toString());
// }
// catch(e){
//   if(e is DioException){
//     print(e.response?.data.toString());
//   }
//   else{
//     print(e.toString());
//   }
// }


//-----------------------------------------------------------------
// try{
//   var loginReposne =  await dio.post('login', data: FormData.fromMap({
//     'username': 'ahmed',
//     'password': '12345678'
//   }));
//   print(loginReposne.data.toString());
// }
// catch(e){
//   if(e is DioException ){
//     print(e.response.toString());
//   }
//   else {
//     print(e.toString());
//   }
// }


//-----------------------------------------------------------------
// try{
//   var tasksReposne =  await dio.get('my_tasks', options: Options(
//     headers: {
//       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc3MjIwMDA2NSwianRpIjoiOGQ2NDRmMTMtNWQ5NC00YmM5LWI4MGQtMzM4N2QyM2E4NDljIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MywibmJmIjoxNzcyMjAwMDY1LCJjc3JmIjoiOWNiNjUzYjUtYzZjOC00M2Q1LTgzYjctNjExNDE1N2E5ZGRlIiwiZXhwIjoxNzcyMjAwOTY1fQ.NzDtJr5r-2CuRR54NWAvTsKTAU-xdnFYgTIypqayyrk'
//     }
//   ));
//   print(tasksReposne.data.toString());
// }
// catch(e){
//   if(e is DioException ){
//     print(e.response.toString());
//   }
//   else {
//     print(e.toString());
//   }
// }
//-----------------------------------------------------------------
// try{
//   var loginReposne =  await dio.post('register', data: FormData.fromMap({
//     'username': 'ahmed',
//     'password': '12345678',
//   }));
//   print(loginReposne.data.toString());
// }
// catch(e){
//   if(e is DioException ){
//     print(e.response.toString());
//   }
//   else {
//     print(e.toString());
//   }
// }