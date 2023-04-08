import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:validator_with_cubit_generic/cubit/form/generic_form_field_cubit.dart';
import 'package:validator_with_cubit_generic/cubit/generic_search_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => GenericFormFieldCubit<FormzInput>({}));

  getIt.registerFactory(
    () => GenericSearchCubit(),
  );
}
