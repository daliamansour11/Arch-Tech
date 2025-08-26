import 'dart:developer';

import 'package:archtech/core/api/end_points.dart';
import 'package:archtech/core/api/session_repository.dart';
import 'package:archtech/core/injection.dart';
import 'package:dio/dio.dart';
import '../../../../core/cache/cash_helper.dart';
import '../models/note.dart';

class NotesRepository {
  final SessionRepository _sessionRepository = Injection.instance.sessionRepository;
  final  CacheHelper _cacheHelper = Injection.instance.cacheHelper;
  final Dio dio = Dio(
 
  );

  NotesRepository();

  Future<List<Note>> fetchAllNotes() async {
    try {
         final String? code = await _cacheHelper.getData(key: 'locale');
       String? token = await _sessionRepository.getToken();
        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.headers['Accept-Language'] ='$code';
      final response = await dio.get('${EndPoints.baseUrl}my-notes');
      log('انااااا اليوو اار ايل  ${EndPoints.baseUrl}notes' );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']; 
        return data.map((note) => Note.fromJson(note)).toList();
      } else {
        throw Exception('Failed to load notes');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch notes: ${e.message}');
    }
  }

  Future<void> updateNote(Note note) async {
    final noteData = note.toJson();
    noteData.remove('id'); 

    try {
        final String? code = await _cacheHelper.getData(key: 'locale');
       String? token = await _sessionRepository.getToken();
        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.headers['Accept-Language'] ='$code';
      final response = await dio.put('notes/${note.id}', data: noteData);
      if (response.statusCode != 200) {
        throw Exception('Failed to update note');
      }
    } on DioException catch (e) {
      throw Exception('Failed to update note: ${e.message}');
    }
  }

  Future<void> addNote(Note note) async {
    try {
         final String? code = await _cacheHelper.getData(key: 'locale');
       String? token = await _sessionRepository.getToken();
        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.headers['Accept-Language'] ='$code';
      final noteData = note.toJson();
      noteData.remove('id'); 
      log(noteData.toString());
      log(token!);
      final response = await dio.post('${EndPoints.baseUrl}notes', data: noteData);
      log(response.toString());
      if (response.statusCode != 200) {

        throw Exception('Failed to add note');
      }
    } on DioException catch (e) {
      throw Exception('Failed to add note: ${e.message}');
    }
  }

  Future<void> deleteNote(int noteId) async {
    try {
      final String? code = await _cacheHelper.getData(key: 'locale');
       String? token = await _sessionRepository.getToken();
        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.headers['Accept-Language'] ='$code';
      final response = await dio.delete('${EndPoints.baseUrl}notes/$noteId');
      log('${EndPoints.baseUrl}notes/$noteId');
      if (response.statusCode != 200) {
        log(response.data.toString());
        throw Exception('Failed to delete note');
      }
    } on DioException catch (e) {
      throw Exception('Failed to delete note: ${e.message}');
    }
  }
}
