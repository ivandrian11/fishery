import '../../services/error_service.dart';
import '../../state/auth_state.dart';
import '../../state/user_state.dart';
import '../../common/config.dart';
import '../../common/size_config.dart';
import '../../widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../ui/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthState());
    final userC = Get.find<UserState>();

    Widget _header = Column(
      children: [
        Text('Welcome Back!', style: headingOneTextStyle),
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

    Widget _forgotPasswordText = Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {},
            child: Text(
              'Forgot password?',
              style: TextStyle(
                color: mainTextColor,
                decoration: TextDecoration.underline,
                fontWeight: medium,
                fontSize:
                    (SizeConfig.safeBlockHorizontal * 4.17).roundToDouble(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: (SizeConfig.safeBlockVertical * 3.9).roundToDouble(),
        ),
      ],
    );

    Widget _loginButton = Column(
      children: [
        _isLoading
            ? Center(child: CircularProgressIndicator())
            : ReusableButton(
                onPressed: () async {
                  if (authC.email.text.isEmpty || authC.password.text.isEmpty) {
                    showError('All fields must be filled!');
                  } else {
                    setState(() {
                      _isLoading = true;
                    });
                    var user = await userC.login(
                      authC.email.text,
                      authC.password.text,
                    );

                    setState(() {
                      _isLoading = false;
                    });
                    if (user == null) {
                      showError('Incorrect email or pasword!');
                    } else {
                      userC.savePref(user);
                      Get.offNamed('/home');
                    }
                  }
                },
                color: primaryColor,
                child: Center(
                  child: Text('Login', style: textButtonTextStyle),
                ),
              ),
        SizedBox(
          height: (SizeConfig.safeBlockVertical * 2.6).roundToDouble(),
        ),
      ],
    );

    Widget _signUpOption = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don’t have any account?',
            style: paragraphTwoTextStyle.copyWith(color: mainTextColor)),
        SizedBox(
          width: (SizeConfig.safeBlockHorizontal * 2.2).roundToDouble(),
        ),
        InkWell(
          onTap: _isLoading ? null : () => Get.toNamed('/register'),
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: primaryColor,
              decoration: TextDecoration.underline,
              fontWeight: bold,
              fontSize: (SizeConfig.safeBlockHorizontal * 4.17).roundToDouble(),
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
                  _forgotPasswordText,
                  _loginButton,
                  _signUpOption,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
