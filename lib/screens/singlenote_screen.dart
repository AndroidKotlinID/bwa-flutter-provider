import 'package:bwanoteprovider/models/singlenote_operation.dart';
import 'package:bwanoteprovider/models/singlenotedata.dart';
import 'package:flutter/material.dart';
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
  String titleText = '';
  String descriptionText = '';
  bool isVisibleSubtitle = true;

// Mengambil nilai input dari text form field
// https://docs.flutter.dev/cookbook/forms/retrieve-input
  final TextEditingController _textTitleEditingController =
      TextEditingController(text: '');

  final TextEditingController _textDescEditingController =
      TextEditingController(text: '');

  SingleNote singleNoteStateSaved = SingleNote('', '');

  void saveNoteData(BuildContext context,
      {String stringTitle = '', String stringDesc = ''}) {
    if (stringTitle.isNotEmpty && stringDesc.isNotEmpty) {
      // Provider.of<SingleNoteOperation>(context, listen: false)
      //     .addNewNote(judulCatatan: stringTitle, isiCatatan: stringDesc);
      context
          .read<SingleNoteOperation>()
          .addNewNote(judulCatatan: stringTitle, isiCatatan: stringDesc);

      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    } else {
      // Contoh penggunaan Snackbar
      // https://stackoverflow.com/questions/65906662/showsnackbar-is-deprecated-and-shouldnt-be-used
      // https://stackoverflow.com/questions/54955500/flutter-snackbar-dismiss-on-snackbaraction-onpressed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Isi data judul dan deskripsi'),
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
                    hintText: 'Enter title',
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
                    titleText = value;
                  },
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter description';
                    }
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 140,
                  controller: _textTitleEditingController,
                  // textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter title',
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
                    titleText = value;
                  },
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter description';
                    }
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 140,
                  controller: _textTitleEditingController,
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter description here',
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
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter description';
                    }
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 140,
                  controller: _textDescEditingController,
                  // textInputAction: TextInputAction.done,
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
            onPressed: () {
              // saveNoteData(context, stringTitle: titleText, stringDesc: descriptionText);
              saveNoteData(context,
                  stringTitle: _textTitleEditingController.text,
                  stringDesc: _textDescEditingController.text);
            },
            child: Text(
              'Simpan Note',
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange.shade700,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
    _textTitleEditingController.dispose();
    _textDescEditingController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (mounted) {
      setState(() {
        _lastLifecycleState = state;
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void deactivate() {
    WidgetsBinding.instance?.addObserver(this);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    // singleNoteStateSaved =
    //     context.select<SingleNote, SingleNote>((singlenote) => singlenote);
    singleNoteStateSaved =
        Provider.of<SingleNoteOperation>(context, listen: false).getSingleNote;

    String titleData = context.select<SingleNoteOperation, String>(
      (singlenoteoperation) {
        SingleNote singlenoteop = singlenoteoperation.getSingleNote;
        if (singlenoteop.title.isNotEmpty) {
          return singlenoteop.title;
        } else {
          return '';
        }
      },
    );

    String deskripsiData = context.select<SingleNoteOperation, String>(
      (singlenoteoperation) {
        SingleNote singlenoteop = singlenoteoperation.getSingleNote;
        return singlenoteop.description;
      },
    );

    _textTitleEditingController.clear();
    _textTitleEditingController.text = titleData;
    _textDescEditingController.text = deskripsiData;

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
