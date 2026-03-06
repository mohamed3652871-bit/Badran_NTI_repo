import 'package:dio/dio.dart';

void main()async{

  /*
  1. login
  2. register


  1. get tasks
  2. add task
  3. update task
  */
  var dio = Dio(BaseOptions(
      baseUrl: 'https://ntitodo-production-779a.up.railway.app/api/'
  ));

  dio.post('new_task' ,data: FormData.fromMap(
      {
        'title': 'new task 1',
        'description': 'asad',
      }),options: Options(
    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ey'
    }
  )
  );
  
  
  
//   try{
//     var loginReposne =  await dio.post('login', data: FormData.fromMap({
//       'username': 'ahmed',
//       'password': '12345678'
//     }));
//     print(loginReposne.data['access_token']);
//   }
//   catch(e){
//     if(e is DioException ){
//       print(e.response.toString());
//     }
//     else {
//       print(e.toString());
//     }
//   }
//
//   try{
//     var GetTasks =  await dio.get('my_tasks',options: Options(
//       headers: {
//
//         'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc3MjE5OTUyMCwianRpIjoiZDMxOGI3MzYtYTlmMS00NzExLWExNjctMTZlYjlmM2NjN2RlIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MywibmJmIjoxNzcyMTk5NTIwLCJjc3JmIjoiNDQzZmI1OGYtYWM5OC00MDhkLWJiMTEtZDkxMjI2ZjdmYTIzIiwiZXhwIjoxNzcyMjAwNDIwfQ.T-VIkE-Jci31RYS9LQwJ1CNAbffoozK6uiXSgveOwxU'
//       }));
//     var myToken = loginReposne.data.toString();
//     print(GetTasks.data.toString());
//
//   }
// catch(e){
//     if(e is DioException ){
//       print(e.response.toString());
//     }
//     else {
//       print(e.toString());
//     }
//
// }
//   // try{
//   //   var loginReposne =  await dio.post('register', data: FormData.fromMap({
//   //     'username': 'ahmed',
//   //     'password': '12345678',
//   //   }));
//   //   print(loginReposne.data.toString());
//   // }
//   // catch(e){
//   //   if(e is DioException ){
//   //     print(e.response.toString());
//   //   }
//   //   else {
//   //     print(e.toString());
//   //   }
//   // }

 }