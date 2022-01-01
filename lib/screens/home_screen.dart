import 'package:bwanoteprovider/screens/notes_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bwanoteprovider/themedata.dart';
import 'package:provider/provider.dart';
import 'package:bwanoteprovider/models/notes_operation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesOperation>(
      create: (context) => NotesOperation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note Homescreen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: blueColor,
            secondary: Colors.orange,
          ),
        ),
        home: const Homepage(),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String titleHomepage = 'Daftar Catatan';
  String subtitleHomepage = 'BWA Notes';
  bool isVisibleSubtitle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(titleHomepage),
            Visibility(
              child: Text(
                subtitleHomepage,
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
              Icons.help,
              color: Colors.white,
              semanticLabel: 'Icon bantuan',
            ),
          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman yang lain
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: Colors.red.shade700,
      ),
      body: SafeArea(
        child: Scrollbar(
          // Daftar diambil dengan menggunakan state management Provider
          child: Consumer<NotesOperation>(
            builder: (context, NotesOperation datanote, child) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NotesCard(note: datanote.getNotes[index]);
                },
                itemCount: datanote.getNotes.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
