// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sportixe_flu/model/basic_userdetails_model_photo.dart';
// import 'package:sportixe_flu/model/models.dart';
// import 'package:sportixe_flu/model/notification_model.dart';
// import 'package:sportixe_flu/model/responses/basic_user_details_response.dart';
// import 'package:sportixe_flu/model/responses/login_response.dart';
// import 'package:sportixe_flu/model/responses/notification_response.dart';
// import 'package:sportixe_flu/model/responses/suggest_mentions_response.dart';
// import 'package:sportixe_flu/model/responses/sign_up_response.dart';
// import 'package:sportixe_flu/model/user.dart';
// import 'package:sportixe_flu/repository/api_client.dart';
// import 'package:sportixe_flu/model/responses/generic_response.dart';
// import 'package:sportixe_flu/utility/constants.dart' as Constants;
//
// abstract class UserService   {
//   Future<User> getCurrentUser();
//   Future<LoginResponse> signInWithEmailAndPassword(String email, String password);
//   Future<void> signOut();
//   Future<bool> isLoggedIn();
//   Future<User> getUserDetails(String sessionId, String sessionToken);
//   Future<void> LoginUser(User user,String sessionId, String sessionToken);
//   Future<List<NotificationModel>> listNotification();
//   Future<String> getSessionValue(String key);
//   Future<List<BasicUserDetails>> searchUsers(String searchQuery);
//   Future<List<BasicUserDetails>> follow(String userId);
//   Future<List<BasicUserDetails>> listFollowersOrFollowing(String type);
//   Future<List<BasicUserDetails>> getRetixers( String post_id);
//   Future<List<BasicUserDetails>> getPostCarders(String post_id, String type);
//   Future<GenericResponse> createUser(String username, String email, String mobile, String country, String dob, String state, String firstname, String lastname, String gender, String password, String bio);
//   Future<GenericResponse> updatePassword (String password,String email);
// }
//
// class UserRepository extends UserService {
//   ApiClient _apiClient = ApiClient();
//   SharedPreferences prefs= null;
//
//   void openCache() async {
//     prefs =  await SharedPreferences.getInstance();
//   }
//
//
//
//   /*
//   * returns the users login status
//   */
//   @override
//   Future<bool> isLoggedIn() async {
//     await openCache();
//     // check if the key even exists
//     bool checkValue = prefs.containsKey(Constants.CHECK_LOGIN_STATUS);
//
//     if(checkValue){
//       bool loginStatus = prefs.getBool(Constants.CHECK_LOGIN_STATUS);
//       return loginStatus;
//     }else{
//       return false;
//     }
//   }
//
//   /*
//   * returns the users firebase status
//   */
//   @override
//   Future<bool> isFirebaseRegistered() async {
//     await openCache();
//     // check if the key even exists
//     bool checkValue = prefs.containsKey("FIREBASE_PUSHED");
//     if(checkValue){
//       bool fireStatus = prefs.getBool("FIREBASE_PUSHED");
//       return fireStatus;
//     }else{
//       return false;
//     }
//   }
//
//   /*
//   * sets user firebase status to true
//   */
//   Future<void> setFirebaseUser() async {
//    await openCache();
//     prefs.setBool("FIREBASE_PUSHED",true);
//   }
//
//
//   /*
//   * sets user firebase status to true
//   */
//   Future<void> setUserInterest(String interest) async {
//     await openCache();
//     prefs.setString("SAVED_INTEREST",interest);
//   }
//
//   // checks shared preferences and fetches the user data saved there
//   @override
//   Future<String> getSessionValue(String key) async {
//    await openCache();
//     String value = prefs.getString(key);
//     //print("session status get:" + value);
//     return value;
//   }
//
//   /*
//   * sets user login status to true
//   */
//   Future<void> LoginUser(User user,String sessionId,String sessionToken) async {
//    await openCache();
//     prefs.setBool(Constants.CHECK_LOGIN_STATUS,true);
//     prefs.setString(Constants.SESSION_ID,sessionId);
//     prefs.setString(Constants.SESSION_TOKEN,sessionToken);
//     String sessionStatus = prefs.getString(Constants.SESSION_TOKEN);
//     print("session status:" + sessionStatus);
//     bool loginStatus = prefs.getBool(Constants.CHECK_LOGIN_STATUS);
//     print("login status:" + loginStatus.toString());
//     prefs.setString(Constants.LOGGED_IN_USER, json.encode(user));
//   }
//
//   /*
//   * sets user login status to true
//   */
//   Future<void> updateLoggedInUser(User user) async {
//     await openCache();
//     prefs.setString(Constants.LOGGED_IN_USER, json.encode(user));
//   }
//   // checks shared preferences and fetches the user data saved there
//   @override
//   Future<User> getCurrentUser() async {
//     SharedPreferences prefs =  await SharedPreferences.getInstance();
//     String userJson = prefs.getString(Constants.LOGGED_IN_USER);
//     var data = json.decode(userJson);
//     print("logged in user:" + data.toString());
//     User user = User.fromJson(data);
//     return user;
//   }
//
//   @override
//   Future<LoginResponse> signInWithEmailAndPassword(String email, String password) async {
//     var body =  jsonEncode(<String, String>{
//       'email': email,
//       'password':password
//     });
//     var response = await _apiClient.post( Constants.LOGIN_STRING_REQUEST, body);
//     print("loginResponse : "+response);
//     var data = json.decode(response);
//     return LoginResponse.fromJson(data);
//   }
//
//   @override
//   Future<User> getUserDetails(String sessionId, String sessionToken) async {
//     var body =  jsonEncode(<String, String>{
//       'session_id': sessionId,
//       'session_token':sessionToken,
//       'user_id':sessionId
//     });
//
//     final response = await _apiClient.post(
//         Constants.GET_USER_DETAILS,body);
//     final data = json.decode(response);
//     return User.fromJson(data);
//   }
//
//   Future<User> getUserProfile(String userId, String sortType) async {
//     var body =  jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//       'user_id':userId,
//       'sort_type':sortType // sort type is username or id
//     });
//
//     final response = await _apiClient.post(
//         Constants.GET_USER_DETAILS,body);
//     final data = json.decode(response);
//     return User.fromJson(data);
//   }
//
//   Future<GenericResponse> updateProfile(String row, String value) async {
//     var body = jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//       'user_id': await getSessionValue(Constants.SESSION_ID),
//       'row': row,
//       'value': value
//     });
//     final response = await _apiClient
//         .post(Constants.UPDATE_UPDATE,body);
//     final json = jsonDecode(response);
//     return GenericResponse.fromJson(json);
//
//   }
//
//   @override
//   Future<List<BasicUserDetails>> suggestUsers() async {
//     var body =  jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//     });
//     final response = await _apiClient.post(Constants.SUGGEST_USERS,body);
//     final json = jsonDecode(response);
//     return BasicUserDetailsResponse.fromJson(json).results;
//
//   }
//
//   Future <List<Map<String,dynamic>>> suggestMentions(String searchQuery) async {
//     var body =  jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//       'search_word': searchQuery
//     });
//     final response = await _apiClient.post(Constants.SEARCH_USERS,  body);
//     final json = jsonDecode(response);
//     SuggestMentionsResponse suggestionResponse = new SuggestMentionsResponse.fromJson(json);
//     return suggestionResponse.toJsonResult();
//   }
//
//   @override
//   Future<List<BasicUserDetails>> searchUsers(String searchQuery) async {
//     var body =  jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//       'search_word': searchQuery
//     });
//     final response = await _apiClient.post(Constants.SEARCH_USERS,  body);
//     final json = jsonDecode(response);
//     return BasicUserDetailsResponse.fromJson(json).results;
//
//   }
//
//   @override
//   Future<List<BasicUserDetails>> follow(String userId) async {
//     var body = jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//       'user_id': userId
//     });
//     final response = await _apiClient.post(Constants.FOLLOW_AND_UNFOLLOW,  body);
//     final json = jsonDecode(response);
//     return BasicUserDetailsResponse.fromJson(json).results;
//   }
//
//   Future<GenericResponse> saveInterest(String value) async {
//     var body =jsonEncode(<String, String>{
//       'user_id': await getSessionValue(Constants.SESSION_ID),
//       'row': 'interests',
//       'value':value,
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//     });
//     final response = await _apiClient.post(Constants.UPDATE_UPDATE,body);
//     final json = jsonDecode(response);
//     return GenericResponse.fromJson(json);
//
//   }
//
//   @override
//   Future<void> signOut() async{
//     await openCache();
//     prefs.setBool(Constants.CHECK_LOGIN_STATUS,false);
//     return null;
//   }
//
//   @override
//   Future<List<BasicUserDetails>> listFollowersOrFollowing(String type) async {
//     var body =  jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//       'type':type,
//       'search_word':"null"
//     });
//     final response = await _apiClient.post( Constants.FOLLOWERS_OR_FOLLOWING, body);
//     final json = jsonDecode(response);
//     List<BasicUserDetails> users =
//         BasicUserDetailsResponse.fromJson(json).results;
//     return users;
//   }
//
//   @override
//   Future<List<NotificationModel>> listNotification() async {
//     var body =  jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//     });
//     final response = await _apiClient.post( Constants.LIST_NOTIFICATION, body);
//     final json = jsonDecode(response);
//       List<NotificationModel> notifications =
//           NotificationResponse.fromJson(json).results;
//       return notifications;
//     }
//
//   @override
//   Future<List<BasicUserDetails>> getRetixers(String postId) async {
//     var body = jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//       'post_id': postId
//     });
//     final response = await _apiClient.post(Constants.GET_RETIXERS, body);
//     final json = jsonDecode(response);
//       List<BasicUserDetails> users = BasicUserDetailsResponse.fromJson(json).results;
//       return users;
//     }
//
//   @override
//   Future<List<BasicUserDetails>> getPostCarders(String postId, String type) async {
//     var body = jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//       'post_id': postId,
//       'type': type
//     });
//     final response = await _apiClient.post(Constants.GET_POST_CARDS,  body);
//     final json = jsonDecode(response);
//     List<BasicUserDetails> users = BasicUserDetailsResponse.fromJson(json).results;
//     return users;
//   }
//
//   @override
//   Future<GenericResponse> createUser(String email, String lastname,String firstname, String mobile,String username, String dob,String gender,String country, String state, String password, String bio) async {
//     var body =  jsonEncode(<String, String>{
//       'email': email,
//       'password':password,
//       'username': username,
//       'firstname': firstname,
//       'lastname': lastname,
//       'bio' : " ",
//       'mobile': mobile,
//       'dob': dob,
//       'gender' : gender,
//       'country' : country,
//       'state': state,
//
//     });
//     final response = await _apiClient.post(Constants.CREATE_USER,  body);
//     final json = jsonDecode(response);
//     return GenericResponse.fromJson(json);
//
//   }
//
//   Future<GenericResponse> updatePassword (String password,String email) async{
//     var body = jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//       'new_password': password,
//       'email': email
//     });
//     final response = await _apiClient.post(Constants.UPDATE_PASSWORD,  body);
//     final json = jsonDecode(response);
//     return GenericResponse.fromJson(json);
//
//   }
//
//
//   Future<GenericResponse> updateUserDetails (String key,String value) async{
//     var body = jsonEncode(<String, String>{
//       'session_id': await getSessionValue(Constants.SESSION_ID),
//       'session_token':await getSessionValue(Constants.SESSION_TOKEN),
//       'row': key,
//       'value': value
//     });
//     final response = await _apiClient.post(Constants.UPDATE_UPDATE,  body);
//     final json = jsonDecode(response);
//     return GenericResponse.fromJson(json);
//
//   }
//
// }
//
//
