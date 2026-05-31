import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/error/failure.dart';
import 'package:waterrush/features/custoomer/customer_offers/domain/usecases/get_promo_codes_usecase.dart';
import 'package:waterrush/features/custoomer/customer_offers/presentation/cubit/offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  final GetPromoCodesUseCase getPromoCodesUseCase;

  OffersCubit({required this.getPromoCodesUseCase}) : super(OffersInitial());

  Future<void> getPromoCodes() async {
    emit(OffersLoading());
    final result = await getPromoCodesUseCase();
    result.fold(
      (Failure failure) => emit(OffersError(failure.message)),
      (promoCodes) => emit(OffersLoaded(promoCodes)),
    );
  }
}
