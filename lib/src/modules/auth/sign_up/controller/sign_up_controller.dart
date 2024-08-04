import 'package:country/country.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_pay/src/core/base/dto/server_response.dart';
import 'package:smart_pay/src/core/route/_views.dart';
import 'package:smart_pay/src/core/utils/common_libs.dart';
import 'package:smart_pay/src/modules/auth/sign_up/model/country_and_flag_model.dart';
import 'package:smart_pay/src/modules/auth/sign_up/model/signup_response.dart';
import 'package:smart_pay/src/repository/auth_repository.dart';

class SignUpController extends BaseChangeNotifier {
  SignUpController(this._ref) {
    getCountryName();
  }
  final Ref _ref;

  String email = '';
  String fullName = '';
  String userName = '';
  String password = '';
  CountryAndFlagModel? selectedCountry;

  TextEditingController pinController = TextEditingController();
  TextEditingController accountPinController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final userDetailsFormKey = GlobalKey<FormState>();

  final _repo = AuthRepository();
  final _localStorage = const FlutterSecureStorage();
  AuthResponse authResponse = AuthResponse();

  List<CountryAndFlagModel> countryAndFlagModel = [];
  List<CountryAndFlagModel> searchCountryAndFlagModel = [];

  void onEmailChange(val) => email = val;
  void onOtpChanged(val) => pinController.text += val;
  void onAccountPinChanged(val) => accountPinController.text += val;

  void onFullNameChanged(val) => fullName = val;
  void onUserNameChanged(val) => userName = val;
  void onPasswordChanged(val) => password = val;
  void onCountryChanged(val) {
    selectedCountry = val;
    setState();
    _ref.read(navigationService).back();
  }

  void onSearchCountry(String text) {
    if (isNotEmpty(text)) {
      searchCountryAndFlagModel.clear();
      countryAndFlagModel
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .forEach((element) {
        searchCountryAndFlagModel.add(element);
      });
    }
    setState();
  }

  void getCountryName() {
    countryAndFlagModel.clear();
    for (final country in Countries.values) {
      countryAndFlagModel.add(CountryAndFlagModel(
          name: country.isoShortName,
          flag: country.flagEmoji,
          code: country.alpha2));
    }
  }

  @override
  void dispose() {
    pinController.dispose();
    accountPinController.dispose();
    super.dispose();
  }

  Future<void> sendEmailToken() async {
    try {
      if (!(formKey.currentState?.validate() ?? false)) return;
      setState(state: AppState.loading);
      ServerResponse response = await _repo.getEmailToken(email);
      if (response.status == true) {
        navigateToOtpAuthenticationView();
      }
    } on AppException catch (ex) {
      _ref.read(toastService).showError(ex.toString());
    } finally {
      setState(state: AppState.idle);
    }
  }

  Future<void> verifyEmailToken() async {
    try {
      if (pinController.text.isEmpty) {
        _ref.read(toastService).showError('Kindly enter a valid OTP');
      } else if (pinController.text.length != 5 ||
          pinController.text.length < 5) {
        _ref.read(toastService).showError('OTP must be 5 digits');
      } else {
        setState(state: AppState.loading);
        ServerResponse response = await _repo.verifyEmailToken(
            email: email, token: pinController.text.substring(0, 5));
        if (response.status == true) {
          navigateToUserDetailsView();
        }
      }
    } on AppException catch (ex) {
      _ref.read(toastService).showError(ex.toString());
    } finally {
      setState(state: AppState.idle);
    }
  }

  Future<void> registerUser() async {
    try {
      if (!(userDetailsFormKey.currentState?.validate() ?? false)) return;
      if (selectedCountry == null) {
        return _ref.read(toastService).showError('Select country');
      }
      setState(state: AppState.loading);
      authResponse = await _repo.register(
        email: email,
        username: userName,
        fullName: fullName,
        country: selectedCountry?.code ?? '',
        password: password,
      );
      if (authResponse.token != null) {
        navigateToCreatePinView();
      }
    } on AppException catch (ex) {
      _ref.read(toastService).showError(ex.toString());
    } finally {
      setState(state: AppState.idle);
    }
  }

  Future<void> saveAccountPin() async {
    try {
      if (accountPinController.text.isEmpty) {
        _ref.read(toastService).showError('Kindly enter a valid PIN');
      } else if (accountPinController.text.length != 5 ||
          accountPinController.text.length < 5) {
        _ref.read(toastService).showError('PIN must be 5 digits');
      } else {
        setState(state: AppState.loading);
        await _localStorage.write(
            key: 'accountPin',
            value: accountPinController.text.substring(0, 5));

        Future.delayed(const Duration(seconds: 5), () {
          navigateToConfirmationView();
        });
      }
    } on AppException catch (ex) {
      _ref.read(toastService).showError(ex.toString());
    } finally {
      setState(state: AppState.idle);
    }
  }

//navigation
  void navigateToLogin() {
    _ref.read(navigationService).to(LoginView.route);
  }

  void navigateToOtpAuthenticationView() {
    _ref.read(navigationService).to(OtpAuthenticationView.route);
  }

  void navigateToUserDetailsView() {
    _ref.read(navigationService).to(UserDetailsView.route);
  }

  void navigateToCreatePinView() {
    _ref.read(navigationService).to(CreatePinView.route);
  }

  void navigateToConfirmationView() {
    _ref.read(navigationService).to(ConfirmationView.route);
  }

  void navigateToLoginView() {
    _ref.read(navigationService).clearAllTo(LoginView.route);
  }
}

final signUpNotifier = ChangeNotifierProvider((ref) => SignUpController(ref));
