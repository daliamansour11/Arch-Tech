import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/features/Home/presentation/pages/pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/presentation/widgets/grid_image.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String location;
  final String status;
  final double rating;
  final String imagePath;
  final int id;
  final bool isFavorite;

  const GridItem(
      {super.key,
      required this.title,
      required this.location,
      required this.status,
      required this.rating,
      required this.imagePath,
      required this.id,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        final ruin = SessionData.ruins.where((ruin) => ruin.id == id).first;
        Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => Pic(
                    ruin: ruin,
                  )),
        );
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GridImage(
                imagePath: imagePath,
                id: id,
                type: 'runin',
                isFavorite: isFavorite,
              ),
              TextManger(
                title,
                style: TextStyleManager.bodyLargeBold,
              ),
              TextManger(
                location,
                style: TextStyleManager.bodyMediumGrey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextManger(
                    ' $status',
                    style: TextStyleManager.bodySmall,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      TextManger(
                        rating.toString(),
                        style: TextStyleManager.bodyMedium,
                      ),
                      Icon(
                        Icons.star,
                        color:
                            rating > 0 ? ColorManger.yellow : ColorManger.grey,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
