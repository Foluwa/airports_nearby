# nearby

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Airports
========

https://restcountries.eu/rest/v2/alpha/ng

https://pub.dev/packages/flutter_map

https://pub.dev/packages/simple_location_picker

A JSON database of 28828 entries with basic information about nearly every airport and landing strip in the world. ICAO codes used as primary value. Each entry contains IATA code, airport name, city, two letter ISO country code, elevation above sea level in feet, coordinates in decimal degrees and time zone.

```json
"KOSH": {
    "icao": "KOSH",
    "iata": "OSH",
    "name": "Wittman Regional Airport",
    "city": "Oshkosh",
    "state": "Wisconsin",
    "country": "US",
    "elevation": 808,
    "lat": 43.9844017029,
    "lon": -88.5569992065,
    "tz": "America\/Chicago"
},
```

Time zones sourced from [TimeZoneDB](https://timezonedb.com).
