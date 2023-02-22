import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit/cubit/formField/form_based_form_field_state.dart';
import 'package:validator_with_cubit/validator/models/email_input_field.dart';
import 'package:validator_with_cubit/validator/models/generic_input_field.dart';
import 'package:validator_with_cubit/validator/models/username_input_field.dart';
class FormFieldCubit extends Cubit<FormBasedFormFieldState> {
  FormFieldCubit() : super(const FormBasedFormFieldState());

  void updateEmail(String email) {
    // Create a new email field with the provided email
    final emailField = EmailInputField.dirty(email);

    // Emit the updated state to notify the listeners
    emit(state.copyWith(
      // Update the email field of the state with the new email field
      email: emailField,
      // Validate the entire form
      status: Formz.validate([state.name, emailField, state.mobileNumber]),
    ));
  }

  void remarksChanged(String value) {
    final remarks = value;
    emit(state.copyWith(
      remarks: remarks,
    ));
  }

  void updateUserName(String name,
      {String? errorMessage,
      String? requiredMessage,
      String? minValue,
      String? maxValue}) {
    final nameField = UserNameInputField.custom(name,
        errorMessage: errorMessage,
        requiredMessage: requiredMessage,
        minValue: minValue,
        maxValue: maxValue);

    emit(state.copyWith(
      name: nameField,
      status: Formz.validate([nameField, state.email, state.mobileNumber]),
    ));
  }

  void updateMobileNumber(String mobileNumber) {
    final mobileField = GenericInputField.dirty(mobileNumber);
    emit(state.copyWith(
      mobileNumber: mobileField,
      status: Formz.validate([state.name, state.email, mobileField]),
    ));
  }
}
