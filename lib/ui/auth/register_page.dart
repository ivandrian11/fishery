import '../../services/error_service.dart';
import '../../state/auth_state.dart';
import '../../state/user_state.dart';
import '../../common/config.dart';
import '../../common/size_config.dart';
import '../../widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  bool _isContainsNumber = false;
  bool _isLengthAtleastSixChar = false;
  bool _isContainsAt = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final userC = Get.find<UserState>();
    final authC = Get.find<AuthState>();

    Widget _header = Column(
      children: [
        Text('Welcome!', style: headingOneTextStyle),
        SizedBox(
          height: (SizeConfig.safeBlockVertical * 1.3).roundToDouble(),
        ),
        Text('Please enter your account here', style: paragraphTwoTextStyle),
        SizedBox(
          height: (SizeConfig.safeBlockVertical * 5.2).roundToDouble(),
        ),
      ],
    );

    Widget _textFields = Column(
      children: [
        TextField(
          controller: authC.email,
          onChanged: (input) => _isContainsAt = input.contains('@'),
          style: inputTextStyle,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: textFieldDecoration.copyWith(
            labelText: 'Email',
            hintText: 'example@gmail.com',
            prefixIcon: Icon(
              Icons.alternate_email,
              color: mainTextColor,
              size: (SizeConfig.safeBlockHorizontal * 6.67).roundToDouble(),
            ),
          ),
        ),
        SizedBox(
          height: (SizeConfig.safeBlockVertical * 2.6).roundToDouble(),
        ),
        TextField(
          controller: authC.password,
          onChanged: (input) => setState(() {
            _isLengthAtleastSixChar = input.length >= 6;
            _isContainsNumber = input.contains(RegExp(r'[0-9]'));
          }),
          obscureText: _obscureText,
          style: inputTextStyle,
          decoration: textFieldDecoration.copyWith(
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.lock,
              color: mainTextColor,
              size: (SizeConfig.safeBlockHorizontal * 6.67).roundToDouble(),
            ),
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscureText = !_obscureText),
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: secondaryTextColor,
                size: (SizeConfig.safeBlockHorizontal * 6.67).roundToDouble(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: (SizeConfig.safeBlockVertical * 1.95).roundToDouble(),
        ),
      ],
    );

    Widget _validationText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Password must contain:',
          style: paragraphOneTextStyle,
        ),
        SizedBox(
          height: (SizeConfig.safeBlockVertical * 2.6).roundToDouble(),
        ),
        Row(
          children: [
            Icon(
              Icons.check_box_rounded,
              size: (SizeConfig.safeBlockHorizontal * 6.67).roundToDouble(),
              color:
                  _isLengthAtleastSixChar ? primaryColor : secondaryTextColor,
            ),
            SizedBox(
              width: (SizeConfig.safeBlockHorizontal * 2.2).roundToDouble(),
            ),
            Text(
              'Atleast 6 characters',
              style: _isLengthAtleastSixChar
                  ? paragraphTwoTextStyle.copyWith(color: mainTextColor)
                  : paragraphTwoTextStyle,
            ),
          ],
        ),
        SizedBox(
          height: (SizeConfig.safeBlockVertical * 2.6).roundToDouble(),
        ),
        Row(
          children: [
            Icon(
              Icons.check_box_rounded,
              color: _isContainsNumber ? primaryColor : secondaryTextColor,
              size: (SizeConfig.safeBlockHorizontal * 6.67).roundToDouble(),
            ),
            SizedBox(
              width: (SizeConfig.safeBlockHorizontal * 2.2).roundToDouble(),
            ),
            Text(
              'Contains a number',
              style: _isContainsNumber
                  ? paragraphTwoTextStyle.copyWith(color: mainTextColor)
                  : paragraphTwoTextStyle,
            ),
          ],
        ),
        SizedBox(
          height: (SizeConfig.safeBlockVertical * 1.95).roundToDouble(),
        ),
      ],
    );

    Widget _signUpButton = Column(
      children: [
        _isLoading
            ? Center(child: CircularProgressIndicator())
            : ReusableButton(
                onPressed: () async {
                  if (!_isContainsAt) {
                    showError('Your email is invalid.');
                  } else if (!_isContainsNumber || !_isLengthAtleastSixChar) {
                    showError('Your password is invalid.');
                  } else {
                    setState(() {
                      _isLoading = true;
                    });

                    var data = await userC.register(
                      authC.email.text,
                      authC.password.text,
                    );

                    setState(() {
                      _isLoading = false;
                    });

                    if (data == null) {
                      showError('This email already exit.');
                    } else {
                      authC.reset();
                      Get.back();
                    }
                  }
                },
                color: primaryColor,
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: textButtonTextStyle,
                  ),
                ),
              ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                children: [
                  _header,
                  _textFields,
                  _validationText,
                  _signUpButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
