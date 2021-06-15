import 'package:flutter/material.dart';
import '../common/size_config.dart';

class ReusableButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final Widget child;

  ReusableButton({
    @required this.onPressed,
    @required this.color,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      onPressed: onPressed,
      child: Container(
        height: (SizeConfig.safeBlockVertical * 7.8).roundToDouble(),
        width: double.infinity,
        child: child,
      ),
    );
  }
}
