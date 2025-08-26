import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/comment_repo.dart';
import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository repository;

  CommentBloc(this.repository) : super(CommentInitial()) {
    on<FetchComments>(_onFetchComments);
    on<StoreComment>(_onStoreComment);
    on<LikeComment>(_onLikeComment);
    on<DislikeComment>(_onDislikeComment);
  }

  void _onFetchComments(FetchComments event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try {
      final comments = await repository.fetchAllComments(event.ruinId);
      emit(CommentLoaded(comments));
    } catch (e) {
      log(e.toString());
      emit(CommentError(e.toString()));
    }
  }

  void _onStoreComment(StoreComment event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try {
      await repository.storeComment(
        ruinId: event.ruinId,
        description: event.description,
        image: event.image,
      );
      emit(CommentStored());
      add(FetchComments(event.ruinId)); 
    } catch (e) {

      emit(CommentError(e.toString()));
    }
  }
void _onLikeComment(LikeComment event, Emitter<CommentState> emit) async {
  try {
    final response = await repository.likeComment(event.commentId);
    
    if (state is CommentLoaded) {
      final currentState = state as CommentLoaded;
      final updatedComments = currentState.comments.data.map((comment) {
        if (comment.id == event.commentId) {
          // تحديث بيانات التعليق بناءً على الاستجابة
          return comment.copyWith(
            isLike: response['data']['is_like'],
            totalLikes: response['data']['total_likes'] ?? comment.totalLikes,
            totalDislikes: response['data']['total_dislikes'] ?? comment.totalDislikes,
          );
        }
        return comment;
      }).toList();

      emit(CommentLoaded(
        currentState.comments.copyWith(data: updatedComments),
      ));
    }
  } catch (e) {
    emit(CommentError(e.toString()));
  }
}


 void _onDislikeComment(DislikeComment event, Emitter<CommentState> emit) async {
  try {
    final response = await repository.dislikeComment(event.commentId);
    
    if (state is CommentLoaded) {
      final currentState = state as CommentLoaded;
      final updatedComments = currentState.comments.data.map((comment) {
        if (comment.id == event.commentId) {
          // تحديث بيانات التعليق بناءً على الاستجابة
          return comment.copyWith(
            isLike: response['data']['is_like'],
            totalLikes: response['data']['total_likes'] ?? comment.totalLikes,
            totalDislikes: response['data']['total_dislikes'] ?? comment.totalDislikes,
          );
        }
        return comment;
      }).toList();

      emit(CommentLoaded(
        currentState.comments.copyWith(data: updatedComments),
      ));
    }
  } catch (e) {
    emit(CommentError(e.toString()));
  }
}
  }
