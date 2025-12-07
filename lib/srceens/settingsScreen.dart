import 'package:eiga_learn/providers/geminyProvider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geminiApiKey = ref.watch(geminiApiKeyProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Gemini API Key"),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: geminiApiKey,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your Gemini API key",
              ),
              onFieldSubmitted: (value) async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('gemini_api_key', value);
                ref.read(geminiApiKeyProvider.notifier).state = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}