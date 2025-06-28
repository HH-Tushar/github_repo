import 'package:flutter/material.dart';
import 'package:github_repo/application/home/repositories/repo.dart';
import 'package:hive_flutter/adapters.dart';

import '../../application/home/entities/github_repo_model.dart';
import '../../env.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    init();
  }
  bool isLoading = false;
  GithubRepoList? githubRepoList;
  final GitRepoImplement gitRepoImplement = GitRepoImplement();
  final box = Hive.box<GithubRepoList>(localStorageName);
  Future<void> init() async {
    isLoading = true;
    notify();
    await getSavedData();
  }

  notify() {
    if (hasListeners) notifyListeners();
  }

  Future<void> refresh() async {
    isLoading = true;
    notify();
    await getNetworkData();
  }

  Future<void> getNetworkData() async {
    final (data, error) = await gitRepoImplement.getRepository();
    if (data != null) {
      githubRepoList = data;
      await setData(data);
    }
    isLoading = false;
    notify();
  }

  Future<void> setData(GithubRepoList data) async {
    await box.put("data", data);
  }

  Future<void> getSavedData() async {
    final data = box.get("data");
    if (data == null) {
      await getNetworkData();
    } else {
      githubRepoList = data;
    }
    isLoading = false;
    notify();
  }

  void sort(String? val) {
    if (val == "star") {
      githubRepoList?.items.sort(
        (a, b) => b.stargazersCount.compareTo(a.stargazersCount),
      );
    } else if (val == "update") {
      githubRepoList?.items.sort(
        (a, b) => b.updatedAt.compareTo(a.updatedAt),
      );
    }
    notify();
  }
}
