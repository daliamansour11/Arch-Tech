// ignore_for_file: unused_element

import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/features/Home/data/models/comment_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/text_manager.dart';
import '../../../../core/utils/text_style_manager.dart';
import '../../data/repo/comment_repo.dart';
import '../bloc/comment_bloc/comment_bloc.dart';
import '../bloc/comment_bloc/comment_event.dart';
import '../bloc/comment_bloc/comment_state.dart';
import '../widgets/empty_widget.dart';
import '../widgets/post_card.dart';
import '../widgets/write_comment.dart';

class Comments extends StatefulWidget {
  static const routeName = 'comments/';
  final int ruinId;

  const Comments({super.key, required this.ruinId});

  @override
  CommentsState createState() => CommentsState();
}

class CommentsState extends State<Comments> {
  PlatformFile? _selectedImage;
  final TextEditingController _controller = TextEditingController();
  CommentRepository repo = CommentRepository();
  bool _isImageLoading = false;

  Future<void> _pickImage() async {
    setState(() {
      _isImageLoading = true;
    });

    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _selectedImage = result.files.first;
        _isImageLoading = false;
      });
    } else {
      setState(() {
        _isImageLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentBloc(repo)..add(FetchComments(widget.ruinId)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const TextManger(
            'write_a_comment',
            style: TextStyleManager.headlineLarge,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  if (state is CommentLoaded || state is CommentLoading) {
                    final CommentModel comments = state is CommentLoaded
                        ? state.comments
                        : CommentModel(
                            message: '',
                            data: [
                              CommentData(
                                  id: 5,
                                  description: 'description',
                                  ruinId: 5,
                                  userId: 5,
                                  totalLikes: 65,
                                  totalDislikes: 5,
                                  images: [],
                                  user: CommentUser(
                                      id: 0,
                                      name: 'name',
                                      email: 'email',
                                      role: 'role'))
                            ],
                            success: true);
                    return Skeletonizer(
                      enabled: state is CommentLoading,
                      enableSwitchAnimation: true,
                      child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: comments.data.map((comment) {
                          if (comment.description == null &&
                              comment.images.isEmpty) {
                            return Container();
                          }
                          return PostCard(
                            commentId: comment.id,
                            isLike: comment.isLike,
                            dislike: comment.totalDislikes,
                            userImage: SessionData.userModel?.image ?? '',
                            name: comment.user.name,
                            role: comment.user.role,
                            content: comment.description,
                            imageUrl: comment.images,
                            comments: comment.totalDislikes,
                            likes: comment.totalLikes,
                          );
                        }).toList(),
                      ),
                    );
                  } else if (state is CommentError) {
                    return const EmptyWidget(
                      text: 'تعليقات',
                    );
                  } else {
                    return const EmptyWidget(
                      text: 'تعليقات',
                    );
                  }
                },
              ),
            ),
            ImageUploadWidget(
              ruinId: widget.ruinId,
            ),
          ],
        ),
      ),
    );
  }
}
