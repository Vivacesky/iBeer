import 'package:equatable/equatable.dart';
import 'package:i_beer/common/common.dart';

class BaseResponseViewModel<T> extends Equatable {
  final MetaViewModel meta;
  final T data;

  const BaseResponseViewModel({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [
        meta,
        data,
      ];

  factory BaseResponseViewModel.orThrow({
    required MetaViewModel? meta,
    required T? data,
  }) {
    return BaseResponseViewModel(
      meta: validateNotNull('meta', meta),
      data: validateNotNull('data', data),
    );
  }
}
