import 'package:eiga_learn/models/blockObject.dart';
import 'package:eiga_learn/services/phraseService.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class BlockService extends StateNotifier<List<BlockObject>> {
  final Isar db;
  BlockService(this.db) : super([]);

  Future<void> loadBlocksByPhraseIds(List<int> phraseIds) async {
    List<BlockObject> allBlocks = [];

    for (final phraseId in phraseIds) {
      final blocks = await db.blockObjects
          .where()
          .filter()
          .phraseIdEqualTo(phraseId)
          .findAll();
      allBlocks.addAll(blocks);
    }

    state = allBlocks;
  }

  List<BlockObject> getBlocksForPhrase(int phraseId) {
    return state.where((b) =>b.phraseId == phraseId).toList();
  }
}