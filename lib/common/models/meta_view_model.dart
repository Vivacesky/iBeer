import 'package:equatable/equatable.dart';
import 'package:i_beer/common/common.dart';

class MetaViewModel extends Equatable {
  final int count;
  final int totalCount;

  const MetaViewModel({
    required this.count,
    required this.totalCount,
  });

  @override
  List<Object> get props => [
        count,
        totalCount,
      ];

  factory MetaViewModel.orThrow({
    required int? count,
    required int? totalCount,
  }) {
    return MetaViewModel(
      count: validateNotNull('count', count),
      totalCount: validateNotNull('totalCount', totalCount),
    );
  }
}
