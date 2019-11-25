import 'package:flutter/widgets.dart';

class NuvigatorLogObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("[Nuvigator] Route Pushed(didPush): "
        "(Pushed Route='${route?.settings?.name}', "
        "Previous Route='${previousRoute?.settings?.name}', "
        "Pushed Route Args=${route?.settings?.arguments}, "
        "Previous Route Args=${previousRoute?.settings?.arguments}"
        ")");
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);

    print("[Nuvigator] Route Popped(didPop): "
        "(New Route='${previousRoute?.settings?.name}', "
        "Popped Route='${route?.settings?.name}', "
        "New Route Args=${previousRoute?.settings?.arguments}, "
        "Popped Route Args=${route?.settings?.arguments}"
        ")");
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    print("[Nuvigator] Route Replaced(didReplace): "
        "(New Route='${newRoute?.settings?.name}', "
        "Reaplaced Route='${oldRoute?.settings?.name}', "
        "Reaplaced Route Args=${oldRoute?.settings?.arguments}"
        "New Route Arguments=${newRoute?.settings?.arguments}"
        ")");
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);

    print("[Nuvigator] Route Removed(didRemove): "
        "(New Route='${previousRoute?.settings?.name}', "
        "Removed Route='${route?.settings?.name}', "
        "New Route Args=${previousRoute?.settings?.arguments}, "
        "Removed Route Args=${route?.settings?.arguments}"
        ")");
  }
}
