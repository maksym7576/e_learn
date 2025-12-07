import 'package:isar/isar.dart';

part 'userObject.g.dart';
@collection
class UserObject {
  Id id = Isar.autoIncrement;

      @Index(type: IndexType.value)
      int? userLanguageId;
}
