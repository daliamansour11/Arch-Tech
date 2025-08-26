import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:archtech/features/Home/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:archtech/features/Home/presentation/bloc/main_bloc/main_state.dart';
import 'package:archtech/features/Home/presentation/widgets/library_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LibraryRuinsSectionWidget extends StatelessWidget {
  const LibraryRuinsSectionWidget({super.key});

  // Mock data for loading state
  List<Ruin> get mockRuins => List.generate(
        4,
        (index) => Ruin(
          id: index,
          rate: '0',
          name: 'Loading...',
          description: 'Fetching details...',
          image: '',
          type: 'Loading...',
          governorateId: 0,
          regionId: 0,
          workDate: '',
          createdAt: '',
          updatedAt: '',
          lat: 0.0,
          lang: 0.0,
          governorateName: 'Loading...',
          regionName: 'Loading...',
          isFav: false,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          List<Ruin> ruins = [];
          if (state is MainLoading) {
            ruins = mockRuins;
          } else if (state is MainLoaded) {
            ruins = state.ruins;
          } else if (state is MainError) {
            return const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Center(
                child:
                    TextManger('EmptyData', style: TextStyleManager.errorStyle),
              ),
            );
          }

          return Skeletonizer(
            enabled: state is MainLoading,
            child: SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ruins.length,
                itemBuilder: (context, index) {
                  final ruin = ruins[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: LibraryContainer(ruin: ruin),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
