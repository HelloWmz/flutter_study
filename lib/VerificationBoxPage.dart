import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_box/verification_box.dart';

class VerificationBoxPage extends StatefulWidget {
  @override
  _VerificationBoxPageState createState() => new _VerificationBoxPageState();
}

class _VerificationBoxPageState extends State<VerificationBoxPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('验证码输入框'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: 100,
        child:Column(
          children: <Widget>[
            Container(
                alignment: Alignment.center, color: Colors.red, child: Text("ddd")),
            SizedBox(height: 10,),
            Center(
                child: Container(
                  height: 50,
                  child: VerificationBox(
                    count: 4,
                    borderColor: Colors.black12,
                    borderWidth: 3,
                    borderRadius: 5,
                    showCursor: true,
                    cursorWidth: 2,
                    cursorColor: Colors.lightBlue,
                    cursorIndent: 10,
                    cursorEndIndent: 10,
                    textStyle: TextStyle(color: Colors.lightBlue),
                    unfocus: true,
                    onSubmitted: (value) {
                      print('$value');
                    },
                  ),
                )),

          ],
        )
   ,
      ),

    );
  }
}
