// import 'dart:io';

// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AppOpenAdManager {
//   String adUnitId = Platform.isAndroid
//       ? 'ca-app-pub-7689891360488659/3407691490'
//       : 'ca-app-pub-7689891360488659/7136055650';

//   AppOpenAd? _appOpenAd;
//   bool _isShowingAd = false;

//   /// Load an AppOpenAd.
//   void loadAd() {
//     AppOpenAd.load(
//       adUnitId: adUnitId,
//       orientation: AppOpenAd.orientationPortrait,
//       request: const AdRequest(),
//       adLoadCallback: AppOpenAdLoadCallback(
//         onAdLoaded: (ad) {
//           _appOpenAd = ad;
//         },
//         onAdFailedToLoad: (error) {
//           // Handle the error.
//         },
//       ),
//     );
//   }

//   /// Whether an ad is available to be shown.
//   bool get isAdAvailable {
//     return _appOpenAd != null;
//   }

//   void showAdIfAvailable() {
//     if (!isAdAvailable) {
//       print('Tried to show ad before available.');
//       loadAd();
//       return;
//     }
//     if (_isShowingAd) {
//       print('Tried to show ad while already showing an ad.');
//       return;
//     }
//     // Set the fullScreenContentCallback and show the ad.
//     _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (ad) {
//         _isShowingAd = true;
//         print('$ad onAdShowedFullScreenContent');
//       },
//       onAdFailedToShowFullScreenContent: (ad, error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         _isShowingAd = false;
//         ad.dispose();
//         _appOpenAd = null;
//       },
//       onAdDismissedFullScreenContent: (ad) {
//         print('$ad onAdDismissedFullScreenContent');
//         _isShowingAd = false;
//         ad.dispose();
//         _appOpenAd = null;
//         loadAd();
//       },
//     );
//   }
// }

// /// Listens for app foreground events and shows app open ads.
// class AppLifecycleReactor {
//   final AppOpenAdManager appOpenAdManager;

//   AppLifecycleReactor({required this.appOpenAdManager});

//   void listenToAppStateChanges() {
//     AppStateEventNotifier.startListening();
//     AppStateEventNotifier.appStateStream.forEach((state) => _onAppStateChanged(state));
//   }

//   void _onAppStateChanged(AppState appState) {
//     // Try to show an app open ad if the app is being resumed and
//     // we're not already showing an app open ad.
//     if (appState == AppState.foreground) {
//       appOpenAdManager.showAdIfAvailable();
//     }
//   }
// }

// class AdHelper {
//   static String get bannerAdUnitId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-7689891360488659/9959645641';
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-7689891360488659/2709455985';
//     } else {
//       throw UnsupportedError('Unsupported platform');
//     }
//   }
// }
