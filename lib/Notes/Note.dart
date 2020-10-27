import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'screens/notes_screen.dart';
import 'services/note_provider.dart';



class Note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        NoteData noteData = NoteData();
        noteData.getNotes();
        return noteData;
      },
      child: NotesScreen(),

    );
  }
}