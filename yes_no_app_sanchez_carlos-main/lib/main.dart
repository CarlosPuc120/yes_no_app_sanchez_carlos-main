import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_sanchez_carlos/config/theme/app_theme.dart';
import 'package:yes_no_app_sanchez_carlos/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_sanchez_carlos/presentation/screens/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {  

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yes or NO App',
        theme: AppTheme().theme(),
        home: const ChatScreen()
      ),
    );
  }


}



       