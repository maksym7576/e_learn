import 'package:flutter/material.dart';

class SelectedFilesWidget extends StatelessWidget {
  final String? videoFile;
  final String? srtFile;
  final VoidCallback onClearVideo;
  final VoidCallback onClearSrt;

  const SelectedFilesWidget({
    super.key,
    required this.videoFile,
    required this.srtFile,
    required this.onClearVideo,
    required this.onClearSrt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (videoFile != null)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.video_file, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    videoFile!.split('/').last,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: onClearVideo,
                  icon: const Icon(Icons.close, size: 20),
                ),
              ],
            ),
          ),
        if (videoFile != null && srtFile != null) const SizedBox(height: 8),
        if (srtFile != null)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.subtitles, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    srtFile!.split('/').last,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: onClearSrt,
                  icon: const Icon(Icons.close, size: 20),
                ),
              ],
            ),
          ),
      ],
    );
  }
}