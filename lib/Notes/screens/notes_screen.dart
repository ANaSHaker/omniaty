import 'package:flutter/material.dart';
import 'package:omnyati/Notes/services/note_provider.dart';

import 'package:provider/provider.dart';

import '../widgets.dart';
import 'edit_note.dart';
import 'new_note.dart';

class NotesScreen extends StatelessWidget {
  final Color black = Color(0xFF1e2022);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (BuildContext context, noteData, Widget child) {
        return Scaffold(
          backgroundColor:    Theme.of(context).brightness == Brightness.dark ? Colors.grey[800]: Color(0xFFFFEDE0),

          appBar: AppBar(
            title: Text(
              'امنياتي',
              style: TextStyle(color: Colors.white),
            ),

          ),
          floatingActionButton: Padding(
              padding: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return NewNote(
                      data: noteData,
                    );
                  }));
                },
                child: Icon(Icons.add),
              )),
          body: CustomScrollView(
            slivers: [

              SliverPadding(padding: EdgeInsets.all(10)),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final note = noteData.notes[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return EditNote(
                          data: noteData,
                          note: note,
                        );
                      }));
                    },
                    onLongPress: () {
                      showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text(
                              'Delete?',
                              style: TextStyle(color: Color(0xFF49565e)),
                            ),
                            actions: [
                              FlatButton(
                                  child: Text(
                                    'YES',
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                  onPressed: () {
                                    noteData.removeFromNotes(note.id);
                                    Navigator.pop(context);
                                  }),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'CANCEL',
                                    style: TextStyle(color: Color(0xFF49565e)),
                                  ))
                            ],
                          ));
                      //                      noteData.removeFromNotes(note.id);
                    },
                    child: NoteCard(
                      title: note.title,
                      content: note.content,
                      press: (){
                        showDialog(
                            context: context,
                            child: AlertDialog(
                              title: Text(
                                'Delete?',
                                style: TextStyle(color: Color(0xFF49565e)),
                              ),
                              actions: [
                                FlatButton(
                                    child: Text(
                                      'YES',
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                    onPressed: () {
                                      noteData.removeFromNotes(note.id);
                                      Navigator.pop(context);
                                    }),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'CANCEL',
                                      style: TextStyle(color: Color(0xFF49565e)),
                                    ))
                              ],
                            ));
                      },
                    ),
                  );
                }, childCount: noteData.notes.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ],
          ),
        );
      },
    );
  }
}
