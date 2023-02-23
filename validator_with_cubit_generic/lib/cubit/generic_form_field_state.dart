import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_form_field_state.freezed.dart';

/// Store the state of form field
/// Has two properties, @param `formFields` which is a map of form field values with keys as the name of the fields,
/// and @param  `status` which is the status of the overall form.
@freezed
abstract class GenericFormFieldState<T extends FormzInput>
    with _$GenericFormFieldState<T> {
  const factory GenericFormFieldState({
    required Map<String, T> formFields,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _GenericFormFieldState<T>;
}
