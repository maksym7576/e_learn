import 'package:eiga_learn/widgets/FileUploadButtonWidget.dart';
import 'package:eiga_learn/widgets/SelectedFilesWidget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UploadSectionWidget extends ConsumerStatefulWidget {
  final AnimationController uploadAnimationController;
  final Animation<double> uploadScaleAnimation;
  final Animation<double> uploadOpacityAnimation;

  const UploadSectionWidget({
    super.key,
    required this.uploadAnimationController,
    required this.uploadScaleAnimation,
    required this.uploadOpacityAnimation,
  });

  @override
  ConsumerState<UploadSectionWidget> createState() => _UploadSectionWidgetState();
}

class _UploadSectionWidgetState extends ConsumerState<UploadSectionWidget> {
  final TextEditingController _nameController = TextEditingController();
  String? _videoFile;
  String? _srtFile;

  Future<void> pickVideo() async {
    HapticFeedback.mediumImpact();
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      setState(() => _videoFile = result.files.single.path);
      widget.uploadAnimationController
        ..reset()
        ..forward();
    }
  }

  Future<void> pickSrt() async {
    HapticFeedback.mediumImpact();
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['srt'],
    );
    if (result != null) {
      setState(() => _srtFile = result.files.single.path);
      widget.uploadAnimationController
        ..reset()
        ..forward();
    }
  }

  Future<void> _createVideo() async {
    // TODO: add logic to create video
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SliverToBoxAdapter(
      child: AnimatedBuilder(
        animation: widget.uploadAnimationController,
        builder: (context, child) => Transform.scale(
          scale: widget.uploadScaleAnimation.value,
          child: Opacity(
            opacity: widget.uploadOpacityAnimation.value,
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
                border: Border.all(
                  color: theme.colorScheme.outline.withOpacity(0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.primary,
                              theme.colorScheme.primary.withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.add_circle_outline_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add New Video',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Upload video with subtitles',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Video Name (Optional)',
                      hintText: 'Enter custom name',
                      prefixIcon: Icon(
                        Icons.title_rounded,
                        color: theme.colorScheme.primary,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: theme.colorScheme.surfaceVariant.withOpacity(0.3),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: FileUploadButtonWidget(
                          label: 'Video File',
                          icon: Icons.video_file_rounded,
                          onTap: pickVideo,
                          selectedFile: _videoFile,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FileUploadButtonWidget(
                          label: 'SRT Subtitles',
                          icon: Icons.subtitles_rounded,
                          onTap: pickSrt,
                          selectedFile: _srtFile,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  if (_videoFile != null || _srtFile != null) ...[
                    const SizedBox(height: 20),
                    SelectedFilesWidget(
                      videoFile: _videoFile,
                      srtFile: _srtFile,
                      onClearVideo: () => setState(() => _videoFile = null),
                      onClearSrt: () => setState(() => _srtFile = null),
                    ),
                  ],
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed:
                      (_videoFile != null && _srtFile != null) ? _createVideo : null,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      child: const Text(
                        'Create Video Lesson',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}