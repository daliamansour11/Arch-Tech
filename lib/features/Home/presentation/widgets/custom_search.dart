import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/color_manger.dart';
import '../pages/filter_search.dart';

class CustomSearchtechBar extends StatelessWidget {
  final bool isResearchtecher;

  const CustomSearchtechBar({super.key, required this.isResearchtecher});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: double.infinity,
        height: isResearchtecher ? 70 : 50, 
        child: GestureDetector(
          onTap: () {
             Navigator.push(
              context,
               CupertinoPageRoute(builder: (context) => const FilterSearch()),
             );
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: isResearchtecher
                      ? BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(15),
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'ابحث عن أماكن ومواقع قريبة...',
                            hintStyle: TextStyleManager.bodySmallGrey,
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.right,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                           readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => const FilterSearch()),
                          );
                        },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                  width: 60,
                  height: isResearchtecher ? 50 : 40,
                  decoration: BoxDecoration(
                    color: isResearchtecher
                        ? ColorManger.primary
                        : ColorManger.primary,
                    borderRadius: isResearchtecher
                        ? const BorderRadius.all(Radius.circular(15))
                        : BorderRadius.circular(15),
                  ),
                  child:  const Icon(Icons.tune,color: Colors.white,))
            ],
          ),
        ),
      ),
    );
  }
}
