class NewsBanner {
  String? content;
  String? id;
  String? pictureId;
  String? title;
  String? titleContent;

  NewsBanner({
    this.content,
    this.id,
    this.pictureId,
    this.title,
    this.titleContent,
  });

  factory NewsBanner.fromJson(Map<String, dynamic> json) => NewsBanner(
        content: json['content'] as String?,
        id: json['id'] as String?,
        pictureId: json['pictureId'] as String?,
        title: json['title'] as String?,
        titleContent: json['titleContent'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'content': content,
        'id': id,
        'pictureId': pictureId,
        'title': title,
        'titleContent': titleContent,
      };
}
