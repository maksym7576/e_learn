

import 'package:eiga_learn/models/videoObject.dart';
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

  Future<void> addVideo(VideoObject video) async {
    video.createdAt = DateTime.now();
    await db.writeTxn(() async {
      await db.videoObjects.put(video);
    });
    await loadVideos();
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

}