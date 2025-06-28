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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(appName),
        backgroundColor: Colors.green,
      ),
      body: ResponsiveLayout(
        mobileLayout: const _MobileLayout(),
        tabLayout: const _TabLayout(),
      ),
    );
  }
}
