
import 'package:equatable/equatable.dart';

import '../../../data/models/note.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class FetchAllNotes extends NotesEvent {}
class AddNote extends NotesEvent {
  final Note note;

  const AddNote(this.note);
}


class UpdateNote extends NotesEvent {
  final Note note;

  const UpdateNote(this.note);

  @override
  List<Object> get props => [note];
}

class DeleteNote extends NotesEvent {
  final int noteId;

  const DeleteNote(this.noteId);

  @override
  List<Object> get props => [noteId];
}