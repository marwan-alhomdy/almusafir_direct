import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../helper/language.helper.dart';

class Country {
  const Country(
      {required this.nameEn,
      required this.nameAr,
      required this.flag,
      required this.image,
      required this.code});

  Country.empty(
      {this.nameEn = "Yemen",
      this.nameAr = "اليمن",
      this.image = "",
      this.flag = "🇾🇪",
      this.code = "+967"}) {
    CountryManager.initCountries();
  }

  final String nameEn;
  final String nameAr;
  final String image;
  final String flag;
  final String code;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      nameEn: json['name'],
      nameAr: json['arabicName'],
      image: json['image'],
      flag: json['flag'],
      code: json['code'],
    );
  }

  String get name =>
      LanguageHelper.chooseLabelLanguage(arabic: nameAr, english: nameEn);
}

class CountryManager {
  static Country firstCountry() => countries.firstOrNull ?? Country.empty();

  static Country findCountry(String code) {
    for (Country country in countries) {
      if (country.code == code) {
        return country;
      }
    }
    return countries.firstOrNull ?? Country.empty();
  }

  static void initCountries() async {
    try {
      final data = await rootBundle.loadString('assets/json/countries.json');
      final List<dynamic> jsonList = json.decode(data) as List<dynamic>;
      countries = jsonList
          .map((json) => Country.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      countries = [];
    }
  }

  static List<Country> countries = [];
}
