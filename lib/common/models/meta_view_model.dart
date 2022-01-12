import 'package:equatable/equatable.dart';
import 'package:i_beer/common/common.dart';

class MetaViewModel extends Equatable {
  final int count;
  final int totalCount;
  final String type;

  const MetaViewModel({
    required this.count,
    required this.totalCount,
    required this.type,
  });

  @override
  List<Object> get props => [
        count,
        totalCount,
        type,
      ];

  factory MetaViewModel.orThrow({
    required int? count,
    required int? totalCount,
    required String? type,
  }) {
    return MetaViewModel(
      count: validateNotNull('count', count),
      totalCount: validateNotNull('totalCount', totalCount),
      type: validateNotNull('type', type),
    );
  }
}
