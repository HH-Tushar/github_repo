import 'package:flutter/material.dart';
import 'package:github_repo/env.dart';
import 'package:provider/provider.dart';

import '../../core/constant.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = context.watch();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(appName),
        backgroundColor: Colors.green,
      ),
      body:
          homeController.isLoading
              ? Center(child: CircularProgressIndicator())
              : (homeController.githubRepoList == null &&
                  homeController.isLoading == false)
              ? Center(child: Text("No Data found"))
              : RefreshIndicator(
                onRefresh: () => homeController.refresh(),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemCount: homeController.githubRepoList?.items.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = homeController.githubRepoList!.items[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.green.shade50,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name, style: textTheme.titleMedium),
                              Text("Owner : ${item.owner.login}"),
                              Text("${item.stargazersCount} ⭐"),
                              Text(
                                "Updated At : ${month[item.updatedAt.month - 1]}-${item.updatedAt.day}-${item.updatedAt.year}",
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
    );
  }
}
