class Reviews {
  String? context;
  int? createTime;
  int? id;
  bool? isLike;
  int? likes;
  int? newsId;
  int? parentReviewId;
  int? targetId;
  int? teamId;
  String? teamName;
  int? updateTime;

  Reviews({
    this.context,
    this.createTime,
    this.id,
    this.isLike,
    this.likes,
    this.newsId,
    this.parentReviewId,
    this.targetId,
    this.teamId,
    this.teamName,
    this.updateTime,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        context: json['context'] as String?,
        createTime: json['createTime'] as int?,
        id: json['id'] as int?,
        isLike: json['isLike'] as bool?,
        likes: json['likes'] as int?,
        newsId: json['newsId'] as int?,
        parentReviewId: json['parentReviewId'] as int?,
        targetId: json['targetId'] as int?,
        teamId: json['teamId'] as int?,
        teamName: json['teamName'] as String?,
        updateTime: json['updateTime'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'context': context,
        'createTime': createTime,
        'id': id,
        'isLike': isLike,
        'likes': likes,
        'newsId': newsId,
        'parentReviewId': parentReviewId,
        'targetId': targetId,
        'teamId': teamId,
        'teamName': teamName,
        'updateTime': updateTime,
      };
}
