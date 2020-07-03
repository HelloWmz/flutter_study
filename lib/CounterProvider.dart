import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier{
   int totalNum=16;
   int itemNum=4;
   changeNum(totalNum ,itemNum){
     this.totalNum=totalNum;
     this.itemNum=itemNum;
     notifyListeners();
   }
}