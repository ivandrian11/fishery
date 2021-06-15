import '../common/config.dart';
import '../common/size_config.dart';
import '../model/dict_model.dart';
import 'package:flutter/material.dart';

class DictItem extends StatelessWidget {
  final DictModel dict;

  DictItem(this.dict);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(dict.title, style: TextStyle(color: mainTextColor)),
      trailing: Icon(
        Icons.navigate_next,
        color: mainTextColor,
        size: (SizeConfig.safeBlockHorizontal * 6.67).roundToDouble(),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(dict.title, style: paragraphOneTextStyle),
              content: Text(
                dict.description,
                textAlign: TextAlign.justify,
                style: paragraphTwoTextStyle,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Ok', style: paragraphOneTextStyle),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
