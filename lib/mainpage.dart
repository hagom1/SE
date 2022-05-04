// import 'dart:html';
import 'package:flutter_quill/flutter_quill.dart' as Binsolve;
import 'package:flutter/material.dart';
import 'package:newprojectbin/calendarevent.dart';
import 'package:newprojectbin/main.dart';
// import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'diarypage.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //달력 이벤트
  late Map<DateTime, List<calendarevent>> selectedEvents;
  TextEditingController _eventController = TextEditingController();

  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<calendarevent> getEventsfromday(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }
  //

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // 메뉴바
        backgroundColor: Colors.grey[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/gucci.jpg'),
                backgroundColor: Colors.white,
              ),
              accountName: Text('구찌'),
              accountEmail: Text('avan31017@gmail.com'),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20), //밑 둥글게
                      bottomRight: Radius.circular(20))),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[800],
              ),
              title: Text('설정'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.grey[800],
              ),
              title: Text('로그아웃'),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 10,
        title: Text('일기장'),
        centerTitle: true,
      ),
      // 테이블 캘린더
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            focusedDay: focusedDay,
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format){
              setState(() {
                format = _format;
              });
            },

            //이벤트

            eventLoader: getEventsfromday,


            onDaySelected: (DateTime selectDay, DateTime focusDay){
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusDay);
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            //날짜 클릭 이벤트
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
          ),
          ...getEventsfromday(selectedDay).map((calendarevent event) => ListTile(
            title: Text(event.title),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()
    { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>diary()), //일기페이지 이동
                  );
        },
    //     => showDialog(
    //         context: context,
    //         builder: (context) => AlertDialog(
    //               title: Text('일기쓰기'),
    //               content: TextFormField(
    //                 controller: _eventController,
    //               ),
    //               actions: [
    //                 TextButton(
    //                   child: Text('취소'),
    //                   onPressed: () => Navigator.pop(context),
    //                 ),
    //                 TextButton(
    //                   child: Text('확인'),
    //                   onPressed: () {
    //                     if (_eventController.text.isEmpty) {
    //
    //                     }
    //                     else{
    //                       if(selectedEvents[selectedDay] != null){
    //                         selectedEvents[selectedDay]?.add(
    //                           calendarevent(title: _eventController.text)
    //                         );
    //                       }
    //                       else{
    //                         selectedEvents[selectedDay] = [
    //                           calendarevent(title: _eventController.text)
    //                         ];
    //                       }
    //                     }
    //                     Navigator.pop(context);
    //                     _eventController.clear();
    //                     setState(() {});
    //                     return;
    //                   },
    //                 ),
    //               ],
    //             )),
        label: Text('쓰기'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: (){
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context)=>diary()), //일기페이지 이동
      //     );
      //   },
      //   label: Text('쓰기'),
      //   icon: Icon(Icons.add),
      //   backgroundColor: Colors.blue[900],
      // ),
    );
  }
}

//메뉴바 로그아웃 버튼 기능
void logout(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        shape: RoundedRectangleBorder(
            // 알림창 라운드 처리
            borderRadius: BorderRadius.circular(8.0)),
        title: Text("알림"),
        content: Text("로그아웃 하시겠습니까?"),
        actions: <Widget>[
          new FlatButton(
            child: Text("예"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          new FlatButton(
            child: Text('아니오'),
            onPressed: () {
              Navigator.pop(context); //알림창 끄기
            },
          )
        ],
      );
    },
  );
}

