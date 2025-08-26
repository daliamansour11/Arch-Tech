import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/features/Home/presentation/bloc/note_bloc/note_event.dart';
import 'package:archtech/features/Home/presentation/bloc/note_bloc/note_state.dart';
import 'package:archtech/features/Home/presentation/widgets/empty_widget.dart';
import 'package:archtech/features/Home/presentation/widgets/note_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/color_manger.dart';
import '../../../../core/utils/text_manager.dart';
import '../../../../core/utils/text_style_manager.dart';
import '../bloc/note_bloc/note_bloc.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => NotesBloc()..add(FetchAllNotes()),
          child: BlocBuilder<NotesBloc, NotesState>(
            builder: (context, state) {
              if (state is NotesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NotesLoaded) {
                final notes = state.notes;
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: notes.length,
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextManger(notes[index].title,
                              style: TextStyleManager.bodyLarge),
                          TextManger(
                            notes[index].description,
                            style: TextStyleManager.bodyMediumGrey,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NoteForm(
                                        note: notes[index],
                                        isEditing: true,
                                      ),
                                    ),
                                  );
                                },
                                width: context.width * 0.2,
                                contentPadding: 0.007,
                                color: ColorManger.darkOliveGreen,
                                text: 'edit',
                              ),
                              CustomButton(
                                onPressed: () {
                                  context
                                      .read<NotesBloc>()
                                      .add(DeleteNote(notes[index].id));
                                },
                                text: 'Delete',
                                width: context.width * 0.2,
                                contentPadding: 0.007,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is NotesError) {
                return const EmptyWidget(
                  text: 'EmptyData',
                );
              } else {
                return const Center(
                    child: TextManger(StringManager.somethingWentWrong));
              }
            },
          ),
        ),
      ),
    );
  }
}
