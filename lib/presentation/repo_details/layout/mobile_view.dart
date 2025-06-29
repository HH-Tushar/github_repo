part of '../details_view.dart';

class _MobileLayout extends StatelessWidget {
  const _MobileLayout(this.data);
  final Item data;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:  8.0,bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                CachedNetworkImage(
                  height: 100,
                
                  imageUrl: data.owner.avatarUrl,
                  placeholder:
                      (context, url) =>
                          Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
            
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
            
                  children: [
                    Text(
                      "Repo Title : ${data.name}",
                      style: textTheme.titleMedium,
                    ),
                    Text("Owner : ${data.owner.login}"),
                    Text(
                      "Total Star Count : ${data.stargazersCount > 1000 ? "${(data.stargazersCount / 1000).toStringAsFixed(2)}k" : data.stargazersCount}",
                    ),
                  ],
                ),
              ],
            ),
          ),

          titleValue(title: "Full Name", value: data.fullName),
          titleValue(title: "Description", value: data.description ?? "N/A"),
          titleValue(title: "Update At", value: dateFormatter(data.updatedAt)),
          titleValue(title: "Forks Count", value: data.forksCount.toString()),

          if (data.topics.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Topics Covered:",
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ...List.generate(
                  data.topics.length,
                  (index) => Text("● ${data.topics[index]}"),
                ),
              ],
            ),

          titleValue(title: "Clone Url", value: data.cloneUrl),
          titleValue(title: "Default Branch", value: data.defaultBranch),
          titleValue(title: "Git Url", value: data.gitUrl),
          titleValue(title: "SSH Url", value: data.sshUrl),
          titleValue(title: "Url", value: data.url),

          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
