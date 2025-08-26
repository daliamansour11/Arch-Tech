import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/note_repo.dart';
import 'note_event.dart';
import 'note_state.dart';


class NotesBloc extends Bloc<NotesEvent, NotesState> {
  

  final NotesRepository notesRepository ;
  NotesBloc() : notesRepository = NotesRepository(), super(NotesLoading()) {
    on<FetchAllNotes>(_onFetchAllNotes);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);
    on<AddNote>(_onAddNote); 
  }

  Future<void> _onFetchAllNotes(FetchAllNotes event, Emitter<NotesState> emit) async {
    try {
      final notes = await notesRepository.fetchAllNotes();
      emit(NotesLoaded(notes));
    } catch (e) {
      emit(const NotesError('Failed to fetch notes'));
    }
  }

  Future<void> _onAddNote(AddNote event, Emitter<NotesState> emit) async {
    try {
      await notesRepository.addNote(event.note);
      emit(NoteAdded());
      add(FetchAllNotes());
    } catch (e) {
      emit(const NotesError('Failed to add note'));
    }
  }

  Future<void> _onUpdateNote(UpdateNote event, Emitter<NotesState> emit) async {
    try {
      await notesRepository.updateNote(event.note);
      emit(NoteUpdated());
      add(FetchAllNotes()); 
    } catch (e) {
      emit(const NotesError('Failed to update note'));
    }
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<NotesState> emit) async {
    try {
      await notesRepository.deleteNote(event.noteId);
      emit(NoteDeleted());
      add(FetchAllNotes()); 
    } catch (e) {
      log(e.toString());
      emit(const NotesError('Failed to delete note'));
    }
  }
}