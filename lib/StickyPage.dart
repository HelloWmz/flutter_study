import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'Databean.dart';

class StickyPage extends StatefulWidget {
  @override
  _stickyPageState createState() => new _stickyPageState();
}

class _stickyPageState extends State<StickyPage> {
  List mFriends;
  ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mFriends = mListFriends;
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black45,
      appBar: new AppBar(
        title: new Text('sticky_headers'),
      ),
      body: _getFriend(mFriends, scrollController),
    );
  }

  _getFriend(List mFriends, controller) {
    return ListView.builder(
        controller: controller,
        shrinkWrap: true,
        itemCount: mFriends.length,
        itemBuilder: (context, index) {
          return StickyHeader(
            header: Container(
              height: 30,
              decoration: BoxDecoration(color: Colors.pink),
              width: MediaQuery.of(context).size.width,
              child: Text(
                mFriends[index]["groud"],
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            content: _getItemFriends(controller, mFriends[index]["itemList"]),
          );
        });
  }

  _getItemFriends(controller, List data) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        controller: controller,
        itemBuilder: (context, index) {
          return Container(
           margin: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: NetworkImage(data[index]["avatarUrl"]),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data[index]["userName"],
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(data[index]["desc"],
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                )
              ],
            ),
          );
        });
  }
}
