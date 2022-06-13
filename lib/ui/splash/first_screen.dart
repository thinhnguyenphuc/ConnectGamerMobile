import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/widgets/buttons/icon_text_button.dart';
import 'package:flutter/material.dart';

import '../../resources/themes.dart';
import '../../widgets/animations/IconHero.dart';
import '../authentication/login.dart';
import '../authentication/signup.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstScreen> with StateVariablesMixin {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final logoField = IconHero(
      tag: 'logo',
      child: Image(image: AssetImage(AssetPaths.logoLight)),
    );

    final loginButton = IconHero(
      tag: 'login',
      onTap: () {
        Navigator.popAndPushNamed(context, Routes.login);
      },
      child: IconWithTextButton(
        text: l10n.loginBtnText,
        textAlign: TextAlign.center,
        buttonWidth: 200,
        borderRadius: 50,
        iconSize: 20,
        hasGradientColor: true,
        color: Colors.white,
        gradientColor: Themes.getGradientFrom(Theme.of(context)).colors,
        textStyle: style.copyWith(color: Colors.white),
        onPressedCallback: () {
          Navigator.popAndPushNamed(context, Routes.login);
        },
      )
    );

    final signUpButton = IconHero(
        tag: 'register',
        onTap: () {
          Navigator.popAndPushNamed(context,
             Routes.signUp);
        },
        child: IconWithTextButton(
          text: l10n.logOutBtnText,
          textAlign: TextAlign.center,
          buttonWidth: 200,
          borderRadius: 50,
          iconSize: 20,
          hasGradientColor: true,
          gradientColor: Themes.getGradientFrom(Theme.of(context)).colors,
          color: Colors.white,
          textStyle: style.copyWith(color: Colors.white),
          onPressedCallback: () {
            Navigator.popAndPushNamed(context, Routes.signUp);
          },
        ));

    const signatureText = Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: ' Design and copyright by ',
          ),
          TextSpan(
              text: 'ConnectGamerTeam',
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontStyle: FontStyle.italic)),
        ],
      ),
    );

    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image: const AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
                gradient: const LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.white,
                      Colors.black38,
                      Colors.black54,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.4, 0.6, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[logoField],
                            ))),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        50.0, 100, 50.0, 0),
                                    child: loginButton),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        50.0, 20, 50.0, 0),
                                    child: signUpButton),
                              ],
                            ))),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
