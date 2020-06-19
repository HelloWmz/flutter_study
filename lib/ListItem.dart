import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  String mList;

  ListItem(String item){
    this.mList=item;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 96,
          width: 96,
          margin: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/pic.png',
                    ),
                  ),
                ),
              ),
              Container(
                width: 32,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xFF000000),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Text(
                  "景区",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          height: 96,
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "无锡鼋头渚分景区",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF303133),
                  ),
                ),
              )),
              Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "3.5分#${mList}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFF7455),
                        ),
                      ))),
              Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "距离您1.18公里 14号来广营地铁站",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF606266),
                        ),
                      ))),
              Expanded(
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "￥",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFFF7455),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(2, 0, 1, 0),
                            child: Text(
                              "600.00",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFFF7455),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "起",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF606266),
                            ),
                          )
                        ],
                      )))
            ],
          ),
        ))
      ],
    );
  }
}
