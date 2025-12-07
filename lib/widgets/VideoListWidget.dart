import 'package:eiga_learn/services/VideoService.dart';
import 'package:eiga_learn/widgets/EmptyStateWidget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/ServicesProviders.dart';
import 'VideoCardWidget.dart';

class VideoListWidget extends ConsumerWidget {
  final Animation<Offset> slideAnimation;

  const VideoListWidget({super.key, required this.slideAnimation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoList = ref.watch(videoServiceProvider);
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.video_library_rounded,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Your Videos',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${videoList.length}',
                    style: TextStyle(
                      color: theme.colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          videoList.isEmpty
              ? SliverFillRemaining(child: EmptyStateWidget())
              : SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final video = videoList[index];
                  return SlideTransition(
                    position: slideAnimation,
                    child: VideoCardWidget(video: video, index: index),
                  );
                },
                childCount: videoList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}