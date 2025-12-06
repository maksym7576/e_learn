import 'package:isar/isar.dart';

part 'videoObject.g.dart';
@collection
class VideoObject {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? originalLanguageLong;
  String? translatedLanguageLong;
  String? videoName;
  String? srtPath;
  String? videoPath;
  String? thumbnailPath;
  DateTime? createdAt;
}
