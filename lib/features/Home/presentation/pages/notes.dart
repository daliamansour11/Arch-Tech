import 'package:archtech/features/Home/presentation/widgets/note_form.dart';
import 'package:archtech/features/Home/presentation/widgets/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_bar.dart';
import '../bloc/note_bloc/note_bloc.dart';
import '../bloc/note_bloc/note_event.dart';

class NotesScreen extends StatelessWidget {
  static const routeName = 'notes/';
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc()..add(FetchAllNotes()),
      child: Scaffold(
        appBar: myAppBar(context, 'Notes'),
        body: const NotesList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NoteForm(isEditing: false),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}