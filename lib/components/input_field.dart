import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String hint;
  final bool obscure;
  final IconData icon;
  final String label;
  final Color colorLine;
  final double sizeFont;
  final bool isCenter;


  InputField({this.hint = "", this.obscure = false, this.icon, this.label, this.colorLine = Colors.red, this.sizeFont  = 15, this.isCenter = false});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.transparent,
            width: 0.4,
          )
        )
      ),
      child: Theme(
        data: ThemeData(
          primaryColor: colorLine,
        ),
        child: TextFormField(
          textAlign: isCenter ? TextAlign.center : TextAlign.start ,
          obscureText: obscure,
          style: TextStyle(color: Colors.white, ),
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: sizeFont
            ),
            icon: icon == null ? null : Icon(icon, color: Colors.white,),
            labelText: label,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white30)
          ),
        ),
      ),
    );
  }
}
