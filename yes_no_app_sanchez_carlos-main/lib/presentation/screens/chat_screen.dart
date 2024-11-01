import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_sanchez_carlos/domain/entities/messages.dart';
import 'package:yes_no_app_sanchez_carlos/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_sanchez_carlos/presentation/widgets/chat/goku_message.dart';
import 'package:yes_no_app_sanchez_carlos/presentation/widgets/chat/my_message_box.dart';
import 'package:yes_no_app_sanchez_carlos/presentation/widgets/share/message_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Son goku 💗'),
        leading: const Padding(
          padding: EdgeInsets.all(1.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMWEzyu7nty-C8Z4kVwNcxHE5mQSfT33l0fA&s'),
          ),
        ),
      ),
      body: _chatview(),
    );
  }
}

class _chatview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   final chatprovider = context.watch<ChatProvider>(); 

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child:ListView.builder(
              controller: chatprovider.chatScrollcontroler,
              itemCount: chatprovider.message.length,
              itemBuilder: (context, index) {
                final message = chatprovider.message[index];
              
                return (message.fromWho == FromWho.AMLOs)
                  ? SongokuMessage(message: message)
                  : MyMessage(message: message,); 
            },)),
        
             MessageBox(
              onValue: (value) => chatprovider.sendMessage(value),
             )
          ],
        ),
      ),
    );
  }
}