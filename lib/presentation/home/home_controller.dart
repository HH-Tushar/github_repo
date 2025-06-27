import 'package:flutter/material.dart';
import 'package:github_repo/application/home/repositories/repo.dart';

import '../../application/home/entities/github_repo_model.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    init();
  }
  bool isLoading = false;
  GithubRepoList? githubRepoList;
  final GitRepoImplement gitRepoImplement = GitRepoImplement();
  Future<void> init() async {
    isLoading = true;
    notify();
    await getNetworkData();
  }

  notify() {
    if (hasListeners) notifyListeners();
  }

  Future<void> refresh() async {}
  Future<void> getNetworkData() async {
    final (data, error) = await gitRepoImplement.getRepository();
    if (data != null) {
      githubRepoList = data;
    }
    isLoading = false;
    notify();
  }

  Future<void> setData() async {}
  Future<void> getSavedData() async {}
}
