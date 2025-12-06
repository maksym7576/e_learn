import 'package:isar/isar.dart';

part 'blockObject.g.dart';
@collection
class BlockObject {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  int? phraseId;
  String? originalLanguageLong;
  String? translatedLanguageLong;
  String? videoName;
  DateTime? startTime;
  DateTime? endTime;
}
