import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'makeid.dart';
import 'mainpage.dart';

void main(){
  runApp(MyApp());

  // runApp(MyButtonApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'first app', //앱을 총칭하는 이름
        home: MyHomePage(
        )

    );
  }
}

//로그인 페이지

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false, //키보드 겹침 에러 해결문장
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('로그인 페이지'), //appbar에서 출력되는 이름
          centerTitle: true,
          backgroundColor: Colors.grey,
          elevation: 10, //appbar 입체감
        ),
        body:Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 50), // 텍스트필드들 위치
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ID',
                    labelStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    hintText: 'Enter your id',
                    // enabledBorder: OutlineInputBorder( //텍스트필드 외곽선
                    //     borderRadius: BorderRadius.all(Radius.circular(15)),
                    //   borderSide: BorderSide( color: Colors.grey, ),
                    // )
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    hintText: 'Enter your password',
                    // enabledBorder: OutlineInputBorder( //텍스트필드 외곽선
                    //   borderRadius: BorderRadius.all(Radius.circular(15)),
                    //   borderSide: BorderSide( color: Colors.grey, ),
                    // )

                  ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>MainPage()), //회원가입 페이지 이동
                  );
                },
                  child: Text('로그인'),
                ),
                TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>MyId()), //회원가입 페이지 이동
                  );
                },
                  child: Text('회원가입'),
                ),
              ],
            )

        )
    );
  }
}

