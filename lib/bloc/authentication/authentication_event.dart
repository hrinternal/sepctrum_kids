// import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
// import 'package:spectrum_kids/model/user.dart';
//
// abstract class AuthenticationEvent extends Equatable {
//   const AuthenticationEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// // Fired just after the app is launched
// class AppLoaded extends AuthenticationEvent {}
//
// // Fired when a user has successfully logged in
// class UserLoggedIn extends AuthenticationEvent {
//   final User user;
//
//   UserLoggedIn({@required this.user});
//
//   @override
//   List<Object> get props => [user];
// }
//
// // Fired when the user has logged out
// class UserLoggedOut extends AuthenticationEvent {}