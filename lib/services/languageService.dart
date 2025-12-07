import 'package:eiga_learn/data/models/languageObject.dart';
import 'package:eiga_learn/data/seeds/language_seeds.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class LanguageService extends StateNotifier<List<LanguageObject>> {
  final Isar db;

  LanguageService(this.db) : super([]);

  Future<void> loadLanguages() async {
    final existing = await getAllLanguages();
    final standards = await standardLanguages();

    for (final stdLang in standards) {
      final exists = existing.any((e) => e.id == stdLang.id);
      if (!exists) {
        await addLanguage(stdLang);
      }
    }

    // Оновлюємо state після змін
    state = await getAllLanguages();
  }

  Future<List<LanguageObject>> getAllLanguages() async {
    return await db.languageObjects.where().findAll();
  }

  Future<void> addLanguage(LanguageObject lang) async {
    await db.writeTxn(() async {
      await db.languageObjects.put(lang);
    });
  }

  Future<Id> _getNextUserLanguageId() async {
    final allLanguages = await getAllLanguages();

    if (allLanguages.isEmpty) {
      return LanguageIds.userLanguagesStartId;
    }

    final userLanguageIds = allLanguages
        .where((lang) => lang.id >= LanguageIds.userLanguagesStartId)
        .map((lang) => lang.id)
        .toList();

    if (userLanguageIds.isEmpty) {
      return LanguageIds.userLanguagesStartId;
    }

    return userLanguageIds.reduce((a, b) => a > b ? a : b) + 1;
  }

  Future<void> createUserLanguage(LanguageObject languageObj) async {
    final existing = await getAllLanguages();

    if (existing.any((e) => e.language?.toLowerCase() == languageObj.language?.toLowerCase())) {
      throw Exception('Мова "${languageObj.language}" вже існує');
    }

    final nextId = await _getNextUserLanguageId();

    final newLang = LanguageObject()
      ..id = nextId
      ..language = languageObj.language
      ..isSupported = false;

    await addLanguage(newLang);
    state = await getAllLanguages();
  }

  Future<void> deleteLanguageById(Id languageId) async {
    if (languageId < LanguageIds.userLanguagesStartId) {
      throw Exception('Impossible to delete standard language $languageId');
    }

    await db.writeTxn(() async {
      await db.languageObjects.delete(languageId);
    });

    state = await getAllLanguages();
  }

  Future<void> updateLanguage(LanguageObject languageObj) async {
    await db.writeTxn(() async {
      await db.languageObjects.put(languageObj);
    });

    state = await getAllLanguages();
  }

  Future<bool> languageExists(String languageName) async {
    final lang = await db.languageObjects
        .filter()
        .languageEqualTo(languageName)
        .findFirst();

    return lang != null;
  }

  Future<LanguageObject?> getLanguageByName(String languageName) async {
    return await db.languageObjects
        .filter()
        .languageEqualTo(languageName)
        .findFirst();
  }

  Future<List<LanguageObject>> getSupportedLanguages() async {
    return await db.languageObjects
        .filter()
        .isSupportedEqualTo(true)
        .findAll();
  }

  Future<List<LanguageObject>> getUserLanguages() async {
    return await db.languageObjects
        .filter()
        .isSupportedEqualTo(false)
        .findAll();
  }
}
