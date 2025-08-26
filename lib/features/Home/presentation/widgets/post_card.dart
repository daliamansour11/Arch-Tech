import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/my_network_image.dart';
import 'package:archtech/features/Home/data/models/comment_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/comment_bloc/comment_bloc.dart';
import '../bloc/comment_bloc/comment_event.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.commentId,
    required this.name,
    required this.role,
    required this.content,
    required this.imageUrl,
    required this.comments,
    required this.likes,
    required this.dislike,
    required this.userImage,
    required this.isLike,
  });

  final int commentId;
  final String name;
  final String role;
  final String? content;
  final String userImage;
  final List<CommentImage> imageUrl;
  final int comments;
  final int likes;
  final int dislike;
  final bool? isLike;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 12),
            if (content != null && content!.trim().isNotEmpty)
              Text(
                content!,
                style: const TextStyle(fontSize: 14),
              ),
            if (imageUrl.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildImages(context),
            ],
            const SizedBox(height: 12),
            _buildReactions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: CachedNetworkImageProvider(userImage),
          onBackgroundImageError: (_, __) {},
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(role, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          ],
        ),
      ],
    );
  }

  Widget _buildImages(BuildContext context) {
    if (imageUrl.length == 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: MyNetworkImage(
          url: 'http://82.29.177.176:8000/ruins/comments/${imageUrl[0].name}',
          fit: BoxFit.cover,
          height: 180,
          width: double.infinity,
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageUrl.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: MyNetworkImage(
          url:
              'http://82.29.177.176:8000/ruins/comments/${imageUrl[index].name}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildReactions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _reactionIcon(
          icon: Icons.thumb_down,
          count: dislike,
          color: isLike == false ? Colors.red : Colors.grey,
          onTap: () => context
              .read<CommentBloc>()
              .add(DislikeComment(commentId: commentId)),
        ),
        const SizedBox(width: 16),
        _reactionIcon(
          icon: Icons.thumb_up,
          count: likes,
          color: isLike == true ? ColorManger.primary : Colors.grey,
          onTap: () => context
              .read<CommentBloc>()
              .add(LikeComment(commentId: commentId)),
        ),
      ],
    );
  }

  Widget _reactionIcon({
    required IconData icon,
    required int count,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 4),
          Text('$count'),
        ],
      ),
    );
  }
}
