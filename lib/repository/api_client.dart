// import 'dart:convert';
// import 'dart:io';
//
// import 'package:http/http.dart' as http;
// // import 'package:spectrum_kids/model/responses/generic_response.dart';
// // import 'package:spectrum_kids/repository/app_exceptions.dart';
// // import 'package:spectrum_kids/utility/constants.dart' as Constants;
//
// class ApiClient {
//
//   final  httpClient = http.Client() ;
//   final String _baseUrl = Constants.BASE_URL;
//
//   Future<dynamic> get(String url) async {
//     print('Api Get, url $url');
//     var responseJson;
//     try {
//       final response = await http.get(_baseUrl + url);
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       print('No net');
//       throw FetchDataException('No Internet connection');
//     }
//     print('api get recieved!');
//     return responseJson;
//   }
//
//   Future<dynamic> post(String url, dynamic body) async {
//     print('Api Post, url $url');
//     print('parameters:' + body.toString());
//
//     var responseJson;
//     try {
//       final response = await http.post(url, body: body,headers: Constants.headers);
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       print('No net');
//       throw FetchDataException('No Internet connection');
//     }
//     print('api post.');
//     return responseJson;
//   }
//
//
//   Future<dynamic> put(String url, dynamic body) async {
//     print('Api Put, url $url');
//     var responseJson;
//     try {
//       final response = await http.put(_baseUrl + url, body: body);
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       print('No net');
//       throw FetchDataException('No Internet connection');
//     }
//     print('api put.');
//     print(responseJson.toString());
//     return responseJson;
//   }
//
//   Future<dynamic> delete(String url) async {
//     print('Api delete, url $url');
//     var apiResponse;
//     try {
//       final response = await http.delete(_baseUrl + url);
//       apiResponse = _returnResponse(response);
//     } on SocketException {
//       print('No net');
//       throw FetchDataException('No Internet connection');
//     }
//     print('api delete.');
//     return apiResponse;
//   }
//
//   dynamic _returnResponse(http.Response response) {
//     var responseJson = response.body;
//    GenericResponse genericResponse = GenericResponse.fromJson(jsonDecode(response.body));
//     print("response :"+responseJson.toString());
//     switch (response.statusCode) {
//       case 409:     throw FetchDataException(
//           'This information already exists on our server');
//       case 200:
//         return responseJson;
//       case 400:
//         throw BadRequestException(genericResponse.message);
//       case 401:
//       case 403:
//         throw UnauthorisedException(genericResponse.message);
//       case 500:
//       default:
//         throw FetchDataException(
//             'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
//     }
//
//   }
//
//
//
//
// }