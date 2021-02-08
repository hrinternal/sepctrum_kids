// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spectrum_kids/bloc/authentication/authentication_event.dart';
// import 'package:spectrum_kids/bloc/authentication/authentication_state.dart';
// import 'package:sportixe_flu/repository/user_repository.dart';
//
// import 'authentication.dart';
//
// class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final UserService _authenticationService;
//
//   AuthenticationBloc(UserService authenticationService)
//       : assert(authenticationService != null),
//         _authenticationService = authenticationService;
//
//   // set initial state for bloc
//   @override
//   AuthenticationState get initialState => AuthenticationInitial();
//
//   // map states to events
//   @override
//   Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
//     if (event is AppLoaded) {
//       yield* _mapAppLoadedToState(event);
//     }
//
//     if (event is UserLoggedIn) {
//       yield* _mapUserLoggedInToState(event);
//     }
//
//     if (event is UserLoggedOut) {
//       yield* _mapUserLoggedOutToState(event);
//     }
//   }
//
//   // called when app is loaded
//   Stream<AuthenticationState> _mapAppLoadedToState(AppLoaded event) async* {
//     yield AuthenticationLoading();
//     try {
//       // get user login status
//       final isUserLoggedIn = await _authenticationService.isLoggedIn();
//       print("login status:" + isUserLoggedIn.toString());
//       if(isUserLoggedIn){
//         yield AuthenticationAuthenticated();
//       }
//     else {
//         yield AuthenticationNotAuthenticated();
//       }
//     } catch (e) {
//       yield AuthenticationFailure(message: e.message ?? 'An unknown error occurred');
//     }
//   }
//
//   // called when login is attempted
//   Stream<AuthenticationState> _mapUserLoggedInToState(UserLoggedIn event) async* {
//     yield AuthenticationAuthenticated();
//   }
//
//   Stream<AuthenticationState> _mapUserLoggedOutToState(UserLoggedOut event) async* {
//     await _authenticationService.signOut();
//     yield AuthenticationNotAuthenticated();
//   }
// }