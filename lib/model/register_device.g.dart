// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDevice _$RegisterDeviceFromJson(Map<String, dynamic> json) {
  return RegisterDevice(
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$RegisterDeviceToJson(RegisterDevice instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    token: json['token'] as String?,
    expires: json['expires'] as String?,
    userId: json['user_id'] as String?,
  );
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires,
      'user_id': instance.userId,
    };
