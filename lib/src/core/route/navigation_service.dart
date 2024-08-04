import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? to(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic>? toWithParameters(String routeName, {required Object args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  Future<dynamic> replace(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  void popUntil(int length) {
    int count = 0;
    navigatorKey.currentState!.popUntil((_) => count++ >= length);
  }

  Future<dynamic> replaceWithParameters(String routeName,
      {required Object args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  void back() {
    return navigatorKey.currentState!.pop();
  }

  void backWithParameters({required Object args}) {
    return navigatorKey.currentState!.pop(args);
  }

  Future<Object?> clearAllTo(String routeName, {String? predicate}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => predicate == null ? false : route.settings.name == predicate,
    );
  }

  Future<Object?> clearAllToWithParameters(String routeName,
      {required Object args, String? predicate}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => predicate == null ? false : route.settings.name == predicate,
      arguments: args,
    );
  }
}

final navigationService = Provider((ref) => NavigationService());
