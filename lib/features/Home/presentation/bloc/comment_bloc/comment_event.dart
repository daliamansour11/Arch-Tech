import 'dart:io';

abstract class CommentEvent {}

class FetchComments extends CommentEvent {
  final int ruinId;

  FetchComments(this.ruinId);
}

class StoreComment extends CommentEvent {
  final int ruinId;
  final String description;
  final File? image; 

  StoreComment({
    required this.ruinId,
    required this.description,
    this.image,
  });
}

class LikeComment extends CommentEvent {
  final int commentId;

  LikeComment({
    required this.commentId,
  });
}

class DislikeComment extends CommentEvent {
  final int commentId;

  DislikeComment({
    required this.commentId,
  });
}