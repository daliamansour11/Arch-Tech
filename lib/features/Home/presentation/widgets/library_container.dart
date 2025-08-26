import 'dart:developer';

import 'package:archtech/core/_constants/svg_constants.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../core/theme/color_manger.dart';
import '../../data/repo/fav_repo.dart';
import '../pages/pic.dart';

class LibraryContainer extends StatefulWidget {
  const LibraryContainer({super.key, required this.ruin});

  final Ruin ruin;

  @override
  State<LibraryContainer> createState() => _LibraryContainerState();
}

class _LibraryContainerState extends State<LibraryContainer> {
  FavoriteRepository favoriteRepository = FavoriteRepository();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _toggleFavorite() async {
    setState(() {
      isLoading = true;
    });

    try {
      final bool isAdded = await favoriteRepository.toggleFavorite(
        widget.ruin.type,
        widget.ruin.id,
      );
      log(isAdded.toString());
      if (isAdded == true) {
        setState(() {
          widget.ruin.isFav = !widget.ruin.isFav;
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
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => Pic(
                      ruin: widget.ruin,
                    )),
          );
        },
        child: Container(
          width: 250,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: widget.ruin.image.isNotEmpty
                        ? Image.network(
                            widget.ruin.image,
                            width: double.infinity,
                            height: 120,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/library.png',
                                width: double.infinity,
                                height: 120,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            'assets/images/library.png',
                            width: double.infinity,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: _toggleFavorite,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: widget.ruin.isFav
                              ? ColorManger.primary
                              : Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  strokeWidth: 2,
                                ),
                              )
                            : Align(
                                alignment: Alignment.center,
                                child: VectorGraphic(
                                  width: 15,
                                  height: 15,
                                  colorFilter: ColorFilter.mode(
                                    widget.ruin.isFav
                                        ? Colors.white
                                        : ColorManger.primary,
                                    BlendMode.srcIn,
                                  ),
                                  loader: const AssetBytesLoader(
                                      SvgConstantsAssets.assetsSvgFavorite),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Flexible(
                        child: Text(
                          widget.ruin.name,
                          style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.ruin.rate,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 4),
                              RatingList(
                                height: 16,
                                spacing: 2,
                                rating: double.parse(widget.ruin.rate),
                              )
                            ],
                          ),
                        ],
                      ),
                    ]),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${widget.ruin.regionName}, ${widget.ruin.governorateName}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        TextManger(
                          widget.ruin.type,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingList extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final double spacing, rating;
  final double? height;
  const RatingList({
    super.key,
    required this.rating,
    this.spacing = 2,
    this.height,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      spacing: spacing,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: height,
          color: rating > index ? ColorManger.primary : ColorManger.grey,
        );
      }),
    );
  }
}
