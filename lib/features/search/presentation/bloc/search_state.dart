import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';

class SearchState extends Equatable {
   final String keyword;
  final StateStatus<List<ProductEntity>> searchStatus;

   const SearchState({
    this.keyword = '',
    this.searchStatus = const StateStatus.initial(),
  });

  SearchState copyWith({
    String? keyword,
    StateStatus<List<ProductEntity>>? searchStatus,
  }) {
    return SearchState(
      keyword: keyword ?? this.keyword,
      searchStatus: searchStatus ?? this.searchStatus,
    );
  }

  @override
  List<Object?> get props => [
    keyword,
    searchStatus,
  ];
}
