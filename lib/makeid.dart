import 'package:flutter/material.dart';

//회원가입 페이지
class MyId extends StatelessWidget {
  const MyId({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('회원가입'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ID',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  hintText: '아이디(이메일 주소)',

                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  hintText: '비밀번호',

                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'PASSWORD CHECK',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  hintText: '비밀번호 확인',

                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'NAME',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  hintText: '이름',

                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'PHONE NUMBER',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  hintText: '전화번호',

                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
                makedid(context);
              }
                  , child: Text('가입'))
            ],
          ),
        ),
      ),
    );
  }
}

void makedid(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        shape: RoundedRectangleBorder(   // 알림창 라운드 처리
            borderRadius: BorderRadius.circular(8.0)
        ),
        title: Text("알림"),
        content: Text("회원가입 완료"),
        // contentTextStyle: TextStyle(
        //
        // ),

        actions: <Widget>[
          new FlatButton(
            child: Text("확인"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}