import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'assets/images/nkoosh.png',
      'assets/images/nkoosh.png',
      'assets/images/nkoosh.png',
      'assets/images/nkoosh.png',
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10, 
          childAspectRatio: 1, 
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15), 
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}