


import 'package:eiga_learn/data/models/languageObject.dart';
import 'package:eiga_learn/data/models/videoObject.dart';
import 'package:eiga_learn/providers/isarProvider.dart';
import 'package:eiga_learn/services/languageService.dart';
import 'package:eiga_learn/services/videoService.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final videoServiceProvider =
StateNotifierProvider<VideoService, List<VideoObject>>(
      (ref) {
    final isar = ref.watch(isarProvider);
    return VideoService(isar);
  },
);

final languageServiceProvider = StateNotifierProvider<LanguageService, List<LanguageObject>>((ref) {
  final isar = ref.watch(isarProvider);
  return LanguageService(isar);
});