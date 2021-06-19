import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearby/models/Port.dart';

class PortDetails extends StatefulWidget {
  final PortModel portDetails;

  PortDetails({this.portDetails});

  @override
  _PortDetailsState createState() => _PortDetailsState();
}

class _PortDetailsState extends State<PortDetails> {
  @override
  Widget build(BuildContext context) {
    print('${widget.portDetails.country}');
    print('widget.State ${widget.portDetails.state}');
    print('widget.Country ${widget.portDetails.country}');
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
            children: <Widget>[
              Text('Ports Details'),
              Text(
                widget.portDetails.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(widget.portDetails.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              Text(widget.portDetails.elevation,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              Text(widget.portDetails.lat,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              Text(
                widget.portDetails.state,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
