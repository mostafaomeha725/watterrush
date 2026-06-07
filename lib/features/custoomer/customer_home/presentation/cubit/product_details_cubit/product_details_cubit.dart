import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/features/custoomer/customer_home/domain/usecases/get_product_details_usecase.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit({
    required this.productId,
    required this.getProductDetailsUseCase,
  }) : super(ProductDetailsState.initial()) {
    getProductDetails();
  }

  final int productId;
  final GetProductDetailsUseCase getProductDetailsUseCase;

  Future<void> getProductDetails() async {
    emit(state.copyWith(status: ProductDetailsStatus.loading));
    final result = await getProductDetailsUseCase(productId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductDetailsStatus.failure,
          message: failure.message,
        ),
      ),
      (product) {
        emit(
          state.copyWith(
            status: ProductDetailsStatus.success,
            product: product,
          ),
        );
      },
    );
  }
}
