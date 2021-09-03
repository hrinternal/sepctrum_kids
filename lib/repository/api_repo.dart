import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:spectrum_kids/api/api.dart';
import 'package:spectrum_kids/model/book.dart';
import 'package:spectrum_kids/model/quiz_page.dart';
import 'package:spectrum_kids/model/register_device.dart';
import 'package:spectrum_kids/model/register_user.dart';

@RestApi(baseUrl: "...")
class ApiRepo {
  late ApiClient client;

  ApiRepo(){
    var dio = Dio();
    client = new ApiClient(dio);
  }

  Future<RegisterDevice> registerDevice(String appKey, String deviceImei) =>
      client.registerDevice(appKey, deviceImei);

  Future<RegisterUser> registerUser(
    String appKey,
    String authorization,
    String userId,
    String firstName,
    String lastName,
    String phone,
    String accessCode,
  ) =>
      client.registerUser(appKey, authorization, userId, firstName, lastName,
          phone, accessCode);

  Future<Book>? getBooks(
    String appKey,
    String authorization,
  ) =>
      client.getBooks(appKey, authorization);

  Future<Book> getBooksById(
    String appKey,
    String authorization,
    int id,
  ) =>
      client.getBooksById(appKey, authorization, id);

  Future<QuizPage> getQuizPages(
    String appKey,
    int bookId,
  ) =>
      client.getQuizPages(appKey, bookId);
}
