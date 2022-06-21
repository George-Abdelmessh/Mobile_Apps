import 'package:app00/shared/components/components.dart';
import 'package:app00/shared/cubit/cubit.dart';
import 'package:app00/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    if(AppCubit.get(context).archivedTasks.length > 0)
      return BlocConsumer <AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var tasks = AppCubit.get(context).archivedTasks;

        return ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: tasks.length,
        );
      },
    );
    else
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
  }
}
