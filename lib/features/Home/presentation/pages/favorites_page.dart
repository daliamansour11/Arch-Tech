import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/extension/locale_on_context.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/data/models/favoraite_model.dart';
import 'package:archtech/features/Home/presentation/pages/pic.dart';
import 'package:archtech/features/Home/presentation/widgets/favorites_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/Repo/fav_repo.dart';
import '../bloc/fav_bloc/fav_bloc.dart';
import '../bloc/fav_bloc/fav_event.dart';
import '../bloc/fav_bloc/fav_state.dart';
import '../widgets/empty_widget.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = 'fav/';
  const FavoritesPage({super.key});

  // 🔹 Mock data for loading state
  List<FavoriteRuin> get mockFavorites => List.generate(
        5,
        (index) => FavoriteRuin(
          id: index,
          isFav: true,
          name: 'Loading...',
          description: 'Fetching details...',
          image: '',
          type: 'Loading...',
          governorateName: 'Loading...',
          regionName: 'Loading...',
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavoriteBloc(FavoriteRepository())..add(FetchFavorites()),
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: TextManger('Favorites',
                  style: TextStyleManager.headlineLarge),
            ),
            Expanded(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  List<FavoriteRuin> favorites = [];

                  if (state is FavoriteLoading) {
                    favorites = mockFavorites;
                  } else if (state is FavoriteLoaded) {
                    favorites = state.favorites;
                    if (favorites.isEmpty) {
                      return EmptyWidget(text: context.translate('EmptyData'));
                    }
                  } else if (state is FavoriteError) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child:
                          EmptyWidget(text: context.translate('unknown_error')),
                    );
                  }

                  return Skeletonizer(
                    enabled: state is FavoriteLoading,
                    enableSwitchAnimation: true,
                    child: ListView.builder(
                      itemCount: favorites.length,
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        final favorite = favorites[index];
                        return InkWell(
                          overlayColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          onTap: () {
                            final ruin = SessionData.ruins
                                .where((ruin) => ruin.id == favorite.id)
                                .first;
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Pic(
                                        ruin: ruin,
                                      )),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FavoritesImage(
                                      imageUrl: favorite.image,
                                      id: favorite.id),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextManger(
                                          favorite.name,
                                          style: TextStyleManager.bodyLargeBold,
                                        ),
                                        const SizedBox(height: 8),
                                        TextManger(
                                          favorite.description,
                                          style:
                                              TextStyleManager.bodyMediumGrey,
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
