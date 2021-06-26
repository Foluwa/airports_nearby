import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
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
      backgroundColor: Color(0xff21254A),
      // appBar: AppBar(
      //   title: Text("Airport Details"),
      //   backgroundColor: Color(0xff21254A),
      // ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel_rounded, color: Colors.pink),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Airport Details"),
        backgroundColor: Color(0xff21254A),
      ),
      body: SlidingUpPanel(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          panel: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_drop_up,
                      color: Colors.pink,
                      size: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.portDetails.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          ", ${widget.portDetails.country}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(widget.portDetails.elevation,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Row(
                      children: [
                        Text(widget.portDetails.lat,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        Text(','),
                        Text(widget.portDetails.lon,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    Text(
                      widget.portDetails.state,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.portDetails.icao,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.portDetails.iata,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: <Widget>[
              FlutterMap(
                options: new MapOptions(
                  center: new LatLng(double.parse(widget.portDetails.lat),
                      double.parse(widget.portDetails.lon)),
                  zoom: 13.0,
                ),
                layers: [
                  new TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  new MarkerLayerOptions(
                    markers: [
                      new Marker(
                        width: 80.0,
                        height: 80.0,
                        point: new LatLng(double.parse(widget.portDetails.lat),
                            double.parse(widget.portDetails.lon)),
                        builder: (ctx) => new Container(
                            child: Icon(
                          Icons.location_on,
                          color: Colors.pink,
                          size: 30.0,
                          semanticLabel: widget.portDetails.name,
                          //'Text to announce in accessibility modes',
                        )),
                      ),
                    ],
                  ),
                ],
              ),
              // SlidingUpPanel(
              //   panel: Center(
              //     child: Text("SSSSSSS>>>>>"),
              //   ),
              // )
            ],
          )),
    );
  }
}
