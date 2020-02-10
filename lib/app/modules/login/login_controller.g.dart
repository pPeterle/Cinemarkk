// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  Computed<bool> _$isButtonRegisterValidComputed;

  @override
  bool get isButtonRegisterValid => (_$isButtonRegisterValidComputed ??=
          Computed<bool>(() => super.isButtonRegisterValid))
      .value;
  Computed<dynamic> _$isButtonLoginValidComputed;

  @override
  dynamic get isButtonLoginValid => (_$isButtonLoginValidComputed ??=
          Computed<dynamic>(() => super.isButtonLoginValid))
      .value;

  final _$emailAtom = Atom(name: '_LoginBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_LoginBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$confirmPasswordAtom = Atom(name: '_LoginBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.context.enforceReadPolicy(_$confirmPasswordAtom);
    _$confirmPasswordAtom.reportObserved();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.context.conditionallyRunInAction(() {
      super.confirmPassword = value;
      _$confirmPasswordAtom.reportChanged();
    }, _$confirmPasswordAtom, name: '${_$confirmPasswordAtom.name}_set');
  }

  final _$registerErrorAtom = Atom(name: '_LoginBase.registerError');

  @override
  String get registerError {
    _$registerErrorAtom.context.enforceReadPolicy(_$registerErrorAtom);
    _$registerErrorAtom.reportObserved();
    return super.registerError;
  }

  @override
  set registerError(String value) {
    _$registerErrorAtom.context.conditionallyRunInAction(() {
      super.registerError = value;
      _$registerErrorAtom.reportChanged();
    }, _$registerErrorAtom, name: '${_$registerErrorAtom.name}_set');
  }

  final _$loginErrorAtom = Atom(name: '_LoginBase.loginError');

  @override
  String get loginError {
    _$loginErrorAtom.context.enforceReadPolicy(_$loginErrorAtom);
    _$loginErrorAtom.reportObserved();
    return super.loginError;
  }

  @override
  set loginError(String value) {
    _$loginErrorAtom.context.conditionallyRunInAction(() {
      super.loginError = value;
      _$loginErrorAtom.reportChanged();
    }, _$loginErrorAtom, name: '${_$loginErrorAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_LoginBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$registerUserAsyncAction = AsyncAction('registerUser');

  @override
  Future<dynamic> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  dynamic setLoginPage([bool value = true]) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setLoginPage(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRegisterPage([bool value = true]) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setRegisterPage(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEmail(String e) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeEmail(e);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(String p) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changePassword(p);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmPassword(String p) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeConfirmPassword(p);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }
}
