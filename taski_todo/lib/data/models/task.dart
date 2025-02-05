import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }
}
