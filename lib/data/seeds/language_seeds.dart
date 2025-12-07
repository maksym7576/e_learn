import 'package:eiga_learn/data/models/languageObject.dart';

/// Фіксовані ID для стандартних мов (1-1000 зарезервовані)
class LanguageIds {
static const int english = 1;
static const int japanese = 2;
static const int spanish = 3;
static const int german = 4;
static const int french = 5;
static const int chinese = 6;
static const int korean = 7;
static const int italian = 8;
static const int portuguese = 9;
static const int russian = 10;

static const int userLanguagesStartId = 1001;
}

Future<List<LanguageObject>> standardLanguages() async {
return [
LanguageObject()
..id = LanguageIds.english
..language = 'English'
..isSupported = true,
LanguageObject()
..id = LanguageIds.japanese
..language = 'Japanese'
..isSupported = true,
LanguageObject()
..id = LanguageIds.spanish
..language = 'Spanish'
..isSupported = true,
LanguageObject()
..id = LanguageIds.german
..language = 'German'
..isSupported = true,
LanguageObject()
..id = LanguageIds.french
..language = 'French'
..isSupported = true,
LanguageObject()
..id = LanguageIds.chinese
..language = 'Chinese'
..isSupported = true,
LanguageObject()
..id = LanguageIds.korean
..language = 'Korean'
..isSupported = true,
];
}