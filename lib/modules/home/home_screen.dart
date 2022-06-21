import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: menu,
        ),
        title: Text("Flutter"),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_important),
            onPressed: notification,
          ),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: search,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
                      ),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    width: 200,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Text(
                      'Flower',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
///////////////////////////////////////////////////////////////////////////////
  //when menu button clicked!
  void menu() {
    print("Menu Clicked! ");
  }

  //when notification button clicked!
  void notification() {
    print("Notification Clicked! ");
  }

  //when Search button clicked!
  void search() {
    print("Search Clicked! ");
  }
}
