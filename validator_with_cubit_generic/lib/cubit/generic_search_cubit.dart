import 'package:validator_with_cubit_generic/cubit/generic_cubit.dart';
import 'package:validator_with_cubit_generic/cubit/generic_cubit_state.dart';
import 'package:validator_with_cubit_generic/models/generic_model.dart';

class GenericSearchCubit extends GenericCubit<List<GenericModel>> {
  /// Initializes the search list data with the provided `genericSearchModel`.
  /// Sets the state to loading first and then sets it to data with the result.
  Future<void> initSearchListData(List<GenericModel> genericSearchModel) async {
    emit(GenericCubitState.loading()); // set the state to loading
    try {
      emit(GenericCubitState.success(
          genericSearchModel)); // set the state to data with the result
    } catch (error) {
      emit(GenericCubitState.failure(
          error.toString())); // set the state to error with the error message
    }
  }
}
