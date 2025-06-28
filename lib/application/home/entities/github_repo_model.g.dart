// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GithubRepoListAdapter extends TypeAdapter<GithubRepoList> {
  @override
  final int typeId = 2;

  @override
  GithubRepoList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GithubRepoList(
      items: (fields[0] as List).cast<Item>(),
    );
  }

  @override
  void write(BinaryWriter writer, GithubRepoList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GithubRepoListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 1;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      id: fields[0] as int,
      name: fields[1] as String,
      fullName: fields[2] as String,
      owner: fields[3] as Owner,
      url: fields[4] as String,
      description: fields[5] as String?,
      createdAt: fields[8] as DateTime,
      updatedAt: fields[9] as DateTime,
      gitUrl: fields[10] as String,
      sshUrl: fields[11] as String,
      cloneUrl: fields[12] as String,
      stargazersCount: fields[13] as int,
      forksCount: fields[14] as int,
      openIssuesCount: fields[15] as int,
      topics: (fields[6] as List).cast<String>(),
      defaultBranch: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.owner)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.topics)
      ..writeByte(7)
      ..write(obj.defaultBranch)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.gitUrl)
      ..writeByte(11)
      ..write(obj.sshUrl)
      ..writeByte(12)
      ..write(obj.cloneUrl)
      ..writeByte(13)
      ..write(obj.stargazersCount)
      ..writeByte(14)
      ..write(obj.forksCount)
      ..writeByte(15)
      ..write(obj.openIssuesCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OwnerAdapter extends TypeAdapter<Owner> {
  @override
  final int typeId = 0;

  @override
  Owner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Owner(
      login: fields[0] as String,
      id: fields[1] as int,
      nodeId: fields[2] as String,
      avatarUrl: fields[4] as String,
      url: fields[3] as String,
      htmlUrl: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Owner obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.login)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.nodeId)
      ..writeByte(4)
      ..write(obj.avatarUrl)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.htmlUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
