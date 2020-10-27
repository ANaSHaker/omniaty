import 'package:flutter/material.dart';
import 'package:omnyati/Notes/services/note_provider.dart';

class NewNote extends StatelessWidget {
  NewNote({this.data});

  final NoteData data;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    String title = '';
    String content = '';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'امنية جديده',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 10, bottom: 10),
          child: FloatingActionButton.extended(
            icon: Icon(Icons.add),
            label: Text('اضف امنية'),
            onPressed: () {
              print('$title' '  ' '$content');
              if (_formKey.currentState.validate()) {
                data.addToNotes(title, content);
                Navigator.pop(context);
              }
            },
          )),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      title = text;
                    },
                    decoration: InputDecoration(
                      hintText: "عنوان الامنية",
//                        fillColor: Color(0xFFcedae2),
                      labelStyle: TextStyle(color: Colors.black38  ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      content = text;
                    },
                    maxLines: 20,
                    decoration: InputDecoration(
                      hintText: "وصف الامنيه",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ],
            )),
      ),
    );
  }
}
