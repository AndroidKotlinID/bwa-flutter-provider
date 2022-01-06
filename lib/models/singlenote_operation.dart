import 'package:flutter/material.dart';
import 'package:bwanoteprovider/models/singlenotedata.dart';

class SingleNoteOperation with ChangeNotifier {
  SingleNote _singleNoteData = SingleNote('', '');

  SingleNote get getSingleNote {
    return _singleNoteData;
  }

  SingleNoteOperation({String judulCatatan = '', String isiCatatan = ''}) {
    addNewNote(judulCatatan: judulCatatan, isiCatatan: isiCatatan);
  }

  void addNewNote({String judulCatatan = '', String isiCatatan = ''}) {
    SingleNote singleNotes = SingleNote(judulCatatan, isiCatatan);
    _singleNoteData = singleNotes;
    notifyListeners();
  }

  void clearNote() {
    SingleNote singleNoteClear = SingleNote('', '');
    _singleNoteData = singleNoteClear;
    notifyListeners();
  }
}
