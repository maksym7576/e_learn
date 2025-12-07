import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


final geminiApiKeyProvider = StateProvider<String>((ref) => '');

// final geminiServiceProvider = Provider<GeminiService>((ref) {
//   final apiKey = ref.watch(geminiApiKeyProvider);
//   return GeminiService(apiKey: apiKey);
// });

// Future<void> initGeminiKey(T Function<T>(ProviderListenable<T>) read) async {
//   final prefs = await SharedPreferences.getInstance();
//   final savedKey = prefs.getString('gemini_api_key') ?? '';
//   read(geminiApiKeyProvider.notifier).state = savedKey;
// }
