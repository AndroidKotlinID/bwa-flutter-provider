import 'package:bwanoteprovider/models/notes_operation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bwanoteprovider/themedata.dart';

class AddScreenPage extends StatefulWidget {
  const AddScreenPage({Key? key}) : super(key: key);

  @override
  _AddScreenPageState createState() => _AddScreenPageState();
}

class _AddScreenPageState extends State<AddScreenPage> {
  String titleText = '';
  String descriptionText = '';

  String titlePage = 'Add New Note';
  bool isVisibleSubtitle = false;

// Simpan data Note ke dalam Provider state management
  void saveNoteData(BuildContext context,
      {String title = '', String descNote = ''}) {
    if (title.isNotEmpty && descNote.isNotEmpty) {
      Provider.of<NotesOperation>(context, listen: false)
          .addNewNote(title, descNote);
    } else {
      // Contoh penggunaan Snackbar
      // https://stackoverflow.com/questions/65906662/showsnackbar-is-deprecated-and-shouldnt-be-used
      // https://stackoverflow.com/questions/54955500/flutter-snackbar-dismiss-on-snackbaraction-onpressed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Isi judul dan deskripsi dengan benar'),
          backgroundColor: Colors.black,
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(titlePage),
            Visibility(
              child: Text(
                '',
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              visible: isVisibleSubtitle,
            )
          ],
        ),
        backgroundColor: blueColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              semanticLabel: 'Segarkan halaman',
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15,
                      bottom: 4,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Title',
                            hintStyle: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            titleText = value;
                          },
                          onEditingComplete: () {},
                          keyboardType: TextInputType.text,
                          maxLength: 32,
                        ),
                        // Mode autofill
                        // https://medium.com/swlh/how-to-implement-autofill-in-your-flutter-app-b43bddab1a97
                        TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter description',
                            hintStyle: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            descriptionText = value;
                          },
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please enter description';
                            }
                          },
                          keyboardType: TextInputType.text,
                          maxLength: 140,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Simpan note ke dalam state
                  saveNoteData(context,
                      title: titleText, descNote: descriptionText);
                },
                child: Text(
                  'Add Note',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade700,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
