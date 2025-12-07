import 'package:isar/isar.dart';

part 'wordObject.g.dart';
@collection
class WordObject {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  int? blockId;
  String? originalText;
  String? translatedText;
  int? translatedLanguageId;
  String? infoJson;

}
