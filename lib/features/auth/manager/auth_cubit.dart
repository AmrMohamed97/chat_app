import 'package:bloc/bloc.dart';
import 'package:chat_app/features/auth/manager/auth_state.dart';
  import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(AuthInitialState());
  String? email, password;
  bool isLoading = false;
  void changeLoad({required bool load}){
    isLoading=load;
    emit(LoginChangeLoad());
  }
  Future<void> login({required String email, required String password})async{
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on Exception catch (e) {
     emit(LoginError(e));
    }
  }
  //------------------------------------------------
  Future<void> register({required String email,required String password})async{
    emit(RegisterLoading());

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on Exception catch (error) {
      emit(RegisterError(error));
    }
  }

}