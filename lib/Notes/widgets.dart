import 'package:flutter/material.dart';
class NoteCard extends StatelessWidget {
  const NoteCard({this.title, this.content,this.press});

  final String title;
  final String content;
  final Function press;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
          child: Column(
            children: [
              Text(
                '$title',
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: .5,
                width: double.infinity,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$content',
                      style: TextStyle(
                          fontSize: 14,
                          wordSpacing: 1.25,
                          letterSpacing: 1),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.delete,color: Colors.red,), onPressed: press)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
