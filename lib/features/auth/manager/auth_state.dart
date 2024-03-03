abstract class AuthState {}
class AuthInitialState extends AuthState{}
class LoginChangeLoad extends AuthState{}
class LoginSuccess extends AuthState{}
class LoginLoading extends AuthState{}
class LoginError extends AuthState{
  LoginError(this.error);
  final  dynamic error;
}
//------------------------------------
class RegisterLoading extends AuthState{}
class RegisterSuccess extends AuthState{}
class RegisterError extends AuthState{
  RegisterError(this.error);
  final dynamic error;
}