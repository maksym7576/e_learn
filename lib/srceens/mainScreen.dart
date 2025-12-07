import 'package:eiga_learn/providers/servicesProviders.dart';
import 'package:eiga_learn/widgets/AppBarWidget.dart';
import 'package:eiga_learn/widgets/EmptyStateWidget.dart';
import 'package:eiga_learn/widgets/UploadSectionWidget.dart';
import 'package:eiga_learn/widgets/VideoCardWidget.dart';
import 'package:eiga_learn/widgets/VideoListHeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen>
    with TickerProviderStateMixin {
  late AnimationController _uploadAnimationController;
  late AnimationController _listAnimationController;
  late Animation<double> _uploadScaleAnimation;
  late Animation<double> _uploadOpacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _uploadAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _listAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _uploadScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _uploadAnimationController, curve: Curves.elasticOut),
    );
    _uploadOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _uploadAnimationController, curve: Curves.easeOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _listAnimationController, curve: Curves.easeOutCubic));

    _uploadAnimationController.forward();
    _listAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final videoList = ref.watch(videoServiceProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0A0A0A)
          : const Color(0xFFFAFAFA),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          AppBarWidget(),
          UploadSectionWidget(
            uploadAnimationController: _uploadAnimationController,
            uploadScaleAnimation: _uploadScaleAnimation,
            uploadOpacityAnimation: _uploadOpacityAnimation,
          ),
          VideoListHeaderWidget(),
          if (videoList.isEmpty)
            SliverFillRemaining(
              child: EmptyStateWidget(),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final video = videoList[index];
                    return SlideTransition(
                      position: _slideAnimation,
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

  @override
  void dispose() {
    _uploadAnimationController.dispose();
    _listAnimationController.dispose();
    super.dispose();
  }
}