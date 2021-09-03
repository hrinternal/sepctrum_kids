import 'package:json_annotation/json_annotation.dart';

part 'register_device.g.dart';

@JsonSerializable()
class RegisterDevice {
  String? message;
  List<DataBean>? data;
  String? status;

  RegisterDevice({this.message, this.data, this.status});

  factory RegisterDevice.fromJson(Map<String, dynamic> json) => _$RegisterDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDeviceToJson(this);
}

@JsonSerializable()
class DataBean {
  String? token;
  String? expires;
  @JsonKey(name:"user_id")
  String? userId;

  DataBean({this.token, this.expires, this.userId});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

