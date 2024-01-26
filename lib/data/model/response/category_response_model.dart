// To parse this JSON data, do
//
//     final messageCategoryModel = messageCategoryModelFromJson(jsonString);

import 'dart:convert';

MessageCategoryModel messageCategoryModelFromJson(String str) =>
    MessageCategoryModel.fromJson(json.decode(str));

String messageCategoryModelToJson(MessageCategoryModel data) =>
    json.encode(data.toJson());

class MessageCategoryModel {
  List<Categorye>? categoryes;

  MessageCategoryModel({
    this.categoryes,
  });

  factory MessageCategoryModel.fromJson(Map<String, dynamic> json) =>
      MessageCategoryModel(
        categoryes: json["categoryes"] == null
            ? []
            : List<Categorye>.from(
                json["categoryes"]!.map((x) => Categorye.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categoryes": categoryes == null
            ? []
            : List<dynamic>.from(categoryes!.map((x) => x.toJson())),
      };
}

class Categorye {
  String? uid;
  String? firstname;
  String? lastname;
  String? lastMessage;
  int? lastMessageDate;
  int? lastMessageByMe;

  Categorye({
    this.uid,
    this.firstname,
    this.lastname,
    this.lastMessage,
    this.lastMessageDate,
    this.lastMessageByMe,
  });

  factory Categorye.fromJson(Map<String, dynamic> json) => Categorye(
        uid: json["uid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        lastMessage: json["last_message"],
        lastMessageDate: json["last_message_date"],
        lastMessageByMe: json["last_message_by_me"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "firstname": firstname,
        "lastname": lastname,
        "last_message": lastMessage,
        "last_message_date": lastMessageDate,
        "last_message_by_me": lastMessageByMe,
      };
}
