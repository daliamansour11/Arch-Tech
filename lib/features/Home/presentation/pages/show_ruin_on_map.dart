import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:archtech/features/Home/presentation/pages/google_map.dart';
import 'package:flutter/material.dart';

class ShowRuinOnMap extends StatelessWidget {
  static const routeName = 'ShowRuinOnMap/';
  final Ruin ruin;
  const ShowRuinOnMap({super.key, required this.ruin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, ruin.name),
      body: const MyGoogleMap(
        key: Key('ShowRuinOnMap'),
      ),
    );
  }
}
