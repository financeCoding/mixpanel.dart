library mixpanel;

import 'dart:js';

class Mixpanel {
  dynamic get _mixpanel => context['mixpanel'];

  bool get isAvailable => _mixpanel != null;

  void track(String eventName, [Map properties]) {
    if (isAvailable) {
      if (properties != null) {
        _mixpanel.callMethod('track', [eventName, new JsObject.jsify(properties)]);
      } else {
        _mixpanel.callMethod('track', [eventName]);
      }
    }
  }
}
