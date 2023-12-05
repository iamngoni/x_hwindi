//
//  x_hwindi
//  language
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

enum Language {
  english('English', 'en', 'US'),
  spanish('Spanish', 'es', 'ES'),
  french('French', 'fr', 'FR'),
  german('German', 'de', 'DE'),
  chineseSimplified('Chinese (simplified)', 'zh', 'CN'),
  chineseTraditional('Chinese (traditional)', 'zh', 'TW'),
  japanese('Japanese', 'ja', 'JP'),
  korean('Korean', 'ko', 'KR'),
  arabic('Arabic', 'ar', 'SA'),
  italian('Italian', 'it', 'IT'),
  portuguese('Portuguese', 'pt', 'PT'),
  russian('Russian', 'ru', 'RU'),
  dutch('Dutch', 'nl', 'NL'),
  swedish('Swedish', 'sv', 'SE'),
  norwegian('Norwegian', 'no', 'NO'),
  danish('Danish', 'da', 'DK'),
  finnish('Finnish', 'fi', 'FI'),
  greek('Greek', 'el', 'GR'),
  turkish('Turkish', 'tr', 'TR'),
  hindi('Hindi', 'hi', 'IN'),
  englishUS('English (US)', 'en', 'US'),
  englishUK('English (UK)', 'en', 'GB'),
  zulu('Zulu', 'zu', 'ZA');

  const Language(this.name, this.code, this.countryCode);
  final String name;
  final String code;
  final String countryCode;

  @override
  String toString() => name;
}
