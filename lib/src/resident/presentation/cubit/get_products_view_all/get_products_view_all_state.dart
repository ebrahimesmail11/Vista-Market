part of 'get_products_view_all_cubit.dart';

abstract class GetProductsViewAllState extends Equatable {
  const GetProductsViewAllState({
    required this.productsList,
    required this.hasMoreData,
  });
  final List<AllProductsResponseProduct> productsList;
  final bool hasMoreData;
  @override
  List<Object> get props => [productsList, hasMoreData];
}
class GetProductsViewAllStateIntitial extends GetProductsViewAllState {
  const GetProductsViewAllStateIntitial({
    required super.productsList,
    required super.hasMoreData,
  });
}

class GetProductsViewAllStateLoading extends GetProductsViewAllState {
  const GetProductsViewAllStateLoading({
    required super.productsList,
    required super.hasMoreData,
  });
}

class GetProductsViewAllStateSuccess extends GetProductsViewAllState {
  const GetProductsViewAllStateSuccess({
    required super.productsList,
    required super.hasMoreData,
  });
}

class GetProductsViewAllStateFailure extends GetProductsViewAllState {
  const GetProductsViewAllStateFailure({
    required super.productsList,
    required super.hasMoreData,
    required this.error,
  });
  final String error;
  @override
  List<Object> get props => [error];
}
