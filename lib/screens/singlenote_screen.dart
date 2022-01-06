import 'package:bwanoteprovider/models/singlenotedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleNoteScreen extends StatefulWidget {
  const SingleNoteScreen({Key? key}) : super(key: key);

  @override
  _SingleNoteScreenState createState() => _SingleNoteScreenState();
}

class _SingleNoteScreenState extends State<SingleNoteScreen>
    with WidgetsBindingObserver {
  AppLifecycleState? _lastLifecycleState;

  String titlePage = 'Add Single Note';
  String subtitlePage = 'Notetaking';
  String descriptionText = '';
  bool isVisibleSubtitle = true;

  void saveNoteData(BuildContext context,
      {stringTitle = '', stringDesc = ''}) {}

  void getNoteData(BuildContext context) {}

  Widget formCreate() {
    return Expanded(
      flex: 1,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 18,
              left: 16,
              right: 16,
              bottom: 10,
            ),
            child: Column(
              children: [
                // Mode autofill
                // https://medium.com/swlh/how-to-implement-autofill-in-your-flutter-app-b43bddab1a97
                // https://stackoverflow.com/questions/50334268/flutter-changing-the-border-color-of-the-outlineinputborder
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter message here',
                    hintStyle: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black54,
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.orange,
                        width: 1.2,
                      ),
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
                  onEditingComplete: () {
                    // cek jika editor selesai dimasukkan
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
    );
  }

  Widget buttonSaved() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Simpan Note',
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange.shade700,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// Memantau lifecycle flutter
// https://api.flutter.dev/flutter/widgets/WidgetsBindingObserver-class.html
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });
    super.didChangeAppLifecycleState(state);
  }

  @override
  void deactivate() {
    WidgetsBinding.instance?.addObserver(this);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              titlePage,
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Visibility(
              child: Text(
                subtitlePage,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              visible: isVisibleSubtitle,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.place,
              color: Colors.white,
              semanticLabel: 'Location Sample',
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            formCreate(),
            buttonSaved(),
            Text('Last state saved notification $_lastLifecycleState'),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
