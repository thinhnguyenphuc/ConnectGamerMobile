import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/view_models/auth/signup_view_model.dart';
import 'package:connectgamermobile/widgets/buttons/icon_text_button.dart';
import 'package:connectgamermobile/widgets/text_fields/icon_text_field.dart';
import 'package:connectgamermobile/widgets/texts/partial_link_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../utils/dialog.dart';
import '../../widgets/animations/IconHero.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with StateVariablesMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController rePasswordController = TextEditingController();

    SignUpViewModel viewModel = SignUpViewModel();

    Future<void> signup() async {
      if (usernameController.text.isEmpty ||
          passwordController.text.isEmpty ||
          emailController.text.isEmpty ||
          rePasswordController.text.isEmpty) {
        DialogUtils.showError(context, "A field is empty");
      } else if(rePasswordController.text != passwordController.text){
        DialogUtils.showError(context, "Password and rePassword are not the same");
      } else {
        DialogUtils.showIndicatorDialog(context);
        await viewModel
            .signup(emailController.text, usernameController.text,
                passwordController.text)
            .then((value) {
          if (value.statusCode == 200) {
            Navigator.pop(context);
            DialogUtils.showSuccess(context);
          } else {
            Navigator.pop(context);
            DialogUtils.showError(
                context, value.body.substring(1, value.body.length - 1));
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
              ? Image.asset("assets/images/logo/logo_black.png")
              : Image.asset("assets/images/logo/logo_white.png"),
        );
      }),
    );

    final usernameInputField = IconTextField(
      hintText: l10n.usernameHintText,
      iconData: Icons.person,
      textEditingController: usernameController,
    );

    final passwordInputField = IconTextField(
      hintText: l10n.passwordHintText,
      iconData: Icons.vpn_key,
      textEditingController: passwordController,
    );

    final reEnterPasswordInputField = IconTextField(
      hintText: l10n.reenterPassHintText,
      iconData: Icons.vpn_key_outlined,
      textEditingController: rePasswordController,
    );

    final emailInputField = IconTextField(
      hintText: l10n.emailHintText,
      iconData: Icons.email,
      textEditingController: emailController,
    );

    final signUpButton = IconWithTextButton(
      text: l10n.signUpBtnText,
      textAlign: TextAlign.center,
      borderRadius: 50,
      iconSize: 20,
      buttonWidth: MediaQuery.of(context).size.width / 2,
      hasGradientColor: true,
      textStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold),
      onPressedCallback: () {
        signup();
      },
    );

    final loginText = PartialLinkText(
      normalText: l10n.toLoginNormalText,
      linkText: l10n.toLoginLinkText,
      onLinkClickedCallback: () {
        Navigator.popAndPushNamed(context, Routes.login);
      },
    );
    final inputFieldDistance = SizedBox(
      height: insets.extraLarge,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [logoField],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(insets.extraLarge, insets.normal,
                      insets.extraLarge, insets.normal),
                  child: Column(
                    children: [
                      emailInputField,
                      inputFieldDistance,
                      usernameInputField,
                      inputFieldDistance,
                      passwordInputField,
                      inputFieldDistance,
                      reEnterPasswordInputField,
                      inputFieldDistance,
                      SizedBox(height: insets.large),
                      signUpButton
                    ],
                  ),
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: loginText,
                    )),
              ],
            ),
          )),
    );
  }
}
