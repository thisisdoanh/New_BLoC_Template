import 'dart:ui';

import 'package:new_bloc_template/gen/assets.gen.dart';

enum Language {
  english(
    languageCode: 'en',
    countryCode: 'US',
    languageNameEnglish: 'English',
    languageName: 'English',
  ),
  vietnamese(
    languageCode: 'vi',
    countryCode: 'VN',
    languageNameEnglish: 'Vietnamese',
    languageName: 'Tiếng Việt',
  );

  const Language({
    required this.languageCode,
    required this.countryCode,
    required this.languageNameEnglish,
    required this.languageName,
  });

  final String languageCode;
  final String countryCode;
  final String languageNameEnglish;
  final String languageName;
}

extension LanguageExtension on Language {
  String get nameEnglish => languageNameEnglish;

  String get name => languageName;

  String get code => languageCode;

  Locale get locale => Locale(languageCode, countryCode);

  AssetGenImage get image {
    return switch (this) {
      Language.english => Assets.images.language.english,
      Language.vietnamese => Assets.images.language.vietnam,
    };
  }

  static Language fromCode(String langCode) {
    return Language.values.firstWhere(
      (language) => language.languageCode == langCode,
      orElse: () => Language.english,
    );
  }

  static Language fromName(String name) {
    return Language.values.firstWhere(
      (language) => language.languageName == name,
      orElse: () => Language.english,
    );
  }
}

extension LanguageStringExtension on String {
  Language fromCode() {
    return Language.values.firstWhere(
      (language) => language.languageCode == this,
      orElse: () => Language.english,
    );
  }

  Language fromName() {
    return Language.values.firstWhere(
      (language) => language.languageName == this,
      orElse: () => Language.english,
    );
  }
}
