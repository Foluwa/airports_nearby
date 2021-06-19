class PortModel {
  String key;
  String icao;
  String iata;
  String name;
  String state;
  String country;
  String elevation;
  String lat;
  String lon;
  String tz;
  PortModel({
    this.key,
    this.icao,
    this.iata,
    this.name,
    this.state,
    this.country,
    this.elevation,
    this.lat,
    this.lon,
    this.tz,
  });

  factory PortModel.fromJson(Map<String, dynamic> port) {
    print('PORT IS $port');
    return PortModel(
      key: port['_key'],
      icao: port['icao'],
      iata: port['icao'],
      name: port['icao'] ?? '',
      state: port['icao'],
      country: port['icao'],
      elevation: port['icao'],
      lat: port['icao'],
      lon: port['icao'],
      tz: port['tz'],
    );
  }
}
