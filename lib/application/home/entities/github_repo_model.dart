import 'dart:convert';
import 'package:hive/hive.dart';

part 'github_repo_model.g.dart';

@HiveType(typeId: 2)
class GithubRepoList {
  @HiveField(0)
  final List<Item> items;

  GithubRepoList({required this.items});

  factory GithubRepoList.fromRawJson(String str) =>
      GithubRepoList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GithubRepoList.fromJson(Map<String, dynamic> json) => GithubRepoList(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

@HiveType(typeId: 1)
class Item {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final Owner owner;
  @HiveField(4)
  final String htmlUrl;
  @HiveField(5)
  final String? description;
  @HiveField(6)
  final String url;
  @HiveField(7)
  final String commitsUrl;
  @HiveField(8)
  final DateTime createdAt;
  @HiveField(9)
  final DateTime updatedAt;
  @HiveField(10)
  final String gitUrl;
  @HiveField(11)
  final String sshUrl;
  @HiveField(12)
  final String cloneUrl;
  @HiveField(13)
  final int stargazersCount;
  @HiveField(14)
  final int forksCount;
  @HiveField(15)
  final int openIssuesCount;
  @HiveField(16)
  final List<String> topics;
  @HiveField(17)
  final int forks;
  @HiveField(18)
  final String defaultBranch;

  Item({
    required this.id,
    required this.name,
    required this.fullName,
    required this.owner,
    required this.htmlUrl,
    this.description,
    required this.url,
    required this.commitsUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.gitUrl,
    required this.sshUrl,
    required this.cloneUrl,
    required this.stargazersCount,
    required this.forksCount,
    required this.openIssuesCount,
    required this.topics,
    required this.forks,
    required this.defaultBranch,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    fullName: json["full_name"],
    owner: Owner.fromJson(json["owner"]),
    htmlUrl: json["html_url"],
    description: json["description"],
    url: json["url"],
    commitsUrl: json["commits_url"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gitUrl: json["git_url"],
    sshUrl: json["ssh_url"],
    cloneUrl: json["clone_url"],
    stargazersCount: json["stargazers_count"],
    forksCount: json["forks_count"],
    openIssuesCount: json["open_issues_count"],
    topics: List<String>.from(json["topics"].map((x) => x)),
    forks: json["forks"],
    defaultBranch: json["default_branch"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "full_name": fullName,
    "owner": owner.toJson(),
    "html_url": htmlUrl,
    "description": description,
    "url": url,
    "commits_url": commitsUrl,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "git_url": gitUrl,
    "ssh_url": sshUrl,
    "clone_url": cloneUrl,
    "stargazers_count": stargazersCount,
    "forks_count": forksCount,
    "open_issues_count": openIssuesCount,
    "topics": List<dynamic>.from(topics.map((x) => x)),
    "forks": forks,
    "default_branch": defaultBranch,
  };
}

@HiveType(typeId: 0)
class Owner {
  @HiveField(0)
  final String login;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String nodeId;
  @HiveField(4)
  final String avatarUrl;
  @HiveField(3)
  final String url;
  @HiveField(5)
  final String htmlUrl;

  Owner({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.url,
    required this.htmlUrl,
  });

  factory Owner.fromRawJson(String str) => Owner.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    url: json["url"],
    htmlUrl: json["html_url"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
    "url": url,
    "html_url": htmlUrl,
  };
}
