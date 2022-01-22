import 'package:flutter/material.dart';
import 'package:movie/screen_size.dart';


class RoundedButton extends StatelessWidget {
  RoundedButton({this.onClick,this.roundColor,this.text});
  final String text;
  final Color roundColor;
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*2),
      child: Material(
        elevation: 5.0,
        color: roundColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onClick,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}