class Suggestion {
  String? activity;
  String? type;
  num? participants;
  num? price;
  String? link;
  String? key;
  num? accessibility;

  Suggestion({
    this.activity,
    this.type,
    this.participants,
    this.price,
    this.link,
    this.key,
    this.accessibility,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      activity: json["activity"],
      type: json["type"],
      participants: json["participants"],
      price: json["price"],
      link: json["link"],
      key: json["key"],
      accessibility: json["accessibility"],
    );
  }
}
