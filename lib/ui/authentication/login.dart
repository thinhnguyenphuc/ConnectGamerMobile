
import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/utils/dialog.dart';
import 'package:connectgamermobile/view_models/auth/login_view_model.dart';
import 'package:connectgamermobile/widgets/buttons/icon_text_button.dart';
import 'package:connectgamermobile/widgets/check_boxes/text_checkbox.dart';
import 'package:connectgamermobile/widgets/texts/text_divider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:connectgamermobile/widgets/text_fields/icon_text_field.dart';
import 'package:connectgamermobile/widgets/texts/partial_link_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resources/themes.dart';
import '../../widgets/animations/IconHero.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with StateVariablesMixin {
  bool hidePass = true;
  final LoginViewModel viewModel = LoginViewModel();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    super.build(context);

    Future<void> login() async {
      if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
        DialogUtils.showError(context, "Username or password is empty");
      } else {
        DialogUtils.showIndicatorDialog(context);
        await viewModel.login(usernameController.text,passwordController.text).then((value){
          if (value.statusCode == 200){
            NavigatorExtension.toHomePage(context, Strings.testUsername);
          } else {
            Navigator.pop(context);
            DialogUtils.showError(context, value.body.substring(1,value.body.length - 1));
          }
        });
      }
    }


    final logoField = IconHero(
      tag: 'logo',
      child: KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        return AnimatedContainer(
          width: !isKeyboardVisible
              ? MediaQuery.of(context).size.width / 1
              : MediaQuery.of(context).size.width / 1.25,
          height: !isKeyboardVisible
              ? MediaQuery.of(context).size.height / 2.75
              : MediaQuery.of(context).size.height / 4,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          child: theme.brightness == Brightness.light
              ? Image.asset(AssetPaths.logoLight)
              : Image.asset(AssetPaths.logoDark),
        );
      }),
    );

    final usernameField = IconTextField(
      iconData: Icons.person,
      hintText: l10n.usernameHintText,
      autoFocus: false,
      iconColor: theme.brightness == Brightness.light ? Colors.black : Colors.white,
      textEditingController: usernameController,
    );

    final passwordField = IconTextField(
      textObscured: hidePass,
      iconData: Icons.vpn_key,
      hintText: l10n.passwordHintText,
      iconColor: theme.brightness == Brightness.light ? Colors.black : Colors.white,
      autoFocus: false,
      passField: true,
      textEditingController: passwordController,
      hidePassButton: IconButton(
          icon: Icon(
            hidePass ? Icons.visibility : Icons.visibility_off,
            color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
          ),
          onPressed: () {
            setState(() {
              hidePass = !hidePass;
            });
          }),
    );

    final rememberField = TextCheckbox(
      text: l10n.rememberMeCheckBoxText,
      checkIconColor: theme.brightness == Brightness.light ? Colors.white : Colors.black,
      borderCheckColor: theme.brightness == Brightness.light ? Colors.black: Colors.white,
    );

    final forgotPasswordField = PartialLinkText(
      linkText: l10n.forgotPassLinkText,
      fontSize: theme.textTheme.bodyText1?.fontSize ?? 15,
      onLinkClickedCallback: () {
        Navigator.pushNamed(context, Routes.signUp);
      },
    );

    final loginButton = IconWithTextButton(
      text: l10n.loginBtnText,
      borderRadius: 50,
      buttonWidth: MediaQuery.of(context).size.width / 2,
      hasGradientColor: true,
      gradientColor: Themes.getGradientFrom(theme).colors,
      textAlign: TextAlign.center,
      onPressedCallback: () {
        login();
      },
    );

    final loginGoogleButton = IconButton(
      iconSize: 30,
      icon: const FaIcon(FontAwesomeIcons.google),
      color: Colors.red,
      onPressed: () {
        Navigator.pushNamed(context, Routes.posts);
      },
    );

    final loginFacebookButton = IconButton(
      onPressed: () {
        Navigator.pushNamed(context, "/homepage");
      },
      icon: const FaIcon(FontAwesomeIcons.facebook),
      color: Colors.blue,
      iconSize: 30,
    );

    final signupTextField = PartialLinkText(
      normalText: l10n.toSignUpNormalText,
      linkText: l10n.toSignUpLinkText,
      fontSize: theme.textTheme.headline6?.fontSize ?? 18,
      onLinkClickedCallback: () {
        Navigator.pushNamed(context, Routes.signUp);
      },
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [logoField],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: insets.extraLarge, vertical: insets.normal),
                    child: Column(
                      children: [
                        Column(
                          children: <Widget>[
                            usernameField,
                            SizedBox(height: insets.extraLarge),
                            passwordField
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: insets.normal),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    rememberField,
                                    forgotPasswordField
                                  ]),
                            ),
                          ],
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      insets.large,
                                      insets.large,
                                      insets.large,
                                      insets.normal),
                                  child: loginButton),
                            ]),
                      ],
                    ),
                  ),
                  TextDivider(text: l10n.loginDividerText),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            10.0, 0, 5.0, 0),
                        child: loginGoogleButton,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            10, 0, 5.0, 0),
                        child: loginFacebookButton,
                      ),
                    ],
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              signupTextField,
                            ],
                          ))),
                ],
              ),
            )));
  }
}
