// To parse this JSON data, do
//
//     final messagesModel = messagesModelFromJson(jsonString);

import 'dart:convert';

MessagesModel messagesModelFromJson(String str) =>
    MessagesModel.fromJson(json.decode(str));

String messagesModelToJson(MessagesModel data) => json.encode(data.toJson());

class MessagesModel {
  List<Message>? messages;

  MessagesModel({
    this.messages,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
        messages: json["messages"] == null
            ? []
            : List<Message>.from(
                json["messages"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "messages": messages == null
            ? []
            : List<dynamic>.from(messages!.map((x) => x.toJson())),
      };
}

class Message {
  String? data;
  int? dataTime;
  String? uid;
  String? senderUid;
  String? receiverUid;

  Message(
      {this.data, this.dataTime, this.uid, this.senderUid, this.receiverUid});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
      data: json["data"],
      dataTime: json["dataTime"],
      uid: json["uid"],
      senderUid: json["senderUid"],
      receiverUid: json["receiverUid"]);

  Map<String, dynamic> toJson() => {
        "data": data,
        "dataTime": dataTime,
        "uid": uid,
        "senderUid": senderUid,
        "receiverUid": receiverUid
      };
}
