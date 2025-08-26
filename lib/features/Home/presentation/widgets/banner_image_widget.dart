import 'dart:async';

import 'package:archtech/core/_constants/constant.dart';
import 'package:archtech/core/utils/my_network_image.dart';
import 'package:archtech/features/Home/presentation/cubit/image_slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerImageWidget extends StatelessWidget {
  const BannerImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<ImageSliderCubit, ImageSliderState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (images) => BannerSlider(imagesUrl: images),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}

class BannerSlider extends StatefulWidget {
  final List<String> imagesUrl;
  final bool autoPlay;
  const BannerSlider(
      {super.key, required this.imagesUrl, this.autoPlay = true});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController pageController = PageController(initialPage: 0);
  Timer? _timer; // Timer for auto-sliding
  int _currentPage = 0; // Track the current page index

  @override
  void initState() {
    super.initState();
    _startAutoSlide(); // Start the auto-slide timer
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    pageController.dispose();
    super.dispose();
  }

  // Function to start the auto-slide timer
  void _startAutoSlide() {
    if (widget.autoPlay) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        if (_currentPage < widget.imagesUrl.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0; // Reset to the first image
        }
        pageController.animateToPage(
          _currentPage,
          duration: Constant.pageTransitionDuration,
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: PageView.builder(
          itemCount: widget.imagesUrl.length,
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index; // Update the current page index
            });
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: MyNetworkImage(
                  url: widget.imagesUrl[index],
                  key: ValueKey<String>(widget.imagesUrl[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
