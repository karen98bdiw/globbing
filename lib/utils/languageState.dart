import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageItem {
  final double id;
  final double bundleId;
  final String language;
  final String code;
  final String icon;
  bool isCurent = false;

  LanguageItem({
    @required this.id,
    @required this.bundleId,
    @required this.language,
    @required this.code,
    @required this.icon,
    this.isCurent,
  });
}

class LanguageItems extends ChangeNotifier {
  final textBundles = TextBundles();
  final availableLanguages = [
    LanguageItem(
      id: 1,
      bundleId: 1,
      language: "English",
      code: "en",
      icon: "assets/images/united-kingdom.png",
      isCurent: true,
    ),
    LanguageItem(
      id: 2,
      bundleId: 2,
      language: "Русский",
      icon: "assets/images/russia.png",
      code: "ru",
    ),
    LanguageItem(
      id: 3,
      bundleId: 3,
      language: "Հայերեն",
      icon: "assets/images/armenia.png",
      code: "am",
    ),
  ];

  setCurrentLanguage(String languageCode) {
    availableLanguages.forEach((element) {
      element.isCurent = false;
    });
    availableLanguages
        .firstWhere((element) => element.code == languageCode)
        .isCurent = true;
    textBundles.setCurentBundle(languageCode);
    notifyListeners();
  }

  LanguageItem getCurrentLanguage() {
    return availableLanguages.firstWhere((element) => element.isCurent);
  }
}

class TextBundles {
  var curentBundleCode = "en";
  final bundles = [
    {
      "id": 1,
      "code": "en",
      "introTxt": "Buy online,get in Armenia with Globbing",
      "logBtnTxt": "Login",
      "regBtnTxt": "Register",
    },
    {
      "id": 2,
      "code": "am",
      "introTxt": "Գնեք օնլայն,ստացեք ՀՀ֊ում Գլոբբինգի հետ",
      "logBtnTxt": "Մուտք գործել",
      "regBtnTxt": "Գրանցվել",
    },
    {
      "id": 3,
      "code": "ru",
      "introTxt": "Покупайте онлайн,получите в Армении с Глоббинг",
      "logBtnTxt": "Логин",
      "regBtnTxt": "Регистрация",
    },
  ];

  void setCurentBundle(String code) {
    print("setted");
    curentBundleCode = code;
  }

  Map<String, Object> getCurentBundle() {
    var a =
        bundles.firstWhere((element) => element["code"] == curentBundleCode);
    print("$a");
    return a;
  }
}
