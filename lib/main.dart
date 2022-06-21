import 'package:app00/shared/bloc_observer.dart';
import 'package:app00/shared/cubit/cubit.dart';
import 'package:app00/shared/cubit/states.dart';
import 'package:app00/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/todo_app/todo_layout.dart';
import 'package:flutter/material.dart';


void main() {

  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()
          ..getBusiness()..getSports()..getScience()),
        BlocProvider(create: (context) => AppCubit()..changeAppMode()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp (
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                ),
              ),
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                )
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              )
            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}