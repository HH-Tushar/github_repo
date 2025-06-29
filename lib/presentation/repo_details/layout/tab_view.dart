part of '../details_view.dart';

class _TabLayout extends StatelessWidget {
  const _TabLayout(this.data);
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
            padding: const EdgeInsets.only(top:  16.0,bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    height: 150,
            
                    imageUrl: data.owner.avatarUrl,
                    placeholder:
                        (context, url) =>
                            Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
            
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
            
                    children: [
                      Text(
                        "Repo Title : ${data.name}",
                        style: textTheme.titleMedium,
                      ),
                  
                    
                      titleValue(
                        title: "Owner",
                        value: data.owner.login,
                      ),
                      titleValue(
                        title: "Star Count",
                        value: "${data.stargazersCount > 1000 ? "${(data.stargazersCount / 1000).toStringAsFixed(2)}k" : data.stargazersCount}",
                      ),
                      titleValue(
                        title: "Forks Count",
                        value: "${data.forksCount > 1000 ? "${(data.forksCount / 1000).toStringAsFixed(2)}k" : data.forksCount}",
                      ),
                      titleValue(
                        title: "Update At",
                        value: dateFormatter(data.updatedAt),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          titleValue(title: "Full Name", value: data.fullName),
          titleValue(title: "Description", value: data.description ?? "N/A"),

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
