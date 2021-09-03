// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= '...';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RegisterDevice> registerDevice(appKey, deviceImei) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'imei': deviceImei};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegisterDevice>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'APP-KEY': appKey},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/register_device',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterDevice.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterUser> registerUser(appKey, authorization, userId, firstName,
      lastName, phone, accessCode) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'access_code': accessCode
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegisterUser>(Options(
                method: 'POST',
                headers: <String, dynamic>{
                  r'APP-KEY': appKey,
                  r'Authorization ': authorization
                },
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/register_user',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterUser.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Book> getBooks(appKey, authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Book>(
        Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'APP-KEY': appKey,
                  r'Authorization ': authorization
                },
                extra: _extra)
            .compose(_dio.options, '/specialbooks',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Book.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Book> getBooksById(appKey, authorization, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Book>(
        Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'APP-KEY': appKey,
                  r'Authorization ': authorization
                },
                extra: _extra)
            .compose(_dio.options, '/specialbooks',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Book.fromJson(_result.data!);
    return value;
  }

  @override
  Future<QuizPage> getQuizPages(appKey, bookId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<QuizPage>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'APP-KEY': appKey},
                extra: _extra)
            .compose(_dio.options, '/fetch_pages',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = QuizPage.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
