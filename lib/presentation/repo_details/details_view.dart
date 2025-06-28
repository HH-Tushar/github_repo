import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../application/home/entities/github_repo_model.dart';
import '../../core/constant.dart';

class RepoDetailsView extends StatelessWidget {
  const RepoDetailsView({super.key, required this.data});
  final Item data;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Repo Details"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Row(
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

           
                titleValue(title:"Full Name" ,value: data.fullName),
                titleValue(title:"Description" ,value: data.description??"N/A"),
                titleValue(title:"Last Update At" ,value:dateFormatter(data.updatedAt)),
                

       
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

            titleValue(title:"Clone Url" ,value: data.cloneUrl),
            titleValue(title:"Default Branch" ,value: data.defaultBranch),
            titleValue(title:"gitUrl" ,value: data.gitUrl),
            titleValue(title:"sshUrl" ,value: data.sshUrl),
            titleValue(title:"Url" ,value: data.url),
            titleValue(title:"forksCount" ,value: data.forksCount.toString()),
           
          ],
        ),
      ),
    );
  }
}

Widget titleValue({required String title, required String value}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 5,
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      Text(":"),
      Expanded(child: Text(value)),
    ],
  );
}
