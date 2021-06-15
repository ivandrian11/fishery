import '../../state/user_state.dart';
import '../../common/config.dart';
import '../../common/size_config.dart';
import '../../widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userC = Get.find<UserState>();

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: secondaryTextColor,
                radius: (SizeConfig.safeBlockHorizontal * 20).roundToDouble(),
              ),
              SizedBox(
                height: (SizeConfig.safeBlockVertical * 2.6).roundToDouble(),
              ),
              Text(userC.user.email, style: paragraphOneTextStyle),
              SizedBox(
                height: (SizeConfig.safeBlockVertical * 5.2).roundToDouble(),
              ),
              ReusableButton(
                onPressed: () async {
                  await userC.logOut();
                  Get.offNamed('/login');
                },
                color: primaryColor,
                child: Center(
                  child: Text('Logout', style: textButtonTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
