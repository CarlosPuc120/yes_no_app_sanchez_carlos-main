import 'package:flutter/material.dart';
import 'package:yes_no_app_sanchez_carlos/domain/entities/messages.dart';


class SongokuMessage extends StatelessWidget {

  final Messages message;

  const SongokuMessage({super.key, required this.message});

  

 @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color:  Colors.green,
            borderRadius: BorderRadius.circular(20)
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          ),
        ),

        const SizedBox(height: 15),

        //imagen 
         _iamgebuble(message.imageUrl!),
         const SizedBox(height: 20),
        

      ],
    );
  }
}

class _iamgebuble extends StatelessWidget {

  final String imageUrl;

  const _iamgebuble( this.imageUrl );

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(borderRadius: BorderRadius.circular(20),
    child: Image.network(imageUrl,
    width: size.width * 0.7, height: 150, fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      
      if (loadingProgress == null) return child;

      return Container(
        width: size.width * 0.7,
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: const Text('Songoku is sending a gif'),
      );
      
    },),

    );
  }
}