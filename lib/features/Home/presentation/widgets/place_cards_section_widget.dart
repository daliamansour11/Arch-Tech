import 'package:archtech/features/Home/presentation/pages/RuninType.dart';
import 'package:archtech/features/Home/presentation/widgets/places_main.dart';
import 'package:flutter/cupertino.dart';

class PlaceCardsSectionWidget extends StatelessWidget {
  const PlaceCardsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            PlaceCardWidget(
              type: 'Inscriptions',
              imagePath: 'assets/images/nkoosh.png',
            ),
            PlaceCardWidget(
              type: 'Archaeological Sites',
              imagePath: 'assets/images/m3abeed.png',
            ),
            PlaceCardWidget(
              type: 'TheTemple',
              imagePath: 'assets/images/madaen.png',
            ),
            PlaceCardWidget(
              type: 'Antiquities',
              imagePath: 'assets/images/athar.png',
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceCardWidget extends StatelessWidget {
  final String type;
  final String imagePath;

  const PlaceCardWidget({
    super.key,
    required this.type,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: PlaceMainCard(
        textKey: type,
        imagePath: imagePath,
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const Runintype(),
            ),
          );
        },
      ),
    );
  }
}
