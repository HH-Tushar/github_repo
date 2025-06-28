part of '../home_view.dart';

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = context.watch();
    final textTheme = Theme.of(context).textTheme;
    return homeController.isLoading
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
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => RepoDetailsView(data: item),
                        ),
                      ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title : ${item.name}",
                          style: textTheme.titleMedium,
                        ),
                        Text("Owner : ${item.owner.login}"),
                        Text(
                          "Total Star Count : ${item.stargazersCount > 1000 ? "${(item.stargazersCount / 1000).toStringAsFixed(2)}k" : item.stargazersCount}",
                        ),
                        Text("Updated At : ${dateFormatter(item.updatedAt)}"),
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
