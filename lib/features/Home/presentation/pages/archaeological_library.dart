import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/features/Home/presentation/widgets/grid_item.dart';
import '../../../../core/injection.dart';
import '../bloc/main_bloc/main_bloc.dart';
import '../bloc/main_bloc/main_event.dart';
import '../bloc/main_bloc/main_state.dart';

class ArchaeologicalLibrary extends StatelessWidget {
  static const String routeName = 'archaeological_library/';
  const ArchaeologicalLibrary({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
      create: (context) => MainBloc(Injection.instance.cacheHelper,Injection.instance.sessionRepository)
        ..add(FetchRuins()),
      child:Scaffold(
        appBar: myAppBar(context, 'LibraryOfArchaeologicalInscriptions'),
        body: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state is MainLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MainLoaded) {
              final arch = state.ruins;
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: arch.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => GridItem(
                  title: arch[index].name,
                  location: arch[index].regionName,
                  status: 'open',
                  rating: 4,
                  imagePath: arch[index].image, id: arch[index].id, isFavorite: arch[index].isFav,
                ),
              );
            } else if (state is MainError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      
     ) );
  }
}