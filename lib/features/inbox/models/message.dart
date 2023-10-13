class MessageModel {
  final String text;
  final String userId;
  final int createdAt;
  final String? messageId;

  MessageModel({
    required this.text,
    required this.userId,
    required this.createdAt,
    this.messageId,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        createdAt = json['createdAt'],
        userId = json['userId'],
        messageId = json["messageId"];

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "userId": userId,
      "createdAt": createdAt,
    };
  }
}
