import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get hour;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @minute.
  ///
  /// In en, this message translates to:
  /// **'minute'**
  String get minute;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get day;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @usernameHintText.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameHintText;

  /// No description provided for @passwordHintText.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordHintText;

  /// No description provided for @rememberMeCheckBoxText.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMeCheckBoxText;

  /// No description provided for @forgotPassLinkText.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassLinkText;

  /// No description provided for @loginBtnText.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginBtnText;

  /// No description provided for @toSignUpNormalText.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get toSignUpNormalText;

  /// No description provided for @toSignUpLinkText.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get toSignUpLinkText;

  /// No description provided for @loginDividerText.
  ///
  /// In en, this message translates to:
  /// **'Or continued with'**
  String get loginDividerText;

  /// No description provided for @emailHintText.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailHintText;

  /// No description provided for @reenterPassHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter password again'**
  String get reenterPassHintText;

  /// No description provided for @signUpBtnText.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpBtnText;

  /// No description provided for @toLoginNormalText.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get toLoginNormalText;

  /// No description provided for @toLoginLinkText.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get toLoginLinkText;

  /// No description provided for @createPostBtnText.
  ///
  /// In en, this message translates to:
  /// **'Create a post'**
  String get createPostBtnText;

  /// No description provided for @createPostTitle.
  ///
  /// In en, this message translates to:
  /// **'Create a post'**
  String get createPostTitle;

  /// No description provided for @commentsBtnText.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get commentsBtnText;

  /// No description provided for @shareBtnText.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareBtnText;

  /// No description provided for @createPostHintText.
  ///
  /// In en, this message translates to:
  /// **'Write something'**
  String get createPostHintText;

  /// No description provided for @chatHomePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chatHomePageTitle;

  /// No description provided for @searchBtnText.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchBtnText;

  /// No description provided for @searchHintText.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchHintText;

  /// No description provided for @searchRoomHintText.
  ///
  /// In en, this message translates to:
  /// **'Search room'**
  String get searchRoomHintText;

  /// No description provided for @searchUsernameBtnText.
  ///
  /// In en, this message translates to:
  /// **'Search username'**
  String get searchUsernameBtnText;

  /// No description provided for @searchUsernameHintText.
  ///
  /// In en, this message translates to:
  /// **'Search username'**
  String get searchUsernameHintText;

  /// No description provided for @filterTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterTitle;

  /// No description provided for @lastOnlineText.
  ///
  /// In en, this message translates to:
  /// **'Last online'**
  String get lastOnlineText;

  /// No description provided for @onlineText.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get onlineText;

  /// No description provided for @rankTitle.
  ///
  /// In en, this message translates to:
  /// **'Rank'**
  String get rankTitle;

  /// No description provided for @informationTabTitle.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get informationTabTitle;

  /// No description provided for @postTabTitle.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get postTabTitle;

  /// No description provided for @gameTabTitle.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get gameTabTitle;

  /// No description provided for @linkGameTitle.
  ///
  /// In en, this message translates to:
  /// **'Link game account'**
  String get linkGameTitle;

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationTitle;

  /// No description provided for @acceptBtnText.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get acceptBtnText;

  /// No description provided for @declineBtnText.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get declineBtnText;

  /// No description provided for @otherFriendRequestText.
  ///
  /// In en, this message translates to:
  /// **'sent you a friend request'**
  String get otherFriendRequestText;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @displayTitle.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get displayTitle;

  /// No description provided for @securityTitle.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get securityTitle;

  /// No description provided for @changePasswordBtnText.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePasswordBtnText;

  /// No description provided for @themesBtnText.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get themesBtnText;

  /// No description provided for @logOutBtnText.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOutBtnText;

  /// No description provided for @chooseThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a theme'**
  String get chooseThemeTitle;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @currentRank.
  ///
  /// In en, this message translates to:
  /// **'Current Rank'**
  String get currentRank;

  /// No description provided for @battleRoyalTitle.
  ///
  /// In en, this message translates to:
  /// **'Battle Royal'**
  String get battleRoyalTitle;

  /// No description provided for @arenasTitle.
  ///
  /// In en, this message translates to:
  /// **'Arenas'**
  String get arenasTitle;

  /// No description provided for @score.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get score;

  /// No description provided for @kill.
  ///
  /// In en, this message translates to:
  /// **'Kills'**
  String get kill;

  /// No description provided for @headshot.
  ///
  /// In en, this message translates to:
  /// **'Headshot'**
  String get headshot;

  /// No description provided for @tpp.
  ///
  /// In en, this message translates to:
  /// **'TPP'**
  String get tpp;

  /// No description provided for @fpp.
  ///
  /// In en, this message translates to:
  /// **'FPP'**
  String get fpp;

  /// No description provided for @rankedOverView.
  ///
  /// In en, this message translates to:
  /// **'Ranked Overview'**
  String get rankedOverView;

  /// No description provided for @bestRankPoint.
  ///
  /// In en, this message translates to:
  /// **'Best Rank Point'**
  String get bestRankPoint;

  /// No description provided for @detailsInfo.
  ///
  /// In en, this message translates to:
  /// **'Details Account Info'**
  String get detailsInfo;

  /// No description provided for @totalWin.
  ///
  /// In en, this message translates to:
  /// **'Total Win'**
  String get totalWin;

  /// No description provided for @totalLose.
  ///
  /// In en, this message translates to:
  /// **'Total Loss'**
  String get totalLose;

  /// No description provided for @averageWinRate.
  ///
  /// In en, this message translates to:
  /// **'Average Win Rate'**
  String get averageWinRate;

  /// No description provided for @averageTop10Rate.
  ///
  /// In en, this message translates to:
  /// **'Average Top 10 Rate'**
  String get averageTop10Rate;

  /// No description provided for @totalKill.
  ///
  /// In en, this message translates to:
  /// **'Total Kill'**
  String get totalKill;

  /// No description provided for @totalHeadshotKills.
  ///
  /// In en, this message translates to:
  /// **'Total Headshot Kills'**
  String get totalHeadshotKills;

  /// No description provided for @averageHeadshotRate.
  ///
  /// In en, this message translates to:
  /// **'Average Headshot Rate'**
  String get averageHeadshotRate;

  /// No description provided for @longestKill.
  ///
  /// In en, this message translates to:
  /// **'Longest Kill'**
  String get longestKill;

  /// No description provided for @totalTop10s.
  ///
  /// In en, this message translates to:
  /// **'Total Top 10s'**
  String get totalTop10s;

  /// No description provided for @duo.
  ///
  /// In en, this message translates to:
  /// **'Duo'**
  String get duo;

  /// No description provided for @ltm.
  ///
  /// In en, this message translates to:
  /// **'LTMs'**
  String get ltm;

  /// No description provided for @overall.
  ///
  /// In en, this message translates to:
  /// **'Overall'**
  String get overall;

  /// No description provided for @top3.
  ///
  /// In en, this message translates to:
  /// **'Top 3'**
  String get top3;

  /// No description provided for @top5.
  ///
  /// In en, this message translates to:
  /// **'Top 5'**
  String get top5;

  /// No description provided for @top6.
  ///
  /// In en, this message translates to:
  /// **'Top 6'**
  String get top6;

  /// No description provided for @top10.
  ///
  /// In en, this message translates to:
  /// **'Top 10'**
  String get top10;

  /// No description provided for @top12.
  ///
  /// In en, this message translates to:
  /// **'Top 12'**
  String get top12;

  /// No description provided for @top25.
  ///
  /// In en, this message translates to:
  /// **'Top 25'**
  String get top25;

  /// No description provided for @scorePerMin.
  ///
  /// In en, this message translates to:
  /// **'Score per minute'**
  String get scorePerMin;

  /// No description provided for @scorePerMatch.
  ///
  /// In en, this message translates to:
  /// **'Score per match'**
  String get scorePerMatch;

  /// No description provided for @killPerMin.
  ///
  /// In en, this message translates to:
  /// **'Kill per minute'**
  String get killPerMin;

  /// No description provided for @killPerMatch.
  ///
  /// In en, this message translates to:
  /// **'Kill per match'**
  String get killPerMatch;

  /// No description provided for @deaths.
  ///
  /// In en, this message translates to:
  /// **'Deaths'**
  String get deaths;

  /// No description provided for @kd.
  ///
  /// In en, this message translates to:
  /// **'KD'**
  String get kd;

  /// No description provided for @matches.
  ///
  /// In en, this message translates to:
  /// **'matches'**
  String get matches;

  /// No description provided for @minutesPlayed.
  ///
  /// In en, this message translates to:
  /// **'Minutes Played'**
  String get minutesPlayed;

  /// No description provided for @playersOutlived.
  ///
  /// In en, this message translates to:
  /// **'Players Outlived'**
  String get playersOutlived;

  /// No description provided for @lastModified.
  ///
  /// In en, this message translates to:
  /// **'Last Modified'**
  String get lastModified;

  /// No description provided for @solo.
  ///
  /// In en, this message translates to:
  /// **'SOLO'**
  String get solo;

  /// No description provided for @squad.
  ///
  /// In en, this message translates to:
  /// **'SQUAD'**
  String get squad;

  /// No description provided for @noDataMessage.
  ///
  /// In en, this message translates to:
  /// **'No data found'**
  String get noDataMessage;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @friendPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get friendPageTitle;

  /// No description provided for @createRoomBtnTitle.
  ///
  /// In en, this message translates to:
  /// **'CREATE'**
  String get createRoomBtnTitle;

  /// No description provided for @scrollPagingErrorDefaultMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get scrollPagingErrorDefaultMessage;

  /// No description provided for @addingChatRoomText.
  ///
  /// In en, this message translates to:
  /// **'Adding new chat room'**
  String get addingChatRoomText;

  /// No description provided for @addChatRoomFail.
  ///
  /// In en, this message translates to:
  /// **'Can\'t create new chat room'**
  String get addChatRoomFail;

  /// No description provided for @addChatRoomSuccess.
  ///
  /// In en, this message translates to:
  /// **'New chat room is created'**
  String get addChatRoomSuccess;

  /// No description provided for @addedToChatRoom.
  ///
  /// In en, this message translates to:
  /// **'You was added to a chat room'**
  String get addedToChatRoom;

  /// No description provided for @createChatRoomDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Create chat room'**
  String get createChatRoomDialogTitle;

  /// No description provided for @roomNameFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Enter room\'s name'**
  String get roomNameFieldHint;

  /// No description provided for @roomNameFieldError.
  ///
  /// In en, this message translates to:
  /// **'Room\'s name must not be empty'**
  String get roomNameFieldError;

  /// No description provided for @cancelBtnTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelBtnTitle;

  /// No description provided for @okBtnTitle.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get okBtnTitle;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @chatRoomMemberBtnTitle.
  ///
  /// In en, this message translates to:
  /// **'Chat room members'**
  String get chatRoomMemberBtnTitle;

  /// No description provided for @exitRoomTitle.
  ///
  /// In en, this message translates to:
  /// **'Exit room'**
  String get exitRoomTitle;

  /// No description provided for @chatRoomMemberTitle.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get chatRoomMemberTitle;

  /// No description provided for @addBtnTitle.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addBtnTitle;

  /// No description provided for @removeMemberFromRoomTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove member'**
  String get removeMemberFromRoomTitle;

  /// No description provided for @noMessages.
  ///
  /// In en, this message translates to:
  /// **'No messages yet'**
  String get noMessages;

  /// No description provided for @sendMessageError.
  ///
  /// In en, this message translates to:
  /// **'Oops! Can\'t send your message'**
  String get sendMessageError;

  /// No description provided for @resendMessageDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Resend message'**
  String get resendMessageDialogTitle;

  /// No description provided for @editChatRoomNameDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit chat room name'**
  String get editChatRoomNameDialogTitle;

  /// No description provided for @roomInfoChangeMessage.
  ///
  /// In en, this message translates to:
  /// **'changed info'**
  String get roomInfoChangeMessage;

  /// No description provided for @changeRoomNameFail.
  ///
  /// In en, this message translates to:
  /// **'Can\'t change room name'**
  String get changeRoomNameFail;

  /// No description provided for @roomNameFieldError2.
  ///
  /// In en, this message translates to:
  /// **'New room name must be different'**
  String get roomNameFieldError2;

  /// No description provided for @newUsersInChatRoomMessage.
  ///
  /// In en, this message translates to:
  /// **'New members was added to room'**
  String get newUsersInChatRoomMessage;

  /// No description provided for @removeUsersFromChatRoomMessage.
  ///
  /// In en, this message translates to:
  /// **'Members was removed from room'**
  String get removeUsersFromChatRoomMessage;

  /// No description provided for @addedToChatRoomMessage.
  ///
  /// In en, this message translates to:
  /// **'You was added to this chat room'**
  String get addedToChatRoomMessage;

  /// No description provided for @addUsersToChatRoomFail.
  ///
  /// In en, this message translates to:
  /// **'Can\'t add members to chat room'**
  String get addUsersToChatRoomFail;

  /// No description provided for @removeUsersFromChatRoomFail.
  ///
  /// In en, this message translates to:
  /// **'Can\'t remove members from chat room'**
  String get removeUsersFromChatRoomFail;

  /// No description provided for @editingUsersInChatRoomMessage.
  ///
  /// In en, this message translates to:
  /// **'Editing members'**
  String get editingUsersInChatRoomMessage;

  /// No description provided for @kickedFromRoomMessage.
  ///
  /// In en, this message translates to:
  /// **'You was kicked from room'**
  String get kickedFromRoomMessage;

  /// No description provided for @errorDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorDialogTitle;

  /// No description provided for @friendRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'Friend Requests'**
  String get friendRequestTitle;

  /// No description provided for @friendRequestAcceptSuccess1.
  ///
  /// In en, this message translates to:
  /// **'You and'**
  String get friendRequestAcceptSuccess1;

  /// No description provided for @friendRequestAcceptSuccess2.
  ///
  /// In en, this message translates to:
  /// **'have became friends'**
  String get friendRequestAcceptSuccess2;

  /// No description provided for @friendRequestAcceptFail.
  ///
  /// In en, this message translates to:
  /// **'Can\'t accept friend request. Please try again later'**
  String get friendRequestAcceptFail;

  /// No description provided for @friendRequestDeclineFail.
  ///
  /// In en, this message translates to:
  /// **'Can\'t decline friend request. Please try again later'**
  String get friendRequestDeclineFail;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @notRoomMasterMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'re not the room master'**
  String get notRoomMasterMessage;

  /// No description provided for @newChatRoomNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'New chat room is created'**
  String get newChatRoomNotificationTitle;

  /// No description provided for @newChatRoomNotificationBody.
  ///
  /// In en, this message translates to:
  /// **''**
  String get newChatRoomNotificationBody;

  /// No description provided for @youText.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get youText;

  /// No description provided for @friendRequestAcceptedMessage.
  ///
  /// In en, this message translates to:
  /// **'has accepted your friend request'**
  String get friendRequestAcceptedMessage;

  /// No description provided for @friendRequestReceivedMessage.
  ///
  /// In en, this message translates to:
  /// **'sent you a friend request'**
  String get friendRequestReceivedMessage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
