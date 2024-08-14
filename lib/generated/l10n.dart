// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Stock`
  String get stock {
    return Intl.message(
      'Stock',
      name: 'stock',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get totalPrice {
    return Intl.message(
      'Total Price',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Sale Product`
  String get saleProduct {
    return Intl.message(
      'Sale Product',
      name: 'saleProduct',
      desc: '',
      args: [],
    );
  }

  /// `New Arrivals`
  String get newArrivals {
    return Intl.message(
      'New Arrivals',
      name: 'newArrivals',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommended {
    return Intl.message(
      'Recommended',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Our Ecommerce App`
  String get ourEcommerceApp {
    return Intl.message(
      'Our Ecommerce App',
      name: 'ourEcommerceApp',
      desc: '',
      args: [],
    );
  }

  /// `Search Product Name`
  String get searchProductName {
    return Intl.message(
      'Search Product Name',
      name: 'searchProductName',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '50%Off' key

  /// `On everything today`
  String get onEverythingToday {
    return Intl.message(
      'On everything today',
      name: 'onEverythingToday',
      desc: '',
      args: [],
    );
  }

  /// `With code:FSCREATION`
  String get withCode {
    return Intl.message(
      'With code:FSCREATION',
      name: 'withCode',
      desc: '',
      args: [],
    );
  }

  /// `Get ready`
  String get getReady {
    return Intl.message(
      'Get ready',
      name: 'getReady',
      desc: '',
      args: [],
    );
  }

  /// `to start with us`
  String get toStartWithUs {
    return Intl.message(
      'to start with us',
      name: 'toStartWithUs',
      desc: '',
      args: [],
    );
  }

  /// `NEW`
  String get newArrival {
    return Intl.message(
      'NEW',
      name: 'newArrival',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `20% Discount\n`
  String get onBordingDiscount1 {
    return Intl.message(
      '20% Discount\n',
      name: 'onBordingDiscount1',
      desc: '',
      args: [],
    );
  }

  /// `New Arrival Products`
  String get onBordingDiscount2 {
    return Intl.message(
      'New Arrival Products',
      name: 'onBordingDiscount2',
      desc: '',
      args: [],
    );
  }

  /// `Take Advantage\n`
  String get onBordingTakeAdvantage1 {
    return Intl.message(
      'Take Advantage\n',
      name: 'onBordingTakeAdvantage1',
      desc: '',
      args: [],
    );
  }

  /// `Of The Shopping Offers`
  String get onBordingTakeAdvantage2 {
    return Intl.message(
      'Of The Shopping Offers',
      name: 'onBordingTakeAdvantage2',
      desc: '',
      args: [],
    );
  }

  /// `Every Good Sale Now\n`
  String get onBordingAllTypes1 {
    return Intl.message(
      'Every Good Sale Now\n',
      name: 'onBordingAllTypes1',
      desc: '',
      args: [],
    );
  }

  /// `Within Your Range`
  String get onBordingAllTypes2 {
    return Intl.message(
      'Within Your Range',
      name: 'onBordingAllTypes2',
      desc: '',
      args: [],
    );
  }

  /// `Surround yourself with every new coming product, sale, deal, and information about the current and the future market`
  String get onBordingSubTitle {
    return Intl.message(
      'Surround yourself with every new coming product, sale, deal, and information about the current and the future market',
      name: 'onBordingSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Favorite are empty`
  String get favoritesEmpty {
    return Intl.message(
      'Favorite are empty',
      name: 'favoritesEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Cart are empty`
  String get cartEmpty {
    return Intl.message(
      'Cart are empty',
      name: 'cartEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get Search {
    return Intl.message(
      'Search...',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete all favorites?`
  String get dialogFavorite {
    return Intl.message(
      'Are you sure to delete all favorites?',
      name: 'dialogFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete all Cart you have?`
  String get dialogCart {
    return Intl.message(
      'Are you sure to delete all Cart you have?',
      name: 'dialogCart',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get agree {
    return Intl.message(
      'Agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite`
  String get favoriteView {
    return Intl.message(
      'My Favorite',
      name: 'favoriteView',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get cartView {
    return Intl.message(
      'My Cart',
      name: 'cartView',
      desc: '',
      args: [],
    );
  }

  /// `Bag Total:`
  String get bagTotla {
    return Intl.message(
      'Bag Total:',
      name: 'bagTotla',
      desc: '',
      args: [],
    );
  }

  /// `SubTotal:`
  String get subTotal {
    return Intl.message(
      'SubTotal:',
      name: 'subTotal',
      desc: '',
      args: [],
    );
  }

  /// `Tax:`
  String get tax {
    return Intl.message(
      'Tax:',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `Proceed to Checkout`
  String get checkout {
    return Intl.message(
      'Proceed to Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `added`
  String get added {
    return Intl.message(
      'added',
      name: 'added',
      desc: '',
      args: [],
    );
  }

  /// `50% Off`
  String get titleCarouselSlider1 {
    return Intl.message(
      '50% Off',
      name: 'titleCarouselSlider1',
      desc: '',
      args: [],
    );
  }

  /// `On everything today`
  String get subTitleCarouselSlider1 {
    return Intl.message(
      'On everything today',
      name: 'subTitleCarouselSlider1',
      desc: '',
      args: [],
    );
  }

  /// `Get ready`
  String get titleCarouselSlider2 {
    return Intl.message(
      'Get ready',
      name: 'titleCarouselSlider2',
      desc: '',
      args: [],
    );
  }

  /// `to start with us`
  String get subTitleCarouselSlider2 {
    return Intl.message(
      'to start with us',
      name: 'subTitleCarouselSlider2',
      desc: '',
      args: [],
    );
  }

  /// `With code:FSCREATION`
  String get codeCarouselSlider {
    return Intl.message(
      'With code:FSCREATION',
      name: 'codeCarouselSlider',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get chooseLang {
    return Intl.message(
      'Choose Language',
      name: 'chooseLang',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `There are no results`
  String get notResult {
    return Intl.message(
      'There are no results',
      name: 'notResult',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Now`
  String get signUpNow {
    return Intl.message(
      'Sign Up Now',
      name: 'signUpNow',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Or Login With`
  String get orLogin {
    return Intl.message(
      'Or Login With',
      name: 'orLogin',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign Up With`
  String get orSignUp {
    return Intl.message(
      'Or Sign Up With',
      name: 'orSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome,\n`
  String get welcomeLogin {
    return Intl.message(
      'Welcome,\n',
      name: 'welcomeLogin',
      desc: '',
      args: [],
    );
  }

  /// `Glad to see you!`
  String get glad {
    return Intl.message(
      'Glad to see you!',
      name: 'glad',
      desc: '',
      args: [],
    );
  }

  /// `Create Account\n`
  String get createAccount {
    return Intl.message(
      'Create Account\n',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `To get started now!`
  String get toGetStarted {
    return Intl.message(
      'To get started now!',
      name: 'toGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login Now`
  String get loginNow {
    return Intl.message(
      'Login Now',
      name: 'loginNow',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password\n`
  String get forgetPass {
    return Intl.message(
      'Forget Password\n',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to receive an email to\nreset your password`
  String get titleForgetpassword {
    return Intl.message(
      'Enter your email to receive an email to\nreset your password',
      name: 'titleForgetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations\n`
  String get congratulations {
    return Intl.message(
      'Congratulations\n',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `An email has been sent to your\nemail to reset your password`
  String get changeSuccess {
    return Intl.message(
      'An email has been sent to your\nemail to reset your password',
      name: 'changeSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuee {
    return Intl.message(
      'Continue',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `Send Email\n`
  String get sendEmail {
    return Intl.message(
      'Send Email\n',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Guest Login`
  String get guest {
    return Intl.message(
      'Guest Login',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Login or Register`
  String get loginOrRegister {
    return Intl.message(
      'Login or Register',
      name: 'loginOrRegister',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get ediProfile {
    return Intl.message(
      'Edit Profile',
      name: 'ediProfile',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get personalInfo {
    return Intl.message(
      'Personal information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `My information`
  String get myInfo {
    return Intl.message(
      'My information',
      name: 'myInfo',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get content {
    return Intl.message(
      'Content',
      name: 'content',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: '',
      args: [],
    );
  }

  /// `App Mode`
  String get appMode {
    return Intl.message(
      'App Mode',
      name: 'appMode',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `FullName`
  String get fullName {
    return Intl.message(
      'FullName',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Zip Code`
  String get zipCode {
    return Intl.message(
      'Zip Code',
      name: 'zipCode',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove your account?`
  String get sureDelete {
    return Intl.message(
      'Are you sure you want to remove your account?',
      name: 'sureDelete',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
