import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearby/models/Port.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
      appBar: AppBar(
        title: Text("SlidingUpPanelExample"),
      ),
      body: SlidingUpPanel(
          panel: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.arrow_drop_up,
                    color: Colors.yellow,
                    size: 50,
                  ),
                  Text('Ports Details'),
                  Text(
                    widget.portDetails.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(widget.portDetails.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  Text(widget.portDetails.elevation,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  Text(widget.portDetails.lat,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  Text(
                    widget.portDetails.state,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: <Widget>[
              Center(
                child: Text(
                    "GOOGLE MAPS: This is the Widget behind the sliding panel"),
              ),
              SlidingUpPanel(
                panel: Center(
                  child: Text("SSSSSSS>>>>>"),
                ),
              )
            ],
          )),
    );
  }
}
