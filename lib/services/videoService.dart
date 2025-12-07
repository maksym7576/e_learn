import 'package:eiga_learn/data/models/videoObject.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class VideoService extends StateNotifier<List<VideoObject>> {
  final Isar db;

  VideoService(this.db) : super([]) {
    loadVideos();
  }

  Future<void> loadVideos() async {
    final videos = await db.videoObjects.where().findAll();
    state = videos;
  }

  Future<int> addVideo(VideoObject video) async {
    video.createdAt = DateTime.now();
    late int id;
    await db.writeTxn(() async {
      id = await db.videoObjects.put(video);
    });
    await loadVideos();
    return id;
  }

  Future<void> updateVideo(VideoObject updated) async {
    await db.writeTxn(() async {
      await db.videoObjects.put(updated);
    });
    await loadVideos();
    await loadVideos();
  }

  Future<VideoObject?> getVideoById(int id) async {
    return await db.videoObjects.get(id);
  }

  Future<void> updateVideoPath(int videoId, String newPath) async {
    final video = await db.videoObjects.get(videoId);
    if (video == null) {
      return;
    }
    video.videoPath = newPath;
    await db.writeTxn(() async {
      await db.videoObjects.put(video);
    });
    await loadVideos();
  }

  Future<void> deleteVideo(int videoId) async {
    await db.writeTxn(() async {
      await db.videoObjects.delete(videoId);
    });
    await loadVideos();
  }

  Future<void> updateVideoName(int videoId, String newName) async {

    final video = await db.videoObjects.get(videoId);
    if (video == null) {
      return;
    }

    video.videoName = newName;

    await db.writeTxn(() async {
      await db.videoObjects.put(video);
    });

    await loadVideos();
  }
}
