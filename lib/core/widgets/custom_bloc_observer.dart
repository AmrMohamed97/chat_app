import 'package:bloc/bloc.dart';
 
class CustomBlocObserver extends BlocObserver{

  @override
  void onChange(BlocBase bloc, Change change) {
     super.onChange(bloc, change);
    print(change);
  }
}