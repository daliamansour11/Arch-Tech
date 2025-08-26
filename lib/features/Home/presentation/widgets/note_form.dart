import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/features/Home/presentation/widgets/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/color_manger.dart';
import '../../../../core/utils/custom_text_field.dart';
import '../../data/models/note.dart';
import '../bloc/note_bloc/note_bloc.dart';
import '../bloc/note_bloc/note_event.dart';

class NoteForm extends StatelessWidget {
  final Note? note;
  final bool isEditing;

  const NoteForm({super.key, this.note, required this.isEditing});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: note?.title ?? '');
    final descriptionController =
        TextEditingController(text: note?.description ?? '');

    return BlocProvider(
      create: (context) => NotesBloc(),
      child: Builder(
        builder: (context) => SafeArea(
          child: Scaffold(
            appBar: myAppBar(context, isEditing ? 'Edit' : 'Add'),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextField(
                      controller: titleController, hintText: 'Name'),
                  const SizedBox(height: 16),
                  CustomTextField(
                      controller: descriptionController,
                      hintText: 'Description'),
                  const SizedBox(height: 16),
                  CustomButton(
                    onPressed: () {
                      final title = titleController.text;
                      final description = descriptionController.text;

                      if (isEditing) {
                        context.read<NotesBloc>().add(
                              UpdateNote(
                                Note(
                                  id: note!.id,
                                  title: title,
                                  description: description,
                                ),
                              ),
                            );
                      } else {
                        context.read<NotesBloc>().add(
                              AddNote(
                                Note(
                                  id: 1,
                                  title: title,
                                  description: description,
                                ),
                              ),
                            );
                      }

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotesList(),
                        ),
                      );
                    },
                    width: context.width * 0.3,
                    contentPadding: 0.007,
                    color: ColorManger.darkOliveGreen,
                    text: isEditing ? 'Edit' : 'Add',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
