import 'package:flutter/material.dart';
import 'package:github_repo/core/responsive.dart';
import 'package:github_repo/env.dart';
import 'package:provider/provider.dart';

import '../../core/constant.dart';
import '../../core/theme/theme_handler.dart';
import '../repo_details/details_view.dart';
import 'home_controller.dart';
part 'layout/mobile_view.dart';
part 'layout/tab_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = context.watch();
    final ThemeProvider themeProvider = context.watch();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (homeController.notificationMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(homeController.notificationMessage ?? "")),
        );
      }
      homeController.clearNotification();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [
          const Text("Sort By"),
          const SizedBox(width: 8, height: 0),
          SizedBox(
            width: 95,
            child: DropdownButtonFormField<String>(
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onPrimary,
              ),
              borderRadius: BorderRadius.circular(6),
              padding: EdgeInsets.all(0),
              iconEnabledColor: colorScheme.onPrimary,
              dropdownColor: colorScheme.primary,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.onPrimary),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.onSurface),
                ),
              ),
              value: "star",
              items: [
                DropdownMenuItem(value: "star", child: Text("Star")),
                DropdownMenuItem(value: "update", child: Text("Update")),
              ],
              onChanged: (v) {
                homeController.sort(v);
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:  8.0),
                child: Text(appName,style: textTheme.titleLarge,),
              ),
              Divider(endIndent: 10,indent: 10,),
              ListTile(
                tileColor: colorScheme.secondaryContainer,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                title: Text("Toggle Theme"),
                trailing: Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) => themeProvider.toggleTheme(value),
                ),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              tileColor: colorScheme.secondaryContainer,
                title: Text("Clear Local Database"),
                trailing: Icon(Icons.delete_forever),
                onTap: () => homeController.clearLocalDatabase(),
              ),
            ],
          ),
        ),
      ),
      body: ResponsiveLayout(
        mobileLayout: const _MobileLayout(),
        tabLayout: const _TabLayout(),
      ),
    );
  }
}
