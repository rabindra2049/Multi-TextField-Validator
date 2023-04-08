import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validator_with_cubit_generic/cubit/generic_cubit_state.dart';
import 'package:validator_with_cubit_generic/cubit/generic_search_cubit.dart';
import 'package:validator_with_cubit_generic/di.dart';
import 'package:validator_with_cubit_generic/extension/context_extensions.dart';
import 'package:validator_with_cubit_generic/extension/number_extensions.dart';
import 'package:validator_with_cubit_generic/models/generic_model.dart';

class GenericListBottomSheetDialog {
  final List<GenericModel> genericModelList;
  final BuildContext context;
  final Function(GenericModel selectedData) onDataSelected;

  static const _borderRadius = BorderRadius.vertical(
    top: Radius.circular(15),
  );

  const GenericListBottomSheetDialog({
    required this.genericModelList,
    required this.context,
    required this.onDataSelected,
  });

  void showBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: _borderRadius,
      ),
      context: context,
      builder: _buildBottomSheet,
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GenericSearchCubit>()
        ..initSearchListData(genericModelList),
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
                6.heightSizedBox,
                BlocBuilder<GenericSearchCubit,
                    GenericCubitState<List<GenericModel>>>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            onDataSelected(state.data![index]);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: context.screenWidth,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${state.data?[index].title}",
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
