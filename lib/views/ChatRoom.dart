import 'package:chat_app/services/auth.dart';
import 'package:chat_app/views/SignIn.dart';
import 'package:chat_app/widgets/BottomSheetFeedback.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods _authMethods = AuthMethods();

  _handleSignOut() {
    _authMethods.signOut().then((value) {
      BottomSheetFeedback.showSuccess(context, 'Sukses', 'Logout berhasil');
      Future.delayed(const Duration(milliseconds: 2000), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      });
    }).catchError((error) {
      BottomSheetFeedback.showError(context, 'Error', error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                _handleSignOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
