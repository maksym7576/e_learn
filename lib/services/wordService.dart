import 'package:eiga_learn/models/wordObject.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class WordService extends StateNotifier<List<WordObject>> {
  final Isar db;
  WordService(this.db) : super([]);

  Future<void> loadWordsByPhrasesIds(List<int> wordIds) async {
    List<WordObject> allWords = [];

    for (final wordId in wordIds) {
      final words = await db.wordObjects.where().filter().blockIdEqualTo(wordId).findAll();
      allWords.addAll(words);
    }
    state = allWords;
  }
}