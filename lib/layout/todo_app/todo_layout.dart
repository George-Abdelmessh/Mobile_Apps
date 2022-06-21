import 'package:app00/shared/components/components.dart';
import 'package:app00/shared/cubit/cubit.dart';
import 'package:app00/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatelessWidget {

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer <AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is AppInsertDatabaseState) Navigator.pop(context);
        },
        builder: (BuildContext context, state)
        {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: state is! GetDatabaseLoadingState ?
            cubit.screens[cubit.currentIndex] :
            Center(child: CircularProgressIndicator()),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if(cubit.isBottomSheetShown){
                  if(formkey.currentState!.validate()){
                    cubit.insertIntoDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text
                    );
                  }
                } else{
                  scaffoldkey.currentState!.showBottomSheet(
                          (context) => Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultFormFirld(
                                controller: titleController,
                                type: TextInputType.text,
                                validate: (value) {
                                  if(value!.isEmpty){
                                    return 'Title must not be empty';
                                  }
                                  return null;
                                },
                                labelText: 'Task Title',
                                prefix: Icons.title,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormFirld(
                                controller: timeController,
                                type: TextInputType.datetime,
                                labelText: 'Task Time',
                                prefix: Icons.watch_later_outlined,
                                onTap: (){
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now()
                                  ).then((value) {
                                    timeController.text = value!.format(context).toString();
                                  });
                                },
                                validate: (value) {
                                  if(value!.isEmpty){
                                    return 'Time must not be empty';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormFirld(
                                controller: dateController,
                                type: TextInputType.datetime,
                                labelText: 'Task Date',
                                prefix: Icons.calendar_today,
                                onTap: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2034-12-30'),
                                  ).then((value) {
                                    dateController.text = DateFormat.yMMMd().format(value!);
                                  });
                                },
                                validate: (value) {
                                  if(value!.isEmpty){
                                    return 'Date must not be empty';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      elevation: 20.0
                  ).closed.then((value){
                    cubit.changBottomSheetState(
                        isShow: false,
                        icon: Icons.edit
                    );
                  });
                  cubit.changBottomSheetState(
                      isShow: true,
                      icon: Icons.add
                  );
                }
              },
              child: Icon(
                  cubit.fabIcon
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.done,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
