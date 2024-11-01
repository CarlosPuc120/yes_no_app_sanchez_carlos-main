import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {

  final  ValueChanged<String> onValue;

  const MessageBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();


    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputdecoration = InputDecoration(
        hintText: 'End your message with a "??"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffix: IconButton(
          icon: const Icon( Icons.send_outlined),
          onPressed: (){ 
            final Textvalue = textController.value.text;
            onValue(Textvalue);

          },
        )
      );
      return TextFormField(
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        focusNode: focusNode,
        controller: textController,
        decoration: inputdecoration,
        onFieldSubmitted: (value){ 
          onValue(value);
          textController.clear();
          focusNode.requestFocus();
         },
        
      );
  }
}