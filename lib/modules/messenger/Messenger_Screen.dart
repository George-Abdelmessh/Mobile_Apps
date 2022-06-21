import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                'https://scontent.fcai19-1.fna.fbcdn.net/v/t1.6435-9/190873053_'
                    '1637102103151375_380999518340982507_n.jpg?_nc_cat=109&ccb'
                    '=1-5&_nc_sid=09cbfe&_nc_ohc=iM2p-z46rtEAX8JwcxQ&_nc_'
                    'ht=scontent.fcai19-1.fna&oh=178f89ca5049d9d6c3abe07192fb'
                    '386b&oe=617036F7'
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chat',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.camera_alt,
                    size: 16.0,
                    color: Colors.white,
              )
              ),
          ),
          IconButton(
            onPressed: (){},
            icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 16.0,
                  color: Colors.white,
                )
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
            20.0
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                  itemCount: 10,
                ),
              ),
              SizedBox(
                  height: 20.0
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => SizedBox(
                    height: 20
                ),
                itemCount: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // arow function
  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
                'https://logos-world.net/wp-content/uploads/'
                    '2020/12/Lays-Logo.png'
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lays company',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello world form the outside!',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                  '02:00 pm',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://scontent.fcai19-1.fna.fbcdn.net/v/t1.6435-9/190873053_'
                      '1637102103151375_380999518340982507_n.jpg?_nc_cat=109&ccb'
                      '=1-5&_nc_sid=09cbfe&_nc_ohc=iM2p-z46rtEAX8JwcxQ&_nc_'
                      'ht=scontent.fcai19-1.fna&oh=178f89ca5049d9d6c3abe07192fb'
                      '386b&oe=617036F7'
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,

              ),
            ),
          ],
        ),
        SizedBox(height: 6.0,),
        Text(
          'George AbdElmessseh',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
