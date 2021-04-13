import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearby/utils/dbUtils.dart';

class Port extends StatefulWidget {
  @override
  _PortState createState() => _PortState();
}

class _PortState extends State<Port> {
  dbSql sql;

  @override
  void initState() {
    super.initState();
    sql = dbSql();
    sql.init().then((_) => print('completed building db'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21254A),
      appBar: AppBar(
        backgroundColor: Color(0xff21254A),
        title: Text('Ports'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[Text('Ports')],
          ),
        ),
      ),
    );
  }
}
