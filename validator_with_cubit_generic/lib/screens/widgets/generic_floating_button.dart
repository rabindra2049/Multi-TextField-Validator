import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/form/generic_form_field_cubit.dart';
import 'package:validator_with_cubit_generic/cubit/form/generic_form_field_state.dart';

class GenericFloatingButton extends StatelessWidget {
  final BuildContext context;
  final String _buttonID;

  final Function(BuildContext rootContext,
      GenericFormFieldState<FormzInput<dynamic, dynamic>> state) onPressed;

  const GenericFloatingButton(this.context, this._buttonID,
      {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericFormFieldCubit, GenericFormFieldState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: SizedBox(
              height: 56,
              width: 56,
              child: FloatingActionButton(
                elevation: 0,
                key: Key(_buttonID),
                backgroundColor: state.status.isValidated
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant.withOpacity(0.5),

                // backgroundColor: ThemeColor.colorPrimaryDark.getColor,
                onPressed: () {
                  onPressed(context, state);
                },
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  weight: 10,
                ),
              )),
        );
      },
    );
  }
}
