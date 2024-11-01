
import 'package:flutter/material.dart';
import 'package:yes_no_app_sanchez_carlos/config/theme/helpers/yes_no_answer.dart';
import 'package:yes_no_app_sanchez_carlos/domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier{
  
  final ScrollController chatScrollcontroler = ScrollController();
  final GetYesNoanswer getYesNoanswer = GetYesNoanswer();

  List<Messages> message = [
    Messages(text: 'Buen dia', fromWho: FromWho.mine),
    Messages(text: 'hola', fromWho: FromWho.mine)
  ];

  Future<void> sendMessage(String text) async{ 
    
    final newMessage = Messages(text: text, fromWho: FromWho.mine);
    message.add(newMessage);

    if (text.endsWith('?')){ 
       amloReply();
     }
    notifyListeners();
    moveScrollToBottom();

   }


  Future<void> amloReply() async { 
    final AMLOMessage = await getYesNoanswer.getAnswer();
    message.add(AMLOMessage);
    notifyListeners();
    moveScrollToBottom();

   }

  void moveScrollToBottom(){ 

    chatScrollcontroler.animateTo(
      //extender el scroll lo maximo que se mueva
    chatScrollcontroler.position.maxScrollExtent,
    duration: const Duration(seconds: 1), 
    curve: Curves.easeOut);

  }


}