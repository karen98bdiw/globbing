import 'package:flutter/material.dart';
import '../../utils/languageState.dart';
import 'package:provider/provider.dart';

import 'registerScreens/registerScreen.dart';
import './logInScreen.dart';

class IntroducingScreen extends StatelessWidget {
  static final routeName = "IntroducingScreen";
  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
        backgroundColor: Color.fromRGBO(81, 84, 89, 1),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Globbing",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    //colum is stretching the circle avator ,so i use row for stop that
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 90,
                        backgroundImage:
                            AssetImage("assets/images/thanos.jpeg"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  _introText(),
                  SizedBox(
                    height: 40,
                  ),
                  _loginBtn(),
                  SizedBox(
                    height: 25,
                  ),
                  _registerBtn(),
                ],
              ),
            ),
            Positioned(
              child: _languageSetter(),
              top: 60,
            ),
          ],
        ));
  }

  Widget _introText() {
    return Consumer<LanguageItems>(
      builder: (context, languageItems, child) => Text(
        languageItems.textBundles.getCurentBundle()["introTxt"],
        style: TextStyle(
          fontSize: 27,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _loginBtn() {
    return Consumer<LanguageItems>(
      builder: (context, languageItems, child) => FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed(LogInScreen.routeName);
        },
        child: Text(
          languageItems.textBundles.getCurentBundle()["logBtnTxt"],
          style: TextStyle(fontSize: 20),
        ),
        padding: EdgeInsets.symmetric(vertical: 13),
        color: Color.fromRGBO(107, 232, 130, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        textColor: Colors.white,
      ),
    );
  }

  Widget _registerBtn() {
    return Consumer<LanguageItems>(
      builder: (context, languageItems, child) => OutlineButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RegisterScreen.routeName);
        },
        child: Text(
          languageItems.textBundles.getCurentBundle()["regBtnTxt"],
          style: TextStyle(fontSize: 20),
        ),
        padding: EdgeInsets.symmetric(vertical: 13),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        borderSide:
            BorderSide(color: Color.fromRGBO(107, 232, 130, 1), width: 2),
      ),
    );
  }

  Widget _languageSetter() {
    return Consumer<LanguageItems>(
        builder: (context, languageState, child) => GestureDetector(
              onTap: () => _showChangeLanguageDiolog(context, languageState),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  color: Colors.black45,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 10,
                        backgroundImage:
                            AssetImage(languageState.getCurrentLanguage().icon),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${languageState.getCurrentLanguage().language}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  void _showChangeLanguageDiolog(ctx, LanguageItems languagesState) {
    showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...languagesState.availableLanguages
                      .map((e) => _diologItem(e.language, e.code, ctx))
                      .toList()
                ],
              ),
            )).then((value) => languagesState.setCurrentLanguage(value));
  }

  Widget _diologItem(text, returningValue, context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(returningValue),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
