import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_state.dart';

/// Generic Cubit Class that handles the state of a set of Formz input fields.
/// Accepts a map of initial form field values in its constructor, and initializes the state of the Cubit with this map.
class GenericFormFieldCubit<T extends FormzInput>
    extends Cubit<GenericFormFieldState<T>> {
  GenericFormFieldCubit(Map<String, T> formFields)
      : super(GenericFormFieldState<T>(formFields: formFields));

  /// Update the value of a field in the form
  /// @param fieldName: the key of the field to update
  /// @param fieldValue: the new value to set for the field
  void updateField(String fieldName, T fieldValue) {
    /// Create a copy of the current fields map with the updated field
    final updatedFields = Map<String, T>.from(state.formFields);
    updatedFields[fieldName] = fieldValue;

    /// Validate the updated fields and emit a new state with the updated fields and status
    emit(state.copyWith(
      formFields: updatedFields,
      status: Formz.validate(updatedFields.values.toList()),
    ));
  }
}
