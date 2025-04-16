import 'dart:async';

class MyDebouncer {
  MyDebouncer({required this.delay});
  Duration delay;
  Timer? timer;

  void call(Function func) {
    timer?.cancel();
    timer = Timer(delay, () => func());
  }

  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
  }
}
