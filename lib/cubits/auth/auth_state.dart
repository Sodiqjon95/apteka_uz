part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignInState extends AuthState {}

class SingUpState extends AuthState {}

class AuthSuccesses extends AuthState {}
