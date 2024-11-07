import 'package:flutter/material.dart';
import 'package:yes_no_app_sanchez_carlos/config/theme/helpers/yes_no_answer.dart';
import 'package:yes_no_app_sanchez_carlos/domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier {
  
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoanswer getYesNoanswer = GetYesNoanswer();

  List<Messages> messages = [
    Messages(text: 'Buen día', fromWho: FromWho.mine),
    Messages(text: 'Hola', fromWho: FromWho.mine)
  ];

  Future<void> sendMessage(String text) async { 
    if (text.trim().isEmpty) return; // Evita enviar mensajes vacíos o solo espacios

    final newMessage = Messages(text: text, fromWho: FromWho.mine);
    messages.add(newMessage);
    print('Cantidad de mensajes: ${messages.length}'); // Imprime la cantidad de mensajes

    if (text.endsWith('?')) { 
      await amloReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> amloReply() async { 
    final SongokuMessage = await getYesNoanswer.getAnswer();
    messages.add(SongokuMessage);
    print('Cantidad de mensajes: ${messages.length}'); // Imprime la cantidad de mensajes
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() { 
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1), 
      curve: Curves.easeOut,
    );
  }
}
