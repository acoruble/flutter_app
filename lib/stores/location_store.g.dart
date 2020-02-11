// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationStore on _LocationStore, Store {
  final _$locationAtom = Atom(name: '_LocationStore.location');

  @override
  LatLng get location {
    _$locationAtom.context.enforceReadPolicy(_$locationAtom);
    _$locationAtom.reportObserved();
    return super.location;
  }

  @override
  set location(LatLng value) {
    _$locationAtom.context.conditionallyRunInAction(() {
      super.location = value;
      _$locationAtom.reportChanged();
    }, _$locationAtom, name: '${_$locationAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }
}
