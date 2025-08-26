import 'dart:developer';

import 'package:archtech/core/_constants/images_constants.dart';
import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../core/_constants/svg_constants.dart';
import '../../data/repo/fav_repo.dart';

class FavoritesImage extends StatefulWidget {
  final String? imageUrl;
  final int id;
  const FavoritesImage({super.key, this.imageUrl, required this.id});

  @override
  State<FavoritesImage> createState() => _FavoritesImageState();
}

class _FavoritesImageState extends State<FavoritesImage> {
  FavoriteRepository favoriteRepository = FavoriteRepository();
  bool isFavorite = false;
  bool isLoading = false;
  Future<void> _toggleFavorite() async {
    setState(() {
      isLoading = true;
    });

    try {
      final bool isAdded = await favoriteRepository.toggleFavorite(
        'ruine',
        widget.id,
      );
      log(isAdded.toString());
      if (isAdded == true) {
        setState(() {
          isFavorite = !isFavorite;
        });
      }
    } catch (e) {
      log('Error toggling favorite: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        SizedBox(
          height: context.height * 0.1,
          width: context.width * 0.3,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: widget.imageUrl != null && widget.imageUrl!.isNotEmpty
                    ? NetworkImage(
                        widget.imageUrl!,
                      )
                    : const AssetImage(ImagesConstantsAsset.test)
                        as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Skeleton.ignore(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: _toggleFavorite,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: isFavorite ? Colors.white : ColorManger.primary,
                  shape: BoxShape.circle,
                ),
                child: isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2,
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: VectorGraphic(
                          width: 15,
                          height: 15,
                          colorFilter: ColorFilter.mode(
                            isFavorite ? ColorManger.primary : Colors.white,
                            BlendMode.srcIn,
                          ),
                          loader: const AssetBytesLoader(
                              SvgConstantsAssets.assetsSvgFavorite),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
