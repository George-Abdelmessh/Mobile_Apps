import 'package:app00/models/user/user_model.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  List <UserModel> users = [
    UserModel(
        id: 1,
        name: 'George jojo',
        phone: '+201062374445'
    ),
    UserModel(
        id: 2,
        name: 'Mariam',
        phone: '+20105454445'
    ),
    UserModel(
        id: 3,
        name: 'Mary',
        phone: '+201065574445'
    ),
    UserModel(
        id: 4,
        name: 'Aya',
        phone: '+201062386445'
    ),
    UserModel(
        id: 5,
        name: 'Omar',
        phone: '+201062326675'
    ),
    UserModel(
        id: 1,
        name: 'George jojo',
        phone: '+201062374445'
    ),
    UserModel(
        id: 2,
        name: 'Mariam',
        phone: '+20105454445'
    ),
    UserModel(
        id: 3,
        name: 'Mary',
        phone: '+201065574445'
    ),
    UserModel(
        id: 4,
        name: 'Aya',
        phone: '+201062386445'
    ),
    UserModel(
        id: 5,
        name: 'Omar',
        phone: '+201062326675'
    ),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users'
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
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
          itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
