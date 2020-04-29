import 'package:flutter/material.dart';
import 'package:instagram_clone/models/global.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/models/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            height: 80,
            child: getStories(),
          ),
          Column(
            children: getPosts(),
          ),
        ],
      ),
    );
  }

  Widget getStories() {
    return ListView(
        scrollDirection: Axis.horizontal, children: getUserStories());
  }

  List<Widget> getUserStories() {
    List<Widget> userStories = [];
    for (User followed in user.following) {
      userStories.add(getStory(followed));
    }
    return userStories;
  }

  Widget getStory(User followed) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Column(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundColor:
                        followed.hasStory ? Colors.red : Colors.grey,
                  ),
                ),
                Container(
                  width: 47,
                  height: 47,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
                Container(
                  width: 45,
                  height: 45,
                  child: CircleAvatar(
                    backgroundImage: followed.profilePicture,
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Text(followed.username),
        ],
      ),
    );
  }

  List<Widget> getPosts() {
    List<Widget> posts = [];
    for (Post post in userPosts) {
      posts.add(getPost(post));
    }
    return posts;
  }

  Widget getPost(Post post) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: CircleAvatar(
                      backgroundImage: post.user.profilePicture,
                    ),
                  ),
                  Text(post.user.username),
                ],
              ),
              IconButton(icon: Icon(Icons.more_horiz), onPressed: null),
            ],
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: 285,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(image: post.image, fit: BoxFit.fitWidth),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        size: 30,
                        color: post.isLiked ? Colors.red : Colors.black,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 27,
                          color: post.isLiked ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (post.isLiked == false) {
                              post.isLiked = true;
                              post.likes.add(user);
                            } else {
                              post.isLiked = false;
                              post.likes.remove(user);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  IconButton(icon: Icon(Icons.mode_comment), onPressed: null),
                  IconButton(icon: Icon(Icons.send), onPressed: null),
                ],
              ),
              IconButton(icon: Icon(Icons.bookmark), onPressed: null),
            ],
          ),
          FlatButton(
            child: Text(
              "Gefällt ${post.likes.length} Mal",
              textAlign: TextAlign.start,
              style: textStyleBold,
            ),
            onPressed: () {},
          ),
          Row(
            children: <Widget>[
              Container(
                child: Text(post.user.username, style: textStyleBold),
                margin: EdgeInsets.only(left: 15, right: 10),
              ),
              Text(
                post.description,
                style: textStyle,
              ),
            ],
          ),
          FlatButton(
            child: Text(
              "Alle ${post.comments.length} Kommentare anzeigen",
              textAlign: TextAlign.start,
              style: textStyleLigthGrey,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
