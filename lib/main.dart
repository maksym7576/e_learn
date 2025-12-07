import 'package:eiga_learn/data/models/blockObject.dart';
import 'package:eiga_learn/data/models/languageObject.dart';
import 'package:eiga_learn/data/models/phraseObject.dart';
import 'package:eiga_learn/data/models/videoObject.dart';
import 'package:eiga_learn/data/models/wordObject.dart';
import 'package:eiga_learn/navigators/AppRouter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' show ProviderScope;
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'providers/isarProvider.dart';
late final Isar isar;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  isar = await Isar.open(
    [
      VideoObjectSchema,
      PhraseObjectSchema,
      BlockObjectSchema,
      WordObjectSchema,
      LanguageObjectSchema,
    ],
    directory: dir.path,
  );

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
    );
  }
}
