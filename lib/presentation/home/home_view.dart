import 'package:flutter/material.dart';
import 'package:github_repo/core/responsive.dart';
import 'package:github_repo/env.dart';
import 'package:provider/provider.dart';

import '../../core/constant.dart';
import '../repo_details/details_view.dart';
import 'home_controller.dart';
part 'layout/mobile_view.dart';
part 'layout/tab_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
        final HomeController homeController = context.watch();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 0,
        // titleSpacing: 0,
        title: Text(appName),
        backgroundColor: Colors.green,
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [
          const Text("Sort By"),
          const SizedBox(width: 8, height: 0),
          SizedBox(
            width: 120,
            child: DropdownButtonFormField<String>(

              style: TextStyle(fontSize: 12,height: 0),
              borderRadius: BorderRadius.circular(6),
                      decoration: InputDecoration(
            border: OutlineInputBorder()
                      ),
              value: "star",
              items: [
                DropdownMenuItem(value: "star", child: Text("Star Count")),
                DropdownMenuItem(value: "update", child: Text("Updated At")),
              ],
              onChanged: (v) {
              
                homeController.sort(v);
              },
            ),
          ),
        ],
      ),
      body: ResponsiveLayout(
        mobileLayout: const _MobileLayout(),
        tabLayout: const _TabLayout(),
      ),
    );
  }
}
