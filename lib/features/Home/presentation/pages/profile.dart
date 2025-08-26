import 'package:archtech/core/_constants/constant.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/utils/my_network_image.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/presentation/cubit/get_shared_image_cubit.dart';
import 'package:archtech/features/Home/presentation/widgets/subscribed_card.dart';
import 'package:archtech/features/Home/presentation/widgets/subscribed_details_card.dart';
import 'package:archtech/features/Subscriptions/data/subscriptions_model.dart';
import 'package:archtech/features/Subscriptions/presentation/bloc/subscriptions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/prof_header.dart';

class Profile extends StatelessWidget {
  static const routeName = 'profile/';

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 10),
        const ProfHeader(),
        const SizedBox(height: 20),
        BlocBuilder<SubscriptionsBloc, SubscriptionsState>(
          builder: (context, state) {
            final SubscriptionsModel? subscriptionsModel =
                SessionData.subscriptionsModel;

            return AnimatedSwitcher(
                duration: Constant.loadingDuration,
                transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                child: subscriptionsModel?.title != null
                    ? SubscribedDetailsCard(
                        subscriptionsModel: subscriptionsModel!,
                      )
                    : const SubscribedCard());
          },
        ),
        BlocBuilder<GetSharedImageCubit, GetSharedImageState>(
          builder: (context, state) {
            return state.when(
                initial: () => Container(),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (images) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const TextManger(
                          'SharedPhotos',
                          style: TextStyleManager.bodyLargeBold,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: images.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: MyNetworkImage(url: images[index])),
                        )
                      ],
                    ),
                error: (message) {
                  return const SizedBox.shrink();
                });
          },
        )
      ],
    );
  }
}
