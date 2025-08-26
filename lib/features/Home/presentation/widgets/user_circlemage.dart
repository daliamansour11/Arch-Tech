// ignore_for_file: must_be_immutable

import 'package:archtech/core/api/session_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserCirclemage extends StatelessWidget {
  const UserCirclemage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundImage: CachedNetworkImageProvider(
        SessionData.userModel?.image ?? '',
      ),
      onBackgroundImageError: (_, __) {
        // You can set a fallback image by updating the state
      },
      child: CachedNetworkImage(
        imageUrl: SessionData.userModel?.image ??
            'https://img.freepik.com/free-vector/user-blue-gradient_78370-4692.jpg?t=st=1742945226~exp=1742948826~hmac=1a476400456cad362ccd4b330559a7aa7773973ace259813ac531aee9bec3678&w=826',
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: 24,
          backgroundImage: imageProvider,
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
            'https://img.freepik.com/free-vector/user-blue-gradient_78370-4692.jpg?t=st=1742945226~exp=1742948826~hmac=1a476400456cad362ccd4b330559a7aa7773973ace259813ac531aee9bec3678&w=826',
          ),
        ),
      ),
    );
  }
}
