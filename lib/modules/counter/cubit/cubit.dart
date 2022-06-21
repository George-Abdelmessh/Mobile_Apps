import 'package:app00/modules/counter/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit <CounterStats> {

  int counter = 1;

  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  void minus(){
    counter--;
    emit(CounterMinusState());
  }

  void plus(){
    counter++;
    emit(CounterPlusState());
  }
}