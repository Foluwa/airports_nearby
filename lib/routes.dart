import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/onboarding.dart';
import 'screens/port_details.dart';
import 'screens/ports.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting args for navigator.pushNamed
    final args = settings.arguments;
    print('Route information: ${settings.name}');
    switch (settings.name) {
      case '/onboarding':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: const OnboardingUI());
      case '/':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: const Port());
      case '/port-details':
        return MaterialPageRoute(
            builder: (_) => PortDetails(portDetails: args));
      case '/signin':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: const PortDetails());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error Page'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
