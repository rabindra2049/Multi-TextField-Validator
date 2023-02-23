import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_state.dart';

/// Cubit that handles the validation of the form data
class FormValidationCubit<T extends FormzInput> extends Cubit<FormzStatus> {
  FormValidationCubit(Map<String, T> formFields) : super(_validate(formFields));

  /// Validates the form fields and returns the current status
  static FormzStatus _validate<T extends FormzInput>(
      Map<String, T> formFields) {
    return Formz.validate(formFields.values.toList());
  }

  /// Updates the form fields and emits a new validation status
  void updateFields(Map<String, T> formFields) {
    emit(_validate(formFields));
  }
}

/// Cubit that handles the state of a set of Formz input fields.
class GenericFormFieldCubit<T extends FormzInput>
    extends Cubit<GenericFormFieldState<T>> {
  /// Cubit that handles the validation of the form data
  final FormValidationCubit<T> validationCubit;

  GenericFormFieldCubit(Map<String, T> formFields)
      : validationCubit = FormValidationCubit<T>(formFields),
        super(GenericFormFieldState<T>(formFields: formFields)) {
    // Subscribe to validationCubit changes and update the state accordingly
    validationCubit.stream.listen((status) {
      emit(state.copyWith(status: status));
    });
  }

  /// Update the value of a field in the form
  /// @param fieldName: the key of the field to update
  /// @param fieldValue: the new value to set for the field
  void updateField(String fieldName, T fieldValue) {
    /// Create a copy of the current fields map with the updated field
    final updatedFields = Map<String, T>.from(state.formFields);
    updatedFields[fieldName] = fieldValue;

    /// Update the validationCubit with the new fields
    validationCubit.updateFields(updatedFields);

    /// Update the state with the new fields
    emit(state.copyWith(formFields: updatedFields));
  }
}