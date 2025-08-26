import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_manger.dart';
import '../bloc/comment_bloc/comment_bloc.dart';
import '../bloc/comment_bloc/comment_event.dart';

class ImageUploadWidget extends StatefulWidget {
  final int ruinId;

  const ImageUploadWidget({super.key, required this.ruinId});

  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  final TextEditingController _controller = TextEditingController();
  File? _selectedImage;
  bool _isImageLoading = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    setState(() => _isImageLoading = true);

    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
          _isImageLoading = false;
        });
      } else {
        setState(() => _isImageLoading = false);
      }
    } catch (e) {
      setState(() => _isImageLoading = false);
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomInputBar(context);
  }

  Widget _buildBottomInputBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isImageLoading)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          if (_selectedImage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _selectedImage!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(Icons.error, color: Colors.red),
                          ),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _selectedImage = null),
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.close, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.image, color: ColorManger.primary),
                onPressed: _pickImage,
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    hintText: 'اكتب تعليقًا...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  final comment = _controller.text.trim();

                  if (comment.isNotEmpty || _selectedImage != null) {
                    context.read<CommentBloc>().add(
                          StoreComment(
                            ruinId: widget.ruinId,
                            description: comment,
                            image: _selectedImage,
                          ),
                        );

                    // نظّف الفورم بعد الإرسال
                    setState(() {
                      _controller.clear();
                      _selectedImage = null;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: ColorManger.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
