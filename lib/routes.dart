import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearby/screens/Port/Ports.dart';
import 'package:nearby/screens/PortDetails/PortDetails.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting args for navigator.pushNamed
    final args = settings.arguments;
    print("Route information: ${settings.name}");
    switch (settings.name) {
      case '/':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: Port());
      case '/port-details':
        return MaterialPageRoute(
            builder: (_) => PortDetails(portDetails: args));
      case '/signin':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: PortDetails());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error Page'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
