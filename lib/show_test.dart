import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowTest extends StatelessWidget {
  const ShowTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){
      },),
      body: Center(),
    );
  }
  void play(){
    print('play');
 //-------------------
  Future<double> f1=Future( (){
   return 2.0;
  });
  }
}
abstract interface class DoIt{
  // DoIt(){}
    play();
}