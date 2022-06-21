import 'package:app00/layout/news_app/cubit/states.dart';
import 'package:app00/modules/business/business_screen.dart';
import 'package:app00/modules/science/science_screen.dart';
import 'package:app00/modules/settings/settings_screen.dart';
import 'package:app00/modules/sports/sports_screen.dart';
import 'package:app00/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit <NewsStates> {

  int currentIndex = 0;
  List <BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  List <Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  void changeBottomNavBar(int index){
    currentIndex = index;
    if(index == 1)
      getSports();
    if(index == 2)
      getScience();
    emit(NewsBottomNavState());
  }

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getDate(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'88503750c3df4259b6cbcdb83ef8d712',
      },
    ).then((value) => {
      business = value.data['articles'],
      emit(NewsGetBusinessSuccessState()),
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports(){
    emit(NewsGetSportsLoadingState());
    if(sports.length == 0){
      DioHelper.getDate(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'88503750c3df4259b6cbcdb83ef8d712',
        },
      ).then((value) => {
        sports = value.data['articles'],
        emit(NewsGetSportsSuccessState()),
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }
    else
      emit(NewsGetSportsSuccessState());
  }

  void getScience(){
    emit(NewsGetScienceLoadingState());
    if(science.length == 0){
      DioHelper.getDate(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'88503750c3df4259b6cbcdb83ef8d712',
        },
      ).then((value) => {
        science = value.data['articles'],
        emit(NewsGetScienceSuccessState()),
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }
    else
      emit(NewsGetScienceSuccessState());
  }

  void getSearch(String value){

    emit(NewsGetSearchLoadingState());
    DioHelper.getDate(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'88503750c3df4259b6cbcdb83ef8d712',
      },
    ).then((value) => {
      search = value.data['articles'],
      emit(NewsGetSearchSuccessState()),
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }
}