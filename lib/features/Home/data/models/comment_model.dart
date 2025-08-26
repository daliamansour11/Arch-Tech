class _CopyWithSentinel {
  const _CopyWithSentinel();
}

const _undefined = _CopyWithSentinel();

class CommentModel {
  final bool success;
  final List<CommentData> data;
  final String message;

  CommentModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      success: json['success'],
      data: List<CommentData>.from(
          json['data'].map((x) => CommentData.fromJson(x))),
      message: json['message'],
    );
  }

  CommentModel copyWith({
    bool? success,
    List<CommentData>? data,
    String? message,
  }) {
    return CommentModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}

class CommentData {
  final int id;
  final String? description;
  final int ruinId;
  final int userId;
  final int totalLikes;
  final int totalDislikes;
  final List<CommentImage> images;
  final CommentUser user;
  final bool? isLike;

  CommentData({
    required this.id,
    required this.description,
    required this.ruinId,
    required this.userId,
    required this.totalLikes,
    required this.totalDislikes,
    required this.images,
    required this.user,
    this.isLike,
  });

  factory CommentData.fromJson(Map<String, dynamic> json) {
    return CommentData(
      id: json['id'],
      description: json['description'],
      ruinId: json['ruin_id'],
      userId: json['user_id'],
      totalLikes: json['total_likes'],
      totalDislikes: json['total_dislikes'],
      images: List<CommentImage>.from(
        json['images'].map((x) => CommentImage.fromJson(x)),
      ),
      user: CommentUser.fromJson(json['user']),
      isLike: json['is_like'],
    );
  }

  CommentData copyWith({
    int? id,
    String? description,
    int? ruinId,
    int? userId,
    int? totalLikes,
    int? totalDislikes,
    List<CommentImage>? images,
    CommentUser? user,
    Object? isLike = _undefined,
  }) {
    return CommentData(
      id: id ?? this.id,
      description: description ?? this.description,
      ruinId: ruinId ?? this.ruinId,
      userId: userId ?? this.userId,
      totalLikes: totalLikes ?? this.totalLikes,
      totalDislikes: totalDislikes ?? this.totalDislikes,
      images: images ?? this.images,
      user: user ?? this.user,
      isLike: isLike == _undefined ? this.isLike : isLike as bool?,
    );
  }
}

class CommentImage {
  final int id;
  final String name;
  final int commentId;

  CommentImage({
    required this.id,
    required this.name,
    required this.commentId,
  });

  factory CommentImage.fromJson(Map<String, dynamic> json) {
    return CommentImage(
      id: json['id'],
      name: json['name'],
      commentId: json['comment_id'],
    );
  }

  CommentImage copyWith({
    int? id,
    String? name,
    int? commentId,
  }) {
    return CommentImage(
      id: id ?? this.id,
      name: name ?? this.name,
      commentId: commentId ?? this.commentId,
    );
  }
}

class CommentUser {
  final int id;
  final String name;
  final String email;
  final String role;
  final String? image;

  CommentUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.image,
  });

  factory CommentUser.fromJson(Map<String, dynamic> json) {
    return CommentUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      image: json['image'],
    );
  }

  CommentUser copyWith({
    int? id,
    String? name,
    String? email,
    String? role,
    Object? image = _undefined,
  }) {
    return CommentUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      image: image == _undefined ? this.image : image as String?,
    );
  }
}
