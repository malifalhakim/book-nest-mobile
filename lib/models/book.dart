import 'dart:convert';

List<Book> bookFromJson(String str) =>
    List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String bookToJson(List<Book> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
  Model model;
  int pk;
  Fields fields;

  Book({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int price;
  int amount;
  String author;
  String description;

  Fields({
    required this.user,
    required this.name,
    required this.price,
    required this.amount,
    required this.author,
    required this.description,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        amount: json["amount"],
        author: json["author"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "amount": amount,
        "author": author,
        "description": description,
      };
}

// ignore: constant_identifier_names
enum Model { MAIN_ITEM }

final modelValues = EnumValues({"main.item": Model.MAIN_ITEM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
