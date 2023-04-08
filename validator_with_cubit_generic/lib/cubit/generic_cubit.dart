import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validator_with_cubit_generic/cubit/generic_cubit_state.dart';

//
class GenericCubit<T> extends Cubit<GenericCubitState<T>> {
  GenericCubit() : super(GenericCubitState.none());
}
