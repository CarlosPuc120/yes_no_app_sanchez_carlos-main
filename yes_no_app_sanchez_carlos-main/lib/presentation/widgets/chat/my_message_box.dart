import 'package:flutter/material.dart';
import 'package:yes_no_app_sanchez_carlos/domain/entities/messages.dart';


class MyMessage extends StatelessWidget {
  final Messages message;
  const MyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.time, // Mostrar la hora del mensaje
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.done_all, // Ícono de doble palomita
              color: Colors.blue, // Cambia el color a azul
              size: 14,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}