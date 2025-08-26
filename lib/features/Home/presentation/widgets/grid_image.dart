import 'package:archtech/core/_constants/svg_constants.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'dart:developer';
import '../../data/repo/fav_repo.dart'; 

class GridImage extends StatefulWidget {
  final String imagePath;
  final double aspectRatio;
  final int id;
  final String type;
  final bool isFavorite; 

  const GridImage({
    super.key,
    this.aspectRatio = 4 / 3,
    required this.imagePath,
    required this.id,
    required this.type,
    required this.isFavorite, 
  });

  @override
  State<GridImage> createState() => _GridImageState();
}

class _GridImageState extends State<GridImage> {
  FavoriteRepository favoriteRepository = FavoriteRepository();
  late bool isFavorite; 
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite; 
  }

  Future<void> _toggleFavorite() async {
    setState(() {
      isLoading = true;
    });

    try {
      final bool isAdded = await favoriteRepository.toggleFavorite(
        widget.type, 
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
      alignment: AlignmentDirectional.topEnd,
      children: [
        AspectRatio(
          aspectRatio: widget.aspectRatio,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: widget.imagePath.isNotEmpty
                  ? Image.network(
                      widget.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/nkoosh.png',
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset(
                      'assets/images/nkoosh.png',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: GestureDetector(
            onTap: _toggleFavorite,
            child: CircleAvatar(
              backgroundColor: isFavorite ? ColorManger.primary : Colors.white,
              radius: 16,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2,
                      )
                    : VectorGraphic(
                        colorFilter: ColorFilter.mode(
                          isFavorite ? ColorManger.backGround : ColorManger.primary,
                          BlendMode.srcIn,
                        ),
                        loader: const AssetBytesLoader(SvgConstantsAssets.assetsSvgFavorite),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}