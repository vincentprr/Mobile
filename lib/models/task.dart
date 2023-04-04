import 'dart:html';

import 'package:flutter/material.dart';

class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;

  static int nb = 1;

  Task(
      {required this.id,
      required this.title,
      required this.tags,
      required this.nbhours,
      required this.difficulty,
      required this.description});

  factory Task.newTask() {
    nb++;
    return Task(
        id: nb,
        title: 'Titre $nb',
        tags: ['tag $nb', 'tag ${nb + 1}'],
        nbhours: nb,
        difficulty: nb,
        description: 'Tache numero $nb');
  }

  factory Task.addNewTask(String titre, String nbhours, String difficulty) {
    nb++;
    int nbheure = int.parse(nbhours);
    int diff = int.parse(difficulty);
    return Task(
        id: nb,
        title: titre,
        tags: ['tag $nb', 'tag ${nb + 1}'],
        nbhours: nbheure,
        difficulty: diff,
        description: 'Tache numero $nb');
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    final tags = <String>[];

    if (json['tags'] != null) {
      json['tags'].forEach((t) {
        tags.add(t);
      });
    }

    return Task(
        id: json['id'],
        title: json['title'],
        tags: tags,
        nbhours: json['nbhours'],
        difficulty: json['difficulty'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    final tags = <String>[];
    this.tags.forEach((element) {
      tags.add(element);
    });

    data['id'] = this.id;
    data['title'] = this.title;
    data['tags'] = tags;
    data['nbhours'] = this.nbhours;
    data['difficulty'] = this.difficulty;
    data['description'] = this.description;
    return data;
  }

  static List<Task> generateTask(int i) {
    nb = 49;
    return List.generate(
      50,
      (index) => Task(
          id: index,
          title: 'title $index',
          tags: ['tag $index', 'tag ${index + 1}'],
          nbhours: index,
          difficulty: index,
          description: 'description task $index'),
    );
  }

  factory Task.editTask(int id, String text, String text2, int parse,
    int parse2, String text3) {
    return Task(
        id: id,
        title: text,
        tags: [text2],
        nbhours: parse,
        difficulty: parse2,
        description: text3);
  }

  factory Task.newTaskEdit(
      String text, String text2, int parse, int parse2, String text3) {
    nb++;
    return Task(
        id: nb,
        title: text,
        tags: [text2],
        nbhours: parse,
        difficulty: parse2,
        description: text3);
  }
}
