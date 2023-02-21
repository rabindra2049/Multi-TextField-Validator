# validator_without_cubit
Demonstration of validating required form fields.
## Getting Started

I present a demonstration of a multi-form field validator that does not require any state management library.

To accomplish this, I created a WidgetValidator to register all the necessary fields from the form page. Initially, the widget is set to false, and after successful validation, I update the widget to true. All key-value pairs are stored in a HashMap, and on every field change listener, I check whether all field key value validations are true. If all required fields are validated, the ValidationSuccess method is called; otherwise, ValidationFalse is called.

At the view level, I change the color of the floating icon based on the validation status.

First, initialize the Widget Validator by creating an instance of it:

`WidgetValidator _widgetValidator = WidgetValidator(this);`

Next, register the form fields that are required for validation using the registerWidgetForValidation() method:

`_widgetValidator.registerWidgetForValidation(lastNameKey)`

Then, on the onChanged event of a form field, if the specified condition is met, update the corresponding key using the `updateWidgetState()` method:

`if (RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    _widgetValidator.updateWidgetState(lastNameKey, true);
    } else {
    _widgetValidator.updateWidgetState(lastNameKey, false);
    }
`

Finally, once all the fields are validated, the `onAllWidgetValidationSuccess()` method will be called; otherwise, `onAllWidgetValidationFailed()` will be called.