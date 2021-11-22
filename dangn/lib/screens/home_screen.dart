import 'package:dangn/states/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('FEED',style:Theme.of(context).appBarTheme.titleTextStyle),
        
        actions: [
          IconButton(
              onPressed: () {
                context.read<UserProvider>().setUserAuth(false);
              },
              icon: Icon(CupertinoIcons.nosign)),
          IconButton(
              onPressed: () {
                context.read<UserProvider>().setUserAuth(false);
              },
              icon: Icon(CupertinoIcons.search)),
         IconButton(
              onPressed: () {
                context.read<UserProvider>().setUserAuth(false);
              },
              icon: Icon(CupertinoIcons.text_justify)),              
        ],
      ),
    
    );
  }
}
