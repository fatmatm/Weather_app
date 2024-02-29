import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherappupdate/Cubit/states.dart';
import '../DioHelper.dart';
import '../models/weatherModel.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());
  static WeatherCubit get(context) => BlocProvider.of(context);
  weatherModels? GetTempratureWeather;
  void getCurrentWeather(String text) {
    emit(WeatherLoadingState());

    DioHelper.GetData(
            url: 'data/2.5/weather?',
            query: {'q': text, 'appid': 'a5a5545e32cf60b5b4c0abb30e59871d'})
        .then((value) {
      GetTempratureWeather = weatherModels.fromJson(value?.data);
      emit(WeatherSucessState());
    }).catchError((error) {
      emit(WeatherErrorState());
    });
  }
}
