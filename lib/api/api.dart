import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:spectrum_kids/model/book.dart';
import 'package:spectrum_kids/model/quiz_page.dart';
import 'package:spectrum_kids/model/register_device.dart';
import 'package:spectrum_kids/model/register_user.dart';

part 'api.g.dart';

@RestApi(baseUrl: "...")
// @Headers({
//   "APP-KEY":"",
//   "Authorization":""
// })
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

//APP-KEY for header
  @POST("/register_device")
  @FormUrlEncoded()
  Future<RegisterDevice> registerDevice(@Header("APP-KEY") String appKey,
      @Field("imei") String deviceImei);

  //APP-KEY,Authorization  for header
  @POST("/register_user")
  @FormUrlEncoded()
  Future<RegisterUser> registerUser(@Header("APP-KEY") String appKey,
      @Header("Authorization ") String authorization,
      @Field("user_id") String userId,
      @Field("first_name") String firstName,
      @Field("last_name") String lastName,
      @Field("phone") String phone,
      @Field("access_code") String accessCode,);

  @GET("/specialbooks")
  Future<Book> getBooks(@Header("APP-KEY") String appKey,
      @Header("Authorization ") String authorization,);

  @GET("/specialbooks")
  Future<Book> getBooksById(@Header("APP-KEY") String appKey,
      @Header("Authorization ") String authorization,
      @Path("id") int id,);

  @GET("/fetch_pages")
  Future<QuizPage> getQuizPages(@Header("APP-KEY") String appKey,
      @Path("book_id") int bookId,);
}
