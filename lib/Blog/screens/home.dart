
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:omnyati/Blog/routing/route_constant.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/post.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "posts";
  List<Post> postsList = <Post>[];
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  bool swithValue = false;
  Query postQuery;

  @override
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childChanged);
    postQuery = _database.reference().child('posts');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:    Theme.of(context).brightness == Brightness.dark ? Colors.grey[800]: Color(0xFFFFEDE0),

      key: _globalKey,
      appBar: AppBar(
        title: Text("مشاركة امنياتي"),
        centerTitle: true,


      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Visibility(
              visible: postsList.isEmpty,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:300.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("لا مشاركات بعد",style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: postsList.isNotEmpty,
              child: Flexible(
                child: FirebaseAnimatedList(
                    query: postQuery,
                    itemBuilder: (_, DataSnapshot snap,
                        Animation<double> animation, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 5.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteConstant.VIEW_POST,
                                arguments: postsList[index]);
                          },
                          child: Card(
                              elevation: 4.0,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [

                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          postsList[index].title,
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      postsList[index].body.length > 30 ? '${ postsList[index].body.substring(0, 30)}...' :  postsList[index].body,
                                      style: TextStyle(
                                      ),

                                    )
                                  ],
                                ),
                              )),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:40.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, RouteConstant.ADD_POST);
          },
          icon: Icon(
            Icons.add,
          ),
          label: Text("اضف مشاركتك"),
        ),
      ),
    );
  }

  _childAdded(Event event) {
    setState(() {
      postsList.add(Post.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoves(Event event) {
    var deletedPost = postsList.singleWhere((post) {
      return post.key == event.snapshot.key;
    });

    setState(() {
      postsList.removeAt(postsList.indexOf(deletedPost));
    });
  }

  void _childChanged(Event event) {
    var changedPost = postsList.singleWhere((post) {
      return post.key == event.snapshot.key;
    });
    setState(() {
      postsList[postsList.indexOf(changedPost)] =
          Post.fromSnapshot(event.snapshot);
    });
  }
}
