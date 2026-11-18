import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/entities/wishlist_response_entity.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/use_case/add_to_wishList_use_case.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/use_case/get_wishlist_use_case.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/use_case/remove_from_wishlist_use_case.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_event.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final AddToWishlistUseCase _addToWishlistUseCase;
  final GetWishlistUseCase _getWishlistUseCase;
  final RemoveFromWishlistUseCase _removeFromWishlistUseCase;
  WishlistBloc(
    this._addToWishlistUseCase,
    this._getWishlistUseCase,
    this._removeFromWishlistUseCase,
  ) : super(WishlistState()) {
    on<AddToWishlistEvent>(_addToWishlist);
    on<GetWishlistEvent>(_getWishlist);
    on<RemoveFromWishlistEvent>(_removeFromWishlist);
  }

  _addToWishlist(AddToWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(addToWishlistStatus: StateStatus.loading()));

    final result = await _addToWishlistUseCase.call(event.productId);

    switch (result) {
      case SuccessResult<void>():
        emit(
          state.copyWith(addToWishlistStatus: StateStatus.success(result.data)),
        );
      case ErrorResult<void>():
        emit(
          state.copyWith(
            addToWishlistStatus: StateStatus.failure(result.failure),
          ),
        );
    }
  }

  _getWishlist(GetWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(getWishlistStatus: StateStatus.loading()));

    final result = await _getWishlistUseCase.call();

    switch (result) {
      case SuccessResult<WishlistResponseEntity>():
        emit(
          state.copyWith(getWishlistStatus: StateStatus.success(result.data)),
        );
      case ErrorResult<WishlistResponseEntity>():
        emit(
          state.copyWith(
            getWishlistStatus: StateStatus.failure(result.failure),
          ),
        );
    }
  }

  _removeFromWishlist(
    RemoveFromWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(removeFromWishlistStatus: StateStatus.loading()));

    final result = await _removeFromWishlistUseCase.call(event.productId);

    switch (result) {
      case SuccessResult<void>():
        emit(
          state.copyWith(
            removeFromWishlistStatus: StateStatus.success(result.data),
          ),
        );
      case ErrorResult<void>():
        emit(
          state.copyWith(
            removeFromWishlistStatus: StateStatus.failure(result.failure),
          ),
        );
    }
  }
}
