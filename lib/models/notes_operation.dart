import 'package:flutter/material.dart';
import 'package:bwanoteprovider/models/notedata.dart';

class NoteOperation with ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  NoteOperation(String title, String description) {
    addNewNote('First note', 'First note description');
  }

  void addNewNote(String title, String description) {
    Note note = Note(title, description);
    _notes.add(note);
    notifyListeners();
  }

  void removeAllNotes() {
    _notes.clear();
    notifyListeners();
  }
}
