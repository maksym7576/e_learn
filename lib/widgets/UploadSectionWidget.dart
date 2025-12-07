import 'package:eiga_learn/data/models/languageObject.dart';
import 'package:eiga_learn/providers/ServicesProviders.dart';
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
  final TextEditingController _newLanguageController = TextEditingController();
  String? _videoFile;
  String? _srtFile;
  int? _videoLanguageId;
  int? _userLanguageId;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(languageServiceProvider.notifier).loadLanguages();
    });
  }

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
    if (_videoFile == null || _srtFile == null || _videoLanguageId == null || _userLanguageId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    // TODO: pass _videoLanguageId and _userLanguageId to video creation method
    print('Creating video:');
    print('Video language ID: $_videoLanguageId');
    print('User language ID: $_userLanguageId');
  }

  Future<void> _addNewLanguage(String languageName) async {
    if (languageName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter language name')),
      );
      return;
    }

    try {
      final newLang = LanguageObject()
        ..language = languageName
        ..isSupported = false;

      await ref.read(languageServiceProvider.notifier).createUserLanguage(newLang);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Language "$languageName" added successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception: ', '')),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _showAddLanguageDialog() async {
    _newLanguageController.clear();

    return showDialog(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.translate_rounded,
                        color: theme.colorScheme.primary,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Add New Language',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _newLanguageController,
                  autofocus: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    labelText: 'Language Name',
                    hintText: 'e.g., Spanish, French, German',
                    prefixIcon: Icon(
                      Icons.language_rounded,
                      color: theme.colorScheme.primary,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.surfaceVariant.withOpacity(0.3),
                  ),
                  onSubmitted: (value) {
                    Navigator.pop(context);
                    _addNewLanguage(value.trim());
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _addNewLanguage(_newLanguageController.text.trim());
                      },
                      icon: const Icon(Icons.check_rounded, size: 20),
                      label: const Text('Add Language'),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageButton({
    required String label,
    required int? selectedId,
    required Function(int?) onChanged,
    required IconData icon,
    required Color color,
  }) {
    final languages = ref.watch(languageServiceProvider);
    final theme = Theme.of(context);
    final selectedLanguage = languages.firstWhere(
          (lang) => lang.id == selectedId,
      orElse: () => LanguageObject()..language = null,
    );

    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurfaceVariant.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(icon, color: color, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              label,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Select from list',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: languages.isEmpty
                      ? Center(
                    child: CircularProgressIndicator(color: color),
                  )
                      : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: languages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == languages.length) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              _showAddLanguageDialog();
                            },
                            icon: Icon(Icons.add_rounded, color: color),
                            label: Text(
                              'Add New Language',
                              style: TextStyle(color: color),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(color: color.withOpacity(0.5)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        );
                      }

                      final lang = languages[index];
                      final isSelected = selectedId == lang.id;

                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 4,
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? color.withOpacity(0.15)
                                : theme.colorScheme.surfaceVariant.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.language_rounded,
                            color: isSelected ? color : theme.colorScheme.onSurfaceVariant,
                            size: 20,
                          ),
                        ),
                        title: Text(
                          lang.language ?? 'Unknown',
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                            color: isSelected
                                ? color
                                : theme.colorScheme.onSurface,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (lang.isSupported == true)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.green.shade400,
                                      Colors.green.shade600,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.verified_rounded,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Supported',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            else
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surfaceVariant,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: theme.colorScheme.outline.withOpacity(0.3),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.person_rounded,
                                      size: 12,
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Custom',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: theme.colorScheme.onSurfaceVariant,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (isSelected) ...[
                              const SizedBox(width: 8),
                              Icon(
                                Icons.check_circle_rounded,
                                color: color,
                                size: 24,
                              ),
                            ],
                          ],
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          onChanged(lang.id);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selectedId != null
                ? color.withOpacity(0.4)
                : theme.colorScheme.outline.withOpacity(0.3),
            width: selectedId != null ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    selectedId != null
                        ? selectedLanguage.language ?? 'Unknown'
                        : 'Not selected',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: selectedId != null
                          ? color
                          : theme.colorScheme.onSurface.withOpacity(0.4),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              selectedId != null ? Icons.check_circle_rounded : Icons.arrow_drop_down_rounded,
              color: selectedId != null ? color : theme.colorScheme.onSurface.withOpacity(0.6),
              size: 20,
            ),
          ],
        ),
      ),
    );
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
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: theme.colorScheme.outline.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.title_rounded,
                            color: theme.colorScheme.primary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: 'Video Name (Optional)',
                              hintStyle: TextStyle(
                                color: theme.colorScheme.onSurface.withOpacity(0.5),
                              ),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _buildLanguageButton(
                          label: 'Video Language',
                          selectedId: _videoLanguageId,
                          onChanged: (value) => setState(() => _videoLanguageId = value),
                          icon: Icons.videocam_rounded,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildLanguageButton(
                          label: 'Learning Language',
                          selectedId: _userLanguageId,
                          onChanged: (value) => setState(() => _userLanguageId = value),
                          icon: Icons.school_rounded,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: (_videoFile != null &&
                          _srtFile != null &&
                          _videoLanguageId != null &&
                          _userLanguageId != null)
                          ? _createVideo
                          : null,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: theme.colorScheme.primary,
                        disabledBackgroundColor: theme.colorScheme.surfaceVariant,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.rocket_launch_rounded,
                            color: (_videoFile != null &&
                                _srtFile != null &&
                                _videoLanguageId != null &&
                                _userLanguageId != null)
                                ? Colors.white
                                : theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Create Video Lesson',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: (_videoFile != null &&
                                  _srtFile != null &&
                                  _videoLanguageId != null &&
                                  _userLanguageId != null)
                                  ? Colors.white
                                  : theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
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
    _newLanguageController.dispose();
    super.dispose();
  }
}