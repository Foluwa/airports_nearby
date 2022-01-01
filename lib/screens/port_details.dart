import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../models/port.dart';
import '../utils/constants.dart';

class PortDetails extends StatefulWidget {
  final PortModel portDetails;

  const PortDetails({Key key, this.portDetails}) : super(key: key);

  @override
  _PortDetailsState createState() => _PortDetailsState();
}

class _PortDetailsState extends State<PortDetails> {
  @override
  Widget build(BuildContext context) {
    debugPrint('${widget.portDetails.country}');
    debugPrint('widget.State ${widget.portDetails.state}');
    debugPrint('widget.Country ${widget.portDetails.country}');
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
          title: const Text('Port Details'),
          backgroundColor: Constants.primaryColor),
      body: SlidingUpPanel(
        maxHeight: 300,
        minHeight: 50,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        panel: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.arrow_drop_up,
                    color: Constants.secondaryColor,
                    size: 50,
                  ),
                  ListTile(
                    title: Text(
                      '${widget.portDetails.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.black,
                        fontSize: 20,
                      ),
                    ),
                    isThreeLine: true,
                    subtitle: Text(
                      'Timezone: ${widget.portDetails.tz} \n State: ${widget.portDetails.state}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.black,
                      ),
                    ),
                    // leading: Icon(Icons.label),
                    trailing: Text(
                      '${widget.portDetails.country}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.black,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.black,
                        fontSize: 20,
                      ),
                    ),
                    // subtitle: Text(
                    //   'Timezone: ${widget.portDetails.tz}',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     color: Constants.black,
                    //   ),
                    // ),
                    subtitle: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Latitude: ${widget.portDetails.lat}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Constants.black,
                                ),
                              ),
                              Text(
                                'Latitude: ${widget.portDetails.lon}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Constants.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    trailing: Text(
                      'ICAO ${widget.portDetails.icao}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => MapsLauncher.launchCoordinates(
                      double.parse(widget.portDetails.lat),
                      double.parse(widget.portDetails.lon),
                      widget.portDetails.name,
                    ),
                    child: const Text('OPEN IN MAPS'),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            FlutterMap(
              options: MapOptions(
                center: LatLng(
                  double.parse(widget.portDetails.lat),
                  double.parse(widget.portDetails.lon),
                ),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(
                        double.parse(widget.portDetails.lat),
                        double.parse(widget.portDetails.lon),
                      ),
                      builder: (ctx) => Icon(
                        Icons.location_on,
                        color: Constants.secondaryColor,
                        size: 30.0,
                        semanticLabel: widget.portDetails.name,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
