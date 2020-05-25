import 'package:flutter/material.dart';

class BtnPattern extends StatelessWidget {

  final String text;
  final String route;
  final Function function;

  BtnPattern({this.text = "", this.route, this.function});


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 0),
      width: MediaQuery.of(context).size.width ,
      child: FlatButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius:
        BorderRadius.circular(8.0)),
        onPressed: () async{
          route != null ?
          Navigator.pushNamed(context, route):
          function();
        },
        child: Text(text, style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
