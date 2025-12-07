import 'package:isar/isar.dart';

part 'languageObject.g.dart';
@collection
class LanguageObject {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? language;
  bool? isSupported;
}
