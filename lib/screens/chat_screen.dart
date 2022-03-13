import 'package:chat_app/widget/auth/chat/message.dart';
import 'package:chat_app/widget/auth/chat/new_message.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chats'),
          actions: [
            DropdownButton(
                underline: Container(),
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                items: [
                  DropdownMenuItem(
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Logout")
                        ],
                      ),
                    ),
                    value: 'Logout',
                  )
                ],
                onChanged: (item) {
                  if (item == 'Logout') {
                    FirebaseAuth.instance.signOut();
                  }
                })
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(child: Messages()),
              NewMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
