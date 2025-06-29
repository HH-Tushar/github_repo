import 'package:flutter/material.dart';
import 'package:github_repo/application/home/repositories/repo.dart';
import 'package:hive_flutter/adapters.dart';
import '../../application/home/entities/github_repo_model.dart';
import '../../core/api_handler.dart';
import '../../env.dart';

class HomeController extends ChangeNotifier {
  HomeController(this.context) {
    init();
  }
  bool isLoading = false;
  bool netWorkIssue = false;
  String? notificationMessage;
  String? errorMessage;
  final BuildContext context;
  GithubRepoList? githubRepoList;
  final GitRepoImplement gitRepoImplement = GitRepoImplement();
  final box = Hive.box<GithubRepoList>(localStorageName);
  Future<void> init() async {
    isLoading = true;
    errorMessage = null;
    notify();
    await getSavedData();
  }

  notify() {
    if (hasListeners) notifyListeners();
  }

  Future<void> refresh() async {
    isLoading = true;
    errorMessage = null;
    notify();
    await getNetworkData();
  }

  Future<void> getNetworkData() async {
    final (data, error) = await gitRepoImplement.getRepository();
    if (data != null) {
      githubRepoList = data;
      notificationMessage = "Data fetched from Network";
      await setData(data);
    } else {
      if (error is NetworkFailure) {
        netWorkIssue = true;
        notificationMessage =
            "Network Failure.Check your network connection. \n${githubRepoList != null ? "Showing data from state." : ""}";
        errorMessage = "Network Failure.\nCheck your network connection.";
      } else {
        notificationMessage = error!.title;
        errorMessage = error.title;
      }
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
      notificationMessage = "Data fetched from Local Database.";
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
      githubRepoList?.items.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    }
    notify();
  }

  void clearNotification() {
    notificationMessage = null;
    notify();
  }

  Future<void> clearLocalDatabase() async {
    await box.clear();
    notificationMessage = "Local Database cleared";
    notify();
  }
}
