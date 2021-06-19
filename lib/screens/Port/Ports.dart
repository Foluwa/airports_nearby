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

  @override
  void dispose() {
    dbService.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff21254A),
        appBar: AppBar(
          backgroundColor: Color(0xff21254A),
          title: Text('Ports'),
          actions: [
            CountryListPick(
              appBar: AppBar(
                backgroundColor: Colors.amber,
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
              },
            ),
          ],
        ),
        body: FutureBuilder<List<PortModel>>(
            future: dbService.getTrails(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("/port-details",
                            arguments: snapshot.data[index]);
                      },
                      child: ListTile(
                        title: Text(
                          snapshot.data[index].key,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        leading: Text(
                          snapshot.data[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          snapshot.data[index].tz,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  });
            }));
  }
}
