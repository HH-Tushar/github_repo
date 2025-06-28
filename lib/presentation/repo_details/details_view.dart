import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_repo/core/responsive.dart';

import '../../application/home/entities/github_repo_model.dart';
import '../../core/constant.dart';
part 'layout/mobile_view.dart';
part 'layout/tab_view.dart';

class RepoDetailsView extends StatelessWidget {
  const RepoDetailsView({super.key, required this.data});
  final Item data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Repo Details"), centerTitle: true),
      body: ResponsiveLayout(
        mobileLayout: _MobileLayout(data),
        tabLayout: _TabLayout(data),
      ),
    );
  }
}

Widget titleValue({required String title, required String value}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 5,
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      Text(":"),
      Expanded(child: Text(value)),
    ],
  );
}
