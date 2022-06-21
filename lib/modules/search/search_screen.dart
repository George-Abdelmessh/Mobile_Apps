import 'package:app00/layout/news_app/cubit/cubit.dart';
import 'package:app00/layout/news_app/cubit/states.dart';
import 'package:app00/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state){

        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormFirld(
                  controller: searchController,
                  type: TextInputType.text,
                  validate: (value){
                    if(value.toString().isEmpty){
                      return 'search must be not empty';
                    }
                  },
                  labelText: 'Search',
                  prefix: Icons.search,
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(
                  child: articleBuilder(list, context)
              ),
            ],
          ),
        );
      },
    );
  }
}
