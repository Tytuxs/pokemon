import 'package:flutter/material.dart';

@immutable
class InfoPokemon {
  final int id;
  final String name;
  final String posterpath;

  const InfoPokemon(
    {
      this.id = 0,
      this.name = "",
      this.posterpath = ""
    }
  );

  factory InfoPokemon.fromJson(Map<String, dynamic> json) {
    if(json['images'] != null) {
      return InfoPokemon(
        id: json['mal_id'],
        name: json['title'],
        posterpath: json['images'] != null
          && json['images']['jpg'] != null
          ? json['images']['jpg']['image_url']
          : null
      );
    }
    else {
      return InfoPokemon(
        id: json['entry']['mal_id'],
        name: json['entry']['title'],
        posterpath: json['entry']['images'] != null
          && json['entry']['images']['jpg'] != null
          ? json['entry']['images']['jpg']['image_url']
          : null
      );
    }
  }

  @override
  String toString() {
    return 'Book{bookId: $id, title: $name, posterpath: $posterpath}';
  }
}