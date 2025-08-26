import '../../../data/models/comment_model.dart';

abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final CommentModel comments;

  CommentLoaded(this.comments);
}

class CommentError extends CommentState {
  final String message;

  CommentError(this.message);
}

class CommentStored extends CommentState {}

class CommentLiked extends CommentState {
  final int totalLikes;
  final int totalDislikes;

  CommentLiked({
    required this.totalLikes,
    required this.totalDislikes,
  });
}

class CommentDisliked extends CommentState {
  final int totalLikes;
  final int totalDislikes;

  CommentDisliked({
    required this.totalLikes,
    required this.totalDislikes,
  });
}