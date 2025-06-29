import 'dart:convert';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/api_handler.dart';
import '../../../env.dart';
import '../entities/github_repo_model.dart';
import 'package:http/http.dart' as http;

class GitRepoImplement {
  Future<Attempt<GithubRepoList>> getRepository() async {
    try {
      final url = '$baseUrl/search/repositories';
      final Map<String, dynamic> params = {
        "q": "Flutter",
        "sort": "stars",
        "order": "desc",
        "per_page": '50',
      };
      final response = await http.get(
        Uri.parse(url).replace(queryParameters: params),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        final data = GithubRepoList.fromJson(json.decode(response.body));
        return success(data);
      }
      //we can handle multiple failure here
      return failed(Failure(title: "Something Went Wrong", description: ""));
    } catch (e) {
      if (await InternetConnectionChecker.instance.hasConnection == false) {
        return failed(NetworkFailure());
      } else {
        return failed(
          Failure(title: "Something Went Wrong", description: e.toString()),
        );
      }
    }
  }
}
