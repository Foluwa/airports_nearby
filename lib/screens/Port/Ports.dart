import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearby/models/Port.dart';
import 'package:nearby/utils/db_service.dart';

class Port extends StatefulWidget {
  @override
  _PortState createState() => _PortState();
}

class _PortState extends State<Port> {
  final dbService = DatabaseService();
  Future _countries;

  @override
  void dispose() {
    dbService.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // initial load
    _countries = dbService.getTrails();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff21254A),
      appBar: AppBar(
        backgroundColor: Color(0xff21254A),
        title: Text('Ports'),
        actions: [
          CountryListPick(
            appBar: AppBar(
              backgroundColor: Color(0xff21254A),
              title: Text('Pick your country'),
            ),
            theme: CountryTheme(
              isShowFlag: true,
              isShowTitle: true,
              isShowCode: false,
              isDownIcon: true,
              showEnglishName: true,
            ),
            initialSelection: '+234',
            // or
            // initialSelection: 'US'
            onChanged: (CountryCode code) {
              print(code.name);
              print(code.code);
              print(code.dialCode);
              print(code.flagUri);
              Future<List<PortModel>> data = dbService.sortbyCountry(code.code);
              setState(() {
                _countries = data;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<PortModel>>(
            future: _countries,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return (snapshot.data.isEmpty)
                  ? Center(
                      child: Text(
                      'Empty',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ))
                  : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed("/port-details",
                                  arguments: snapshot.data[index]);
                            },
                            child: ListTile(
                              leading: Image.asset(
                                  'icons/flags/png/${snapshot.data[index].country.toLowerCase()}.png',
                                  package: 'country_icons'),
                              title: Text(
                                '${snapshot.data[index].name} ${snapshot.data[index].state}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                  '${snapshot.data[index].city}/${snapshot.data[index].state}/ ${snapshot.data[index].country}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              trailing:
                                  Icon(Icons.play_arrow, size: height * 0.02),
                            ),
                          ),
                        );
                      });
            }),
      ),
      //TODO: Add tab to settings page
    );
  }
}
