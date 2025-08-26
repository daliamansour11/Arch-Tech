import 'package:archtech/config/routes/route_imports.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/text_manager.dart';
import '../../../../core/utils/text_style_manager.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.textKey,
    required this.imagePath,
    required this.id,
    
  });

  final String textKey;
  final String imagePath;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: GestureDetector(
        onTap: (){
            final ruin = SessionData.ruins.where((ruin) => ruin.id == id).first;
          Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pic(ruin: ruin,), 
        ),
      ); 
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imagePath,
                width: MediaQuery.of(context).size.width / 5,
                height: 100,
                fit: BoxFit.cover,
                 errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/library.png',
                                  width: double.infinity,
                                  height: 120,
                                  fit: BoxFit.cover,
                                );
                              },
              ),
            ),
            const SizedBox(height: 8),
            TextManger(
              textKey,
              style: TextStyleManager.bodyMediumBold,
            ),
          ],
        ),
      ),
    );
  }
}
