import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as Binsolve;
import 'mainpage.dart';
import 'package:newprojectbin/calendarevent.dart';

class diary extends StatefulWidget {
  const diary({Key? key}) : super(key: key);

  @override
  State<diary> createState() => _diaryState();
}

class _diaryState extends State<diary> {
  Binsolve.QuillController _controller = Binsolve.QuillController.basic();
  // TextEditingController _eventController2 = TextEditingController();

  // @override
  // void dispose() {
  //   _eventController2.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 10,
        title: Text('일기'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Binsolve.QuillToolbar.basic(controller: _controller),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: TextFormField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                hintText: '제목',
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    1.0,
                    5.0,
                  ),
                  blurRadius: 1.5,
                  spreadRadius: 10.0,
                ),
              ]),
              child: Binsolve.QuillEditor.basic(
                  controller: _controller, readOnly: false),
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // if (_eventController2.text.isEmpty) {
          // } else {
          //   if (selectedEvents[selectedDay] != null) {
          //     selectedEvents[selectedDay]
          //         ?.add(calendarevent(title: _eventController2.text));
          //   } else {
          //     selectedEvents[selectedDay] = [
          //       calendarevent(title: _eventController2.text)
          //     ];
          //   }
          // }
          // Navigator.pop(context);
          // _eventController2.clear();
          // setState(() {});
          // return;


          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context)=>MainPage()),
          // );
        },
        label: Text('저장'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
