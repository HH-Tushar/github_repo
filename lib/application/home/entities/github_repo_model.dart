import 'dart:convert';

class GithubRepoList {
    final int totalCount;
    final bool incompleteResults;
    final List<Item> items;

    GithubRepoList({
        required this.totalCount,
        required this.incompleteResults,
        required this.items,
    });

    factory GithubRepoList.fromRawJson(String str) => GithubRepoList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GithubRepoList.fromJson(Map<String, dynamic> json) => GithubRepoList(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    final int id;

    final String name;
    final String fullName;
    final Owner owner;
    final String htmlUrl;
    final String description;
    final bool fork;
    final String url;
    final String collaboratorsUrl;
    final String teamsUrl;
    final String assigneesUrl;
    final String branchesUrl;
    final String treesUrl;
    final String contributorsUrl;
    final String commitsUrl;
    final String gitCommitsUrl;
    final String commentsUrl;
    final String issueCommentUrl;
    final String archiveUrl;
    final String downloadsUrl;
    final String issuesUrl;
    final String pullsUrl;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String gitUrl;
    final String sshUrl;
    final String cloneUrl;
    final String svnUrl;
    final String homepage;
    final int size;
    final int stargazersCount;
    final String language;
    final bool hasIssues;
    final bool hasProjects;
    final bool hasDownloads;
    final int forksCount;
    final bool archived;
    final int openIssuesCount;
    final License license;
    final bool allowForking;
    final bool isTemplate;
    final List<String> topics;
    final String visibility;
    final int forks;
    final String defaultBranch;
    final int score;

    Item({
        required this.id,
        required this.name,
        required this.fullName,
        required this.owner,
        required this.htmlUrl,
        required this.description,
        required this.fork,
        required this.url,
        required this.collaboratorsUrl,
        required this.teamsUrl,
        required this.assigneesUrl,
        required this.branchesUrl,
        required this.treesUrl,
        required this.contributorsUrl,
        required this.commitsUrl,
        required this.gitCommitsUrl,
        required this.commentsUrl,
        required this.issueCommentUrl,
        required this.archiveUrl,
        required this.downloadsUrl,
        required this.issuesUrl,
        required this.pullsUrl,
        required this.createdAt,
        required this.updatedAt,
        required this.gitUrl,
        required this.sshUrl,
        required this.cloneUrl,
        required this.svnUrl,
        required this.homepage,
        required this.size,
        required this.stargazersCount,
        required this.language,
        required this.hasIssues,
        required this.hasProjects,
        required this.hasDownloads,
        required this.forksCount,
        required this.archived,
        required this.openIssuesCount,
        required this.license,
        required this.allowForking,
        required this.isTemplate,
        required this.topics,
        required this.visibility,
        required this.forks,
        required this.defaultBranch,
        required this.score,
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
        fork: json["fork"],
        url: json["url"],
        collaboratorsUrl: json["collaborators_url"],
        teamsUrl: json["teams_url"],
        assigneesUrl: json["assignees_url"],
        branchesUrl: json["branches_url"],
        treesUrl: json["trees_url"],
        contributorsUrl: json["contributors_url"],
        commitsUrl: json["commits_url"],
        gitCommitsUrl: json["git_commits_url"],
        commentsUrl: json["comments_url"],
        issueCommentUrl: json["issue_comment_url"],
        archiveUrl: json["archive_url"],
        downloadsUrl: json["downloads_url"],
        issuesUrl: json["issues_url"],
        pullsUrl: json["pulls_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        gitUrl: json["git_url"],
        sshUrl: json["ssh_url"],
        cloneUrl: json["clone_url"],
        svnUrl: json["svn_url"],
        homepage: json["homepage"],
        size: json["size"],
        stargazersCount: json["stargazers_count"],

        language: json["language"],
        hasIssues: json["has_issues"],
        hasProjects: json["has_projects"],
        hasDownloads: json["has_downloads"],
        forksCount: json["forks_count"],
     archived: json["archived"],

        openIssuesCount: json["open_issues_count"],
        license: License.fromJson(json["license"]),
        allowForking: json["allow_forking"],
        isTemplate: json["is_template"],

        topics: List<String>.from(json["topics"].map((x) => x)),
        visibility: json["visibility"],
        forks: json["forks"],
        defaultBranch: json["default_branch"],
        score: json["score"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "owner": owner.toJson(),
        "html_url": htmlUrl,
        "description": description,
        "fork": fork,
        "url": url,
        "collaborators_url": collaboratorsUrl,
        "teams_url": teamsUrl,
        "assignees_url": assigneesUrl,
        "branches_url": branchesUrl,
        "trees_url": treesUrl,
        "contributors_url": contributorsUrl,
        "commits_url": commitsUrl,
        "git_commits_url": gitCommitsUrl,
        "comments_url": commentsUrl,
        "issue_comment_url": issueCommentUrl,
        "archive_url": archiveUrl,
        "downloads_url": downloadsUrl,
        "issues_url": issuesUrl,
        "pulls_url": pullsUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "git_url": gitUrl,
        "ssh_url": sshUrl,
        "clone_url": cloneUrl,
        "svn_url": svnUrl,
        "homepage": homepage,
        "size": size,
        "stargazers_count": stargazersCount,
        "language": language,
        "has_issues": hasIssues,
        "has_projects": hasProjects,
        "has_downloads": hasDownloads,
        "forks_count": forksCount,
        "archived": archived,
        "open_issues_count": openIssuesCount,
        "license": license.toJson(),
        "allow_forking": allowForking,
        "is_template": isTemplate,
        "topics": List<dynamic>.from(topics.map((x) => x)),
        "visibility": visibility,
        "forks": forks,
        "default_branch": defaultBranch,
        "score": score,
    };
}

class License {
    final String key;
    final String name;
    final String spdxId;
    final String url;
    final String nodeId;

    License({
        required this.key,
        required this.name,
        required this.spdxId,
        required this.url,
        required this.nodeId,
    });

    factory License.fromRawJson(String str) => License.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory License.fromJson(Map<String, dynamic> json) => License(
        key: json["key"],
        name: json["name"],
        spdxId: json["spdx_id"],
        url: json["url"],
        nodeId: json["node_id"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "spdx_id": spdxId,
        "url": url,
        "node_id": nodeId,
    };
}

class Owner {
    final String login;
    final int id;
    final String nodeId;
    final String avatarUrl;
    final String url;
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
