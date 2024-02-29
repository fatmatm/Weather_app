import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherappupdate/weatherScreen.dart';
import 'Cubit/cubit.dart';
import 'Cubit/states.dart';
import 'DioHelper.dart';


void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>WeatherCubit(),
      child: BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
              home: WeatherScreen()
          );
        }
      ),
    );
  }
}

