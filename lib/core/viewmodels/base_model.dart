import 'package:flutter/widgets.dart';
import 'package:compound/core/enums/viewstate.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

}
