import 'package:app00/layout/news_app/cubit/cubit.dart';
import 'package:app00/layout/news_app/cubit/states.dart';
import 'package:app00/modules/search/search_screen.dart';
import 'package:app00/shared/components/components.dart';
import 'package:app00/shared/cubit/cubit.dart';
import 'package:app00/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
                'News App'
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                      Icons.search,
                  ),
              ),
              IconButton(
                onPressed: (){
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
