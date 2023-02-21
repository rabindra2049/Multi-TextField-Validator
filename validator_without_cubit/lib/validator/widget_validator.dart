import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:validator_without_cubit/validator/widget_validator_listener.dart';

class WidgetValidator {
  final WidgetValidatorListener? _widgetValidatorListener;
  final Map<GlobalKey, bool> _widgetList = {};

  WidgetValidator(this._widgetValidatorListener);

  /// Add the given widget to the list of widgets to validate.
  /// @param widgetId - the global key of the text field widget
  void registerWidgetForValidation(GlobalKey widgetId) {
    _widgetList[widgetId] = false;
  }

  /// Update the state of the given widget and check if all widgets are validated.
  /// @param widgetId - the global key of the text field widget being updated
  /// @param state - a boolean value indicating the current validation state of the text field.
  ///               `true` if the text field is currently in a validated state, `false` otherwise.
  void updateWidgetState(GlobalKey widgetId, bool state) {
    int count = 0;
    if (_widgetList.containsKey(widgetId)) {
      _widgetList[widgetId] = state;
    }
    for (bool widgetState in _widgetList.values) {
      if (widgetState) {
        count++;
      }
    }
    if (count == _widgetList.length) {
      _widgetValidatorListener?.onAllWidgetValidationSuccess();
    } else {
      _widgetValidatorListener?.onAllWidgetValidationFailed();
    }
  }
}
