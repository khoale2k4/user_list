// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page) fetchUserList,
    required TResult Function(String userId) fetchUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page)? fetchUserList,
    TResult? Function(String userId)? fetchUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page)? fetchUserList,
    TResult Function(String userId)? fetchUserDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchUserList value) fetchUserList,
    required TResult Function(FetchUserDetail value) fetchUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchUserList value)? fetchUserList,
    TResult? Function(FetchUserDetail value)? fetchUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchUserList value)? fetchUserList,
    TResult Function(FetchUserDetail value)? fetchUserDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchUserListImplCopyWith<$Res> {
  factory _$$FetchUserListImplCopyWith(
          _$FetchUserListImpl value, $Res Function(_$FetchUserListImpl) then) =
      __$$FetchUserListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? page});
}

/// @nodoc
class __$$FetchUserListImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$FetchUserListImpl>
    implements _$$FetchUserListImplCopyWith<$Res> {
  __$$FetchUserListImplCopyWithImpl(
      _$FetchUserListImpl _value, $Res Function(_$FetchUserListImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_$FetchUserListImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FetchUserListImpl implements FetchUserList {
  const _$FetchUserListImpl({this.page});

  @override
  final int? page;

  @override
  String toString() {
    return 'UserEvent.fetchUserList(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUserListImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchUserListImplCopyWith<_$FetchUserListImpl> get copyWith =>
      __$$FetchUserListImplCopyWithImpl<_$FetchUserListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page) fetchUserList,
    required TResult Function(String userId) fetchUserDetail,
  }) {
    return fetchUserList(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page)? fetchUserList,
    TResult? Function(String userId)? fetchUserDetail,
  }) {
    return fetchUserList?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page)? fetchUserList,
    TResult Function(String userId)? fetchUserDetail,
    required TResult orElse(),
  }) {
    if (fetchUserList != null) {
      return fetchUserList(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchUserList value) fetchUserList,
    required TResult Function(FetchUserDetail value) fetchUserDetail,
  }) {
    return fetchUserList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchUserList value)? fetchUserList,
    TResult? Function(FetchUserDetail value)? fetchUserDetail,
  }) {
    return fetchUserList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchUserList value)? fetchUserList,
    TResult Function(FetchUserDetail value)? fetchUserDetail,
    required TResult orElse(),
  }) {
    if (fetchUserList != null) {
      return fetchUserList(this);
    }
    return orElse();
  }
}

abstract class FetchUserList implements UserEvent {
  const factory FetchUserList({final int? page}) = _$FetchUserListImpl;

  int? get page;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchUserListImplCopyWith<_$FetchUserListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchUserDetailImplCopyWith<$Res> {
  factory _$$FetchUserDetailImplCopyWith(_$FetchUserDetailImpl value,
          $Res Function(_$FetchUserDetailImpl) then) =
      __$$FetchUserDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$FetchUserDetailImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$FetchUserDetailImpl>
    implements _$$FetchUserDetailImplCopyWith<$Res> {
  __$$FetchUserDetailImplCopyWithImpl(
      _$FetchUserDetailImpl _value, $Res Function(_$FetchUserDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$FetchUserDetailImpl(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchUserDetailImpl implements FetchUserDetail {
  const _$FetchUserDetailImpl(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'UserEvent.fetchUserDetail(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUserDetailImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchUserDetailImplCopyWith<_$FetchUserDetailImpl> get copyWith =>
      __$$FetchUserDetailImplCopyWithImpl<_$FetchUserDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? page) fetchUserList,
    required TResult Function(String userId) fetchUserDetail,
  }) {
    return fetchUserDetail(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? page)? fetchUserList,
    TResult? Function(String userId)? fetchUserDetail,
  }) {
    return fetchUserDetail?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? page)? fetchUserList,
    TResult Function(String userId)? fetchUserDetail,
    required TResult orElse(),
  }) {
    if (fetchUserDetail != null) {
      return fetchUserDetail(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchUserList value) fetchUserList,
    required TResult Function(FetchUserDetail value) fetchUserDetail,
  }) {
    return fetchUserDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchUserList value)? fetchUserList,
    TResult? Function(FetchUserDetail value)? fetchUserDetail,
  }) {
    return fetchUserDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchUserList value)? fetchUserList,
    TResult Function(FetchUserDetail value)? fetchUserDetail,
    required TResult orElse(),
  }) {
    if (fetchUserDetail != null) {
      return fetchUserDetail(this);
    }
    return orElse();
  }
}

abstract class FetchUserDetail implements UserEvent {
  const factory FetchUserDetail(final String userId) = _$FetchUserDetailImpl;

  String get userId;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchUserDetailImplCopyWith<_$FetchUserDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
