import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoggingRouteObserver extends AutoRouteObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _logRoute('PUSH', previousRoute, route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _logRoute('POP', route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _logRoute('REMOVE', previousRoute, route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _logRoute('REPLACE', oldRoute, newRoute);
  }

  @override
  void didChangeTop(Route<dynamic> topRoute, Route<dynamic>? previousTopRoute) {
    super.didChangeTop(topRoute, previousTopRoute);
    _logRoute('TOP CHANGE', previousTopRoute, topRoute);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    super.didChangeTabRoute(route, previousRoute);
    _logTab('TAB CHANGE', previousRoute, route);
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    super.didInitTabRoute(route, previousRoute);
    _logTab('TAB INIT', previousRoute, route);
  }

  void _logRoute(String action, Route<dynamic>? from, Route<dynamic>? to) {
    debugPrint('[ROUTE] $action: ${_routeName(from)} → ${_routeName(to)}');
  }

  void _logTab(String action, TabPageRoute? from, TabPageRoute? to) {
    debugPrint('[TAB] $action: ${from?.name ?? 'null'} → ${to?.name ?? 'null'}');
  }

  String _routeName(Route<dynamic>? route) {
    if (route == null) return 'null';
    return route.settings.name ?? route.runtimeType.toString();
  }
}
