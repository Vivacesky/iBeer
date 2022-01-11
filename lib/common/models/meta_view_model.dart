import 'package:equatable/equatable.dart';
import 'package:i_beer/common/common.dart';

class MetaViewModel extends Equatable {
  final int id;
  final int name;

  const MetaViewModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [
        id,
        name,
      ];

  factory MetaViewModel.orThrow({
    required int? id,
    required int? name,
  }) {
    return MetaViewModel(
      id: validateNotNull('id', id),
      name: validateNotNull('name', name),
    );
  }
}
