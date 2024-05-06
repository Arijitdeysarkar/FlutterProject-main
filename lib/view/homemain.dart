import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homemain extends StatefulWidget {
  const homemain({super.key});

  @override
  State<homemain> createState() => _homemainState();
}

class _homemainState extends State<homemain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("demo"),
      ),
      body: IconButton(onPressed: () {  }, icon:const Icon(Icons.logout,color: Colors.lightGreen,)),
    );
  }
}
