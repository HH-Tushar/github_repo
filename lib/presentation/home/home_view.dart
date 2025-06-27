import 'package:flutter/material.dart';
import 'package:github_repo/env.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = context.watch();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(appName)),
      body:
          homeController.isLoading
              ? CircularProgressIndicator()
              : (homeController.githubRepoList == null &&
                  homeController.isLoading == false)
              ? Center(child: Text("No Data found"))
              : ListView.builder(
                itemCount: homeController.githubRepoList?.items.length ?? 0,
                itemBuilder: (context, index) {
                  final item = homeController.githubRepoList!.items[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    clipBehavior: Clip.antiAlias,

                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric( horizontal: 8.0,vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name),
                            Text(item.owner.login),
                            Text(item.stargazersCount.toString()),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
