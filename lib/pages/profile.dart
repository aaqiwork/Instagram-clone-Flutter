import 'package:flutter/material.dart';
import 'package:instagram/models/global.dart';
import 'package:instagram/models/post.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.menu,
                size: 20,
                color: Colors.black,
              ),
            ),
          ],
          backgroundColor: Colors.white,
          title: Row(children:[Text(
            user.username,
            style: TextStyle(color: Colors.black),
          ),
          Icon(Icons.arrow_drop_down, color:Colors.black)
          ],
        ),),
        body: Container(
          constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height - 168),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:20,left:20,right:20),
                height: 250,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: CircleAvatar(
                              backgroundImage: user.profilePicture,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              user.username,
                              style: textStyleBold,
                            ),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 68,
                                      right: 20,
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '129',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('posts')
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '129K',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('followers')
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '129',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('following')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("I am a profile on instagram"),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 30,
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                      width: 1, color: Color(0xFFE7E7E7))),
                              child: FlatButton(
                                child: Text('Edit Profile'),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            width: 60,
                            child: Icon(Icons.add),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://lapol0.s3.amazonaws.com/media/None/luxury-cars-lapolo.jpg'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://ceoworld.biz/wp-content/uploads/2019/06/La-Voiture-Noire-BUGATTI.jpg'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://i2-prod.insider.co.uk/incoming/article9878684.ece/ALTERNATES/s615/The-Bentley-Continental-GT3R-Hero.jpg'),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                color: Colors.white,
              ),
              Divider(),
              Container(
                height: 35,
                color: Colors.white,
                child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Icon(Icons.grid_on,size: 30,),
                  Icon(Icons.live_tv,size: 30,),
                  Icon(Icons.account_circle,size: 30,),
                ],)
              ),
              Divider(),
              Column(
                children: getPosts(),
              )
            ],
          ),
        ));
  }

  List<Widget> getPosts() {
    List<Widget> postRows = [];
    List<Widget> posts = [];
    int counter = 0;
    for (Post post in userPosts) {
      double marginLeft = 2;
      if (counter == 3) {
        marginLeft = 0;
      } else if (counter == 0) {
        marginLeft = 0;
      }
      posts.add(getPost(post, marginLeft));
      if (counter == 2) {
        postRows.add(Container(
          child: Row(
            children: posts,
          ),
        ));
        posts = [];
        counter = 0;
      } else {
        counter++;
      }
    }
    if (posts.length > 0) {
      postRows.add(Container(
        child: Row(
          children: posts,
        ),
      ));
    }
    return postRows;
  }

  Widget getPost(Post post, double margin) {
    return Container(
      // margin: EdgeInsets.only(left: margin, bottom: 2),
      height: 125,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          image: DecorationImage(image: post.image, fit: BoxFit.fill)),
    );
  }
}
