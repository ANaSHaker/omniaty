import 'package:flutter/material.dart';
import 'package:omnyati/Blog/db/post_service.dart';
import 'package:omnyati/Blog/models/post.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostView extends StatefulWidget {
  final Post post;

  PostView(this.post);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.post.title,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // backgroundColor: Color(0xffc8d9ff),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.post.body,
                    style: TextStyle(fontSize: 16.0),
                  ),
                )),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
                    child: Text(
                      "Published:" +
                          timeago.format(DateTime.fromMillisecondsSinceEpoch(
                              widget.post.date)),
                      style: TextStyle(
                        fontSize: 14.0,
                        // color: Color(0xff133337),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),

    );
  }
}
