class PortModel {
  String key;
  String icao;
  String iata;
  String name;
  String state;
  String city;
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
    this.city,
    this.lon,
    this.tz,
  });

  factory PortModel.fromJson(Map<String, dynamic> port) {
    return PortModel(
      key: port['_key'],
      icao: port['icao'],
      iata: port['iata'],
      name: port['name'],
      city: port['city'],
      state: port['state'],
      country: port['country'],
      elevation: port['elevation'],
      lat: port['lat'],
      lon: port['lon'],
      tz: port['tz'],
    );
  }
}
