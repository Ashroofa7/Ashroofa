import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextFiled(
        {required TextEditingController controllerr,
        required TextInputType type,
        VoidCallback? suffixpresed,
        ValueChanged<String>? change,
        ValueChanged? submit,
        bool ispassword = true,
        required FormFieldValidator<String>? valid,
        OutlineInputBorder? border,
        IconData? suffix,
        IconData? prefix,
        required String label,
        Color? color1,
        Color? color2,
        double radius = 0.0,
        required FontWeight fontw,
        required double fonts,
        TextStyle? style}) =>
    TextFormField(
      style: style,
      keyboardType: type,
      controller: controllerr,
      onChanged: change,
      onFieldSubmitted: submit,
      obscureText: ispassword,
      validator: valid,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        prefixIcon: Icon(
          prefix,
          color: color2,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                ),
                onPressed: suffixpresed,
              )
            : null,
        label: Text(
          label,
          style: TextStyle(
            color: color1,
            fontSize: fonts,
            fontWeight: fontw,
          ),
        ),
      ),
    );

// Widget NewTaskItems(Map model,context) =>  Dismissible(
//   key: Key(model['Id'].toString()),
//   child: Padding(
//
//     padding:  EdgeInsets.all(15.0),
//
//     child: Row(
//       children: [
//         CircleAvatar(
//
//           radius: 40,
//
//           child: Text('${model['Title']}',textAlign: TextAlign.center,),
//
//         ),
//         SizedBox(width: 10,),
//         Expanded(
//
//           child: Column(
//
//             mainAxisSize: MainAxisSize.min,
//
//             crossAxisAlignment: CrossAxisAlignment.start,
//
//             children: [
//
//               Text('${model['Date']}',style: TextStyle(color: Colors.black,fontSize: 16),),
//
//               Text('${model['Time']}',style: TextStyle(color: Colors.grey,fontSize: 16),),
//
//             ],
//
//           ),
//
//         ),
//         SizedBox(width: 10,),
//         IconButton(
//
//           icon:const Icon(Icons.done_outline_rounded,color: Colors.green,),
//
//           onPressed:(){
//
//             CubitNav.get(context).updatedata(
//                 Status:'done',
//                 Id: model['Id']);
//
//           } ,),
//         IconButton(
//           icon:const Icon(Icons.archive,color: Colors.black38,),
//           onPressed:()
//           {
//             CubitNav.get(context).updatedata(
//                 Status: 'archive',
//                 Id: model['Id']);
//           },
//         ),
//       ],
//     ),
//   ),
//   onDismissed: (direction){
//     CubitNav.get(context).deletedata(Id: model['Id']);
//   } ,
// );

Widget BuildBusiness(list, context) => InkWell(
      onDoubleTap: () {
        // Navigateto(context, Web(list['url'],),);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 140,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${list['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${list['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${list['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Future Navigateto(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

Future Navigateandfinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

Widget Articlebuilder(list, context, {isshared = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => BuildBusiness(list[index], context),
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: 10),
      fallback: (context) =>
          isshared ? Container() : Center(child: CircularProgressIndicator()),
    );

// Widget Businesstok(art, context) => InkWell(
//       onTap: () {
//         Navigateto(
//           context,
//           Web(
//             art['url'],
//           ),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   15,
//                 ),
//                 image: DecorationImage(
//                     image: NetworkImage('${art['urlToImage']}'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Expanded(
//               child: Container(
//                   height: 150,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           '${art['title']}',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       Text(
//                         '${art['publishedAt']}',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 19,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );

Widget Mydivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

// Widget Arttok(list, {isshared = false}) => ConditionalBuilder(
//       condition: list.length > 0,
//       builder: (context) => ListView.separated(
//           physics: BouncingScrollPhysics(),
//           itemBuilder: (context, index) => Businesstok(list[index], context),
//           separatorBuilder: (context, index) => SizedBox(
//                 width: 10,
//               ),
//           itemCount: list.length),
//       fallback: (context) =>
//           isshared ? Container() : Center(child: CircularProgressIndicator()),
//     );

void Toasts({
  required ToastsState state,
  required var message,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: enumcolor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastsState { Success, Warning, Error }

Color enumcolor(ToastsState state) {
  Color color;
  switch (state) {
    case ToastsState.Success:
      color = Colors.green;
      break;
    case ToastsState.Warning:
      color = Colors.amber;
      break;
    case ToastsState.Error:
      color = Colors.red;
      break;
  }
  return color;
}

String token = "";

Widget defaultwidthButton(
  VoidCallback? fun,
  String text, {
  double size = 25,
}) =>
    Container(
      width: double.infinity,
      height: 50,
      color: Colors.deepOrange,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size,
          ),
        ),
        onPressed: fun,
      ),
    );

Widget defaultButton(
  VoidCallback? fun,
  String text, {
  double size = 15,
  double? width,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.pinkAccent,
      ),
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size,
          ),
        ),
        onPressed: fun,
      ),
    );

String uId = "";

AppBar defaultAppBar({
  IconData? iconB,
  IconData? iconLe,
  Text? text,
  Text? textB,
  VoidCallback? onpA,
  VoidCallback? onpLe,
}) =>
    AppBar(
      actions: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: MaterialButton(
            onPressed: onpA,
            child: textB,
          ),
        ),
      ],
      title: text,
      leading: IconButton(
        onPressed: onpLe,
        icon: Icon(iconLe),
      ),
    );
