// import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
// import 'package:sportixe_flu/model/user.dart';
//
// abstract class AuthenticationState extends Equatable {
//   const AuthenticationState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class AuthenticationInitial extends AuthenticationState {}
//
// class AuthenticationLoading extends AuthenticationState {}
//
// class AuthenticationNotAuthenticated extends AuthenticationState {}
//
// class AuthenticationAuthenticated extends AuthenticationState {
//
//   @override
//   List<Object> get props => null;
// }
//
//
// class AuthenticationFailure extends AuthenticationState {
//   final String message;
//
//   AuthenticationFailure({@required this.message});
//
//   @override
//   List<Object> get props => [message];
// }