// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_products_view_all_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetProductsViewAllState {
  List<AllProductsResponseProduct> get productsList =>
      throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        initial,
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        loading,
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        success,
    required TResult Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        initial,
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        loading,
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        success,
    TResult? Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        initial,
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        loading,
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        success,
    TResult Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetProductsViewAllStateCopyWith<GetProductsViewAllState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductsViewAllStateCopyWith<$Res> {
  factory $GetProductsViewAllStateCopyWith(GetProductsViewAllState value,
          $Res Function(GetProductsViewAllState) then) =
      _$GetProductsViewAllStateCopyWithImpl<$Res, GetProductsViewAllState>;
  @useResult
  $Res call({List<AllProductsResponseProduct> productsList, bool hasMoreData});
}

/// @nodoc
class _$GetProductsViewAllStateCopyWithImpl<$Res,
        $Val extends GetProductsViewAllState>
    implements $GetProductsViewAllStateCopyWith<$Res> {
  _$GetProductsViewAllStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsList = null,
    Object? hasMoreData = null,
  }) {
    return _then(_value.copyWith(
      productsList: null == productsList
          ? _value.productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as List<AllProductsResponseProduct>,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetProductsViewAllStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AllProductsResponseProduct> productsList, bool hasMoreData});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetProductsViewAllStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsList = null,
    Object? hasMoreData = null,
  }) {
    return _then(_$InitialImpl(
      productsList: null == productsList
          ? _value._productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as List<AllProductsResponseProduct>,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(
      {required final List<AllProductsResponseProduct> productsList,
      required this.hasMoreData})
      : _productsList = productsList;

  final List<AllProductsResponseProduct> _productsList;
  @override
  List<AllProductsResponseProduct> get productsList {
    if (_productsList is EqualUnmodifiableListView) return _productsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsList);
  }

  @override
  final bool hasMoreData;

  @override
  String toString() {
    return 'GetProductsViewAllState.initial(productsList: $productsList, hasMoreData: $hasMoreData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._productsList, _productsList) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productsList), hasMoreData);

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        initial,
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        loading,
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        success,
    required TResult Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        failure,
  }) {
    return initial(productsList, hasMoreData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        initial,
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        loading,
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        success,
    TResult? Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        failure,
  }) {
    return initial?.call(productsList, hasMoreData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        initial,
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        loading,
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        success,
    TResult Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(productsList, hasMoreData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements GetProductsViewAllState {
  const factory Initial(
      {required final List<AllProductsResponseProduct> productsList,
      required final bool hasMoreData}) = _$InitialImpl;

  @override
  List<AllProductsResponseProduct> get productsList;
  @override
  bool get hasMoreData;

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $GetProductsViewAllStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AllProductsResponseProduct> productsList, bool hasMoreData});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GetProductsViewAllStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsList = null,
    Object? hasMoreData = null,
  }) {
    return _then(_$LoadingImpl(
      productsList: null == productsList
          ? _value._productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as List<AllProductsResponseProduct>,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl(
      {required final List<AllProductsResponseProduct> productsList,
      required this.hasMoreData})
      : _productsList = productsList;

  final List<AllProductsResponseProduct> _productsList;
  @override
  List<AllProductsResponseProduct> get productsList {
    if (_productsList is EqualUnmodifiableListView) return _productsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsList);
  }

  @override
  final bool hasMoreData;

  @override
  String toString() {
    return 'GetProductsViewAllState.loading(productsList: $productsList, hasMoreData: $hasMoreData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._productsList, _productsList) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productsList), hasMoreData);

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        initial,
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        loading,
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        success,
    required TResult Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        failure,
  }) {
    return loading(productsList, hasMoreData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        initial,
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        loading,
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        success,
    TResult? Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        failure,
  }) {
    return loading?.call(productsList, hasMoreData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        initial,
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        loading,
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        success,
    TResult Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(productsList, hasMoreData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements GetProductsViewAllState {
  const factory Loading(
      {required final List<AllProductsResponseProduct> productsList,
      required final bool hasMoreData}) = _$LoadingImpl;

  @override
  List<AllProductsResponseProduct> get productsList;
  @override
  bool get hasMoreData;

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $GetProductsViewAllStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AllProductsResponseProduct> productsList, bool hasMoreData});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$GetProductsViewAllStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsList = null,
    Object? hasMoreData = null,
  }) {
    return _then(_$SuccessImpl(
      productsList: null == productsList
          ? _value._productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as List<AllProductsResponseProduct>,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(
      {required final List<AllProductsResponseProduct> productsList,
      required this.hasMoreData})
      : _productsList = productsList;

  final List<AllProductsResponseProduct> _productsList;
  @override
  List<AllProductsResponseProduct> get productsList {
    if (_productsList is EqualUnmodifiableListView) return _productsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsList);
  }

  @override
  final bool hasMoreData;

  @override
  String toString() {
    return 'GetProductsViewAllState.success(productsList: $productsList, hasMoreData: $hasMoreData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._productsList, _productsList) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productsList), hasMoreData);

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        initial,
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        loading,
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        success,
    required TResult Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        failure,
  }) {
    return success(productsList, hasMoreData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        initial,
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        loading,
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        success,
    TResult? Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        failure,
  }) {
    return success?.call(productsList, hasMoreData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        initial,
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        loading,
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        success,
    TResult Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(productsList, hasMoreData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements GetProductsViewAllState {
  const factory Success(
      {required final List<AllProductsResponseProduct> productsList,
      required final bool hasMoreData}) = _$SuccessImpl;

  @override
  List<AllProductsResponseProduct> get productsList;
  @override
  bool get hasMoreData;

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res>
    implements $GetProductsViewAllStateCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String error,
      List<AllProductsResponseProduct> productsList,
      bool hasMoreData});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$GetProductsViewAllStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? productsList = null,
    Object? hasMoreData = null,
  }) {
    return _then(_$FailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      productsList: null == productsList
          ? _value._productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as List<AllProductsResponseProduct>,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements Failure {
  const _$FailureImpl(
      {required this.error,
      required final List<AllProductsResponseProduct> productsList,
      required this.hasMoreData})
      : _productsList = productsList;

  @override
  final String error;
  final List<AllProductsResponseProduct> _productsList;
  @override
  List<AllProductsResponseProduct> get productsList {
    if (_productsList is EqualUnmodifiableListView) return _productsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsList);
  }

  @override
  final bool hasMoreData;

  @override
  String toString() {
    return 'GetProductsViewAllState.failure(error: $error, productsList: $productsList, hasMoreData: $hasMoreData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._productsList, _productsList) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error,
      const DeepCollectionEquality().hash(_productsList), hasMoreData);

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        initial,
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        loading,
    required TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        success,
    required TResult Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)
        failure,
  }) {
    return failure(error, productsList, hasMoreData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        initial,
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        loading,
    TResult? Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        success,
    TResult? Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        failure,
  }) {
    return failure?.call(error, productsList, hasMoreData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        initial,
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        loading,
    TResult Function(
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        success,
    TResult Function(String error,
            List<AllProductsResponseProduct> productsList, bool hasMoreData)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error, productsList, hasMoreData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements GetProductsViewAllState {
  const factory Failure(
      {required final String error,
      required final List<AllProductsResponseProduct> productsList,
      required final bool hasMoreData}) = _$FailureImpl;

  String get error;
  @override
  List<AllProductsResponseProduct> get productsList;
  @override
  bool get hasMoreData;

  /// Create a copy of GetProductsViewAllState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
