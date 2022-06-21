import 'package:app00/shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 40.0,
  Color background = Colors.blue,
  required Function()? method,
  required String text,
  bool isUpperCase = true,
  double borderRadius = 5.0,

}) => Container(
  width: width,
  height: height,
  child: MaterialButton(
    onPressed: method,
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    color: background,
  ),
);



Widget defaultFormFirld({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChanged,
  Function()? onTap,
  required FormFieldValidator <String> validate,
  required String labelText,
  IconData? prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool obscureText = false,
  Color textColor = Colors.black,

}) => TextFormField(
    validator: validate,
    onFieldSubmitted: onSubmit,
    onChanged: onChanged,
    controller: controller,
    keyboardType: type,
    obscureText: obscureText,
    onTap: onTap,
    style: TextStyle(
      color: textColor,
    ),
    decoration: InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(),
      prefixIcon: Icon(
          prefix,
),
      suffixIcon: IconButton(
        onPressed: suffixPressed,
        icon: Icon(suffix),
      ),
),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  onDismissed: (direction) {
    AppCubit.get(context).deleteDate(id: model['id']);
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
              '${model['time']}'
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
               ' ${model['date']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: (){
              AppCubit.get(context).updateDate(status: 'done', id: model['id']);
            },
            icon: Icon(Icons.check_box),
          color: Colors.green,
        ),
        IconButton(
            onPressed: (){
              AppCubit.get(context).updateDate(status: 'archive', id: model['id']);
            },
            icon: Icon(Icons.archive),
          color: Colors.black45,
        ),
      ],
    ),
  ),
);

Widget buildArticleItem(article, context) => InkWell(
  onTap: (){
    launch(article['url']);
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(
                  article['urlToImage'] != null ?  '${article['urlToImage']}' :
                  'https://pbs.twimg.com/profile_images/'
                      '1108430392267280389/ufmFwzIn.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget articleBuilder(list, context) =>
    list.length > 0 ? ListView.separated(
      itemBuilder: (context, index) => buildArticleItem(list[index], context),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: list.length,
  physics: BouncingScrollPhysics(),
)
    : Center(child: CircularProgressIndicator());

void navigateTo (context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);