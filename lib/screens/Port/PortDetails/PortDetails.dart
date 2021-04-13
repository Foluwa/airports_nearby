import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PortDetails extends StatefulWidget {
  @override
  _PortDetailsState createState() => _PortDetailsState();
}

class _PortDetailsState extends State<PortDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21254A),
      appBar: AppBar(
        backgroundColor: Color(0xff21254A),
        title: Text('Port Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[Text('Ports Details')],
          ),
        ),
      ),
    );
  }
}
