import 'dart:convert';

SongResponse songResponseFromJson(String str) =>
    SongResponse.fromJson(json.decode(str));

String songResponseToJson(SongResponse data) => json.encode(data.toJson());

class SongResponse {
  SongResponse({
    required this.count,
    required this.entries,
  });

  int count;
  List<Entry> entries;

  factory SongResponse.fromJson(Map<String, dynamic> json) => SongResponse(
        count: json["count"],
        entries:
            List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
      };
}

class Entry {
  Entry({
    required this.api,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });

  String api;
  String description;
  String auth;
  bool https;
  String cors;
  String link;
  String category;

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        api: json["API"],
        description: json["Description"],
        auth: json["Auth"],
        https: json["HTTPS"],
        cors: json["Cors"],
        link: json["Link"],
        category: json["Category"],
      );

  Map<String, dynamic> toJson() => {
        "API": api,
        "Description": description,
        "Auth": auth,
        "HTTPS": https,
        "Cors": cors,
        "Link": link,
        "Category": category,
      };
}
