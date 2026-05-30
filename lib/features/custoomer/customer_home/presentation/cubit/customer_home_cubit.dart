import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterrush/core/helpers/helpers.dart';

import '../../domain/usecases/get_sliders_usecase.dart';

import 'customer_home_state.dart';

class CustomerHomeCubit extends Cubit<CustomerHomeState> {
  CustomerHomeCubit({
    required this.bannerCount,
    required this.getSlidersUseCase,
  }) : super(CustomerHomeState.initial()) {
    _startAutoSlide();
    getSliders();
  }

  final GetSlidersUseCase getSlidersUseCase;

  final int bannerCount;
  final PageController bannerController = PageController();
  Timer? _autoSlideTimer;

  void _startAutoSlide() {
    Helpers.cancelTimer(_autoSlideTimer);
    _autoSlideTimer = Helpers.startAutoPageSlider(
      controller: bannerController,
      itemCount: state.sliders.isNotEmpty ? state.sliders.length : bannerCount,
      currentIndex: () => state.currentBannerIndex,
    );
  }

  void onBannerChanged(int index) {
    emit(state.copyWith(currentBannerIndex: index));
  }

  Future<void> getSliders() async {
    emit(state.copyWith(slidersStatus: CustomerHomeStatus.loading));
    final result = await getSlidersUseCase();
    result.fold(
      (failure) => emit(state.copyWith(
        slidersStatus: CustomerHomeStatus.initial,
        message: failure.message,
      )),
      (sliders) {
        emit(state.copyWith(
          slidersStatus: CustomerHomeStatus.success,
          sliders: sliders,
        ));
        _startAutoSlide(); // restart auto slide with real slider count
      },
    );
  }

  Future<void> reorderLastOrder() async {
    if (state.status == CustomerHomeStatus.loading) return;
    emit(state.copyWith(status: CustomerHomeStatus.loading, message: ''));
    await Future<void>.delayed(const Duration(milliseconds: 700));
    emit(
      state.copyWith(
        status: CustomerHomeStatus.success,
        message: 'Last order added to cart',
      ),
    );
  }

  void clearStatus() {
    emit(state.copyWith(status: CustomerHomeStatus.initial, message: ''));
  }

  @override
  Future<void> close() {
    Helpers.cancelTimer(_autoSlideTimer);
    bannerController.dispose();
    return super.close();
  }
}
