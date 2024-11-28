import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rxdart/rxdart.dart';
import 'package:vista_market/src/common/network/models/all_products/all_products_response.dart';
import 'package:vista_market/src/resident/data/repo/products_view_all_repo.dart';

part 'get_products_view_all_state.dart';

class GetProductsViewAllCubit extends Cubit<GetProductsViewAllState> {
  GetProductsViewAllCubit(this._repo)
      : super(
          const GetProductsViewAllStateIntitial(
            hasMoreData: true,
            productsList: [],
          ),
        );
  final ProductsViewAllRepo _repo;
  int offset = 6;

// بيسمح لك بأرسال احداثات و استقبالها
  final _eventController = PublishSubject<void>();

  /// * هو اشتراك يتم من خلاله الاستماع إلى الأحداث التي تأتي من Stream (في هذه الحالة، الـ PublishSubject). *///
  late final StreamSubscription<void> _eventSubscription;

  void init(BuildContext context) {
    _eventSubscription = _eventController
        .exhaustMap((_) => loddedMoreProductsViewAll(context).asStream())
        .listen(
      null,
      onError: (error) {
        emit(
          GetProductsViewAllStateFailure(
            error: error.toString(),
            productsList: state.productsList,
            hasMoreData: state.hasMoreData,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _eventSubscription.cancel();
    _eventController.close();
    return super.close();
  }

  /// Method to add events to the stream
  void loadMoreProducts(BuildContext context) {
    _eventController.add(null);
  }

  Future<void> getProductsViewAll(BuildContext context) async {
    emit(
      const GetProductsViewAllStateLoading(
        hasMoreData: true,
        productsList: [],
      ),
    );
    final result = await _repo.getProductsViewAll(context, offset: 0);
    result.when(
      success: (data) {
        emit(
          GetProductsViewAllStateSuccess(
            hasMoreData: true,
            productsList: data.products,
          ),
        );
      },
      error: (message) {
        emit(
          GetProductsViewAllStateFailure(
            error: message,
            hasMoreData: true,
            productsList: state.productsList,
          ),
        );
      },
    );
  }

  Future<void> loddedMoreProductsViewAll(BuildContext context) async {
    // إذا لم يكن هناك المزيد من البيانات، قم بإيقاف العملية
    if (!state.hasMoreData) return;

    // زيادة الـ offset لتحميل الصفحة التالية
    offset += 6;

    emit(
      GetProductsViewAllStateLoading(
        hasMoreData: state.hasMoreData,
        productsList: state.productsList,
      ),
    );

    final result = await _repo.getProductsViewAll(
      context,
      offset: offset,
    );

    result.when(
      success: (data) {
        // إضافة المنتجات الجديدة إلى القائمة الحالية
        final moreProducts = [...state.productsList, ...data.products];

        // قم بإرسال الحالة الجديدة باستخدام emit
        emit(
          GetProductsViewAllStateSuccess(
            productsList: moreProducts,
            // التحقق من وجود المزيد
            hasMoreData: !(data.products.length < 6),
          ),
        );
      },
      error: (message) {
        emit(
          GetProductsViewAllStateFailure(
            error: message,
            hasMoreData: state.hasMoreData,
            productsList: state.productsList,
          ),
        );
      },
    );
  }

  void handlerPaganation(
    BuildContext context, {
    required ScrollController scrollController,
    required double loadMorePosition,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((time) {
      final offset = scrollController.offset;
      final max = scrollController.position.maxScrollExtent;
      if (offset >= max - loadMorePosition) {
        loddedMoreProductsViewAll(context);
      }
    });
  }
}
