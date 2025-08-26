import 'package:archtech/core/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/presentation/widgets/grid_image.dart';
import 'package:archtech/features/Home/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:archtech/features/Home/presentation/bloc/main_bloc/main_event.dart';
import 'package:archtech/features/Home/presentation/bloc/main_bloc/main_state.dart';

class ArchaeologicalInfo extends StatelessWidget {
  static const String routeName = 'archaeological_info/';
  const ArchaeologicalInfo({super.key});

  @override
  Widget build(BuildContext context) {
   

    return BlocProvider(
      create: (context) => MainBloc(Injection.instance.cacheHelper,Injection.instance.sessionRepository)
        ..add(FetchArch()),
      child: Scaffold(
        appBar: myAppBar(context, 'ArchaeologicalInfo'),
        body: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if (state is ArchLoaded) {
              final arch = state.arch;
              return ListView.builder(
                itemCount: arch.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextManger(
                                arch[index].title,
                                style: TextStyleManager.bodyLarge
                                    .copyWith(color: ColorManger.primary),
                              ),
                              TextManger(
                                arch[index].description,
                                style: TextStyleManager.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GridImage(
                            aspectRatio: 1.2,
                            imagePath: arch[index].imageUrl,
                            id: arch[index].id,
                            type: 'arch',
                            isFavorite: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is MainError) {
              return Center(
                child: TextManger(
                  state.message,
                  style: TextStyleManager.bodyLarge
                      .copyWith(color: ColorManger.blackStroke),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      
     ) );
  }
}