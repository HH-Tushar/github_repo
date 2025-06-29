import 'package:flutter/material.dart';
import 'package:github_repo/presentation/home/home_controller.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'application/home/entities/github_repo_model.dart';
import 'core/theme/theme_colors.dart';
import 'core/theme/theme_handler.dart';
import 'env.dart';
import 'presentation/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GithubRepoListAdapter());
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(OwnerAdapter());
  await Hive.openBox<GithubRepoList>(localStorageName);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController(context)),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = context.watch();
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: themeProvider.themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomeView(),
    );
  }
}
