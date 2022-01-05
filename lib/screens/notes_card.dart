import 'package:bwanoteprovider/models/notedata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
        bottom: 5,
        left: 10,
        right: 10,
      ),
      padding: const EdgeInsets.all(15),
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title,
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            note.description,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
