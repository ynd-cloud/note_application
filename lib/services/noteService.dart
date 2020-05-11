import 'dart:convert';

import 'package:note_application/models/apiResponse.dart';
import 'package:note_application/models/note.dart';
import 'package:note_application/models/noteForListing.dart';
import 'package:http/http.dart' as http;
import 'package:note_application/models/noteInsert.dart';

class NotesService {
  // List<NoteForListing> getNotesList(){
  //    return [
  //   new NoteForListing(
  //     noteID: "1",
  //     createDateTime: DateTime.now(),
  //     lastestEditDateTime: DateTime.now(),
  //     noteTitle: "Note1",
  //   ),
  //   new NoteForListing(
  //     noteID: "2",
  //     createDateTime: DateTime.now(),
  //     lastestEditDateTime: DateTime.now(),
  //     noteTitle: "Note2",
  //   ),
  //   new NoteForListing(
  //     noteID: "3",
  //     createDateTime: DateTime.now(),
  //     lastestEditDateTime: DateTime.now(),
  //     noteTitle: "Note3",
  //   ),
  // ];
  //}
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {
    'apiKey': 'd798eb38-1ba9-4a2a-996c-93deda3458e5',
    'Content-Type': 'application/json'
  };

  Future<APIResponse<List<NoteForListing>>> getNotesList(){
    return http.get(API + '/notes', headers: headers)
    .then((data){
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          notes.add(NoteForListing.formJson(item));
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) =>  APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Note>> getNote(String noteID){
    return http.get(API + '/notes/' + noteID , headers: headers)
    .then((data){
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.formJson(jsonData));
      }
      return APIResponse<Note>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) =>  APIResponse<Note>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createNote(NoteManipulation item){
    return http.post(API + '/notes/' , headers: headers, body: json.encode(item.toJson()))
    .then((data){
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) =>  APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateNote(String noteID, NoteManipulation item){
    return http.put(API + '/notes/' + noteID , headers: headers, body: json.encode(item.toJson()))
    .then((data){
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) =>  APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

    Future<APIResponse<bool>> deleteNote(String noteID){
    return http.delete(API + '/notes/' + noteID , headers: headers)
    .then((data){
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) =>  APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}