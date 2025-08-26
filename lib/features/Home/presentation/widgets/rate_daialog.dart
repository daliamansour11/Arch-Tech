import 'package:archtech/core/injection.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../bloc/main_bloc/main_bloc.dart';
import '../bloc/main_bloc/main_event.dart';
import '../bloc/main_bloc/main_state.dart';

class RatingDialog extends StatefulWidget {
  final double initialRating;
  final int id;

  const RatingDialog({
    super.key,
    required this.id,
    required this.initialRating,
  });

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double _currentRating = 0;
  bool _isSubmitted = false; 
  

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  void _showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const TextManger('Notification'),
        content: TextManger(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (_isSubmitted) {
                Navigator.pop(context); 
              }
            },
            child: const TextManger('confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(Injection.instance.cacheHelper, Injection.instance.sessionRepository),
      child: BlocListener<MainBloc, MainState>(
        listener: (context, state) {
          if (state is ReviewStoredSuccessfully) {
            setState(() => _isSubmitted = true);
            _showMessage(context, 'review_success');
          } else if (state is MainError) { 
            _showMessage(context, 'review_already'); 
          }
        },
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 40),
                    Text(
                      widget.initialRating.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                const TextManger(
                  'do_you_like_the_place',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const TextManger('please_rate_the_place', textAlign: TextAlign.center),

                const SizedBox(height: 16),

                RatingBar.builder(
                  initialRating: _currentRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _currentRating = rating;
                    });
                  },
                ),

                const SizedBox(height: 16),

             if (!_isSubmitted) 
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const TextManger('cancel'),
      ),
      Builder(
        builder: (innerContext) {
          return ElevatedButton(
            onPressed: () {
              innerContext.read<MainBloc>().add(StoreReview(
                review: _currentRating.toInt(),
                ruinId: widget.id,
              ));
            },
            child: const TextManger('confirm'),
          );
        },
      ),
    ],
  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


