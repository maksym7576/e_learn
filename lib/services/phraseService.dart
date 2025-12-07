


import 'package:eiga_learn/data/models/phraseObject.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class PhraseService extends StateNotifier<List<PhraseObject>> {
   final Isar db;
    PhraseService(this.db) : super([]);

    Future<void> loadPhrasesByVideoId(int videoId) async {
      final phrases = await db.phraseObjects.where().filter().videoIdEqualTo(videoId).findAll();
      state = phrases;
   }

   Future<void> addPhrase(PhraseObject phrase) async {
      await db.writeTxn(() async {
        await db.phraseObjects.put(phrase);
      });
      await loadPhrasesByVideoId(phrase.videoId!);
   }
}