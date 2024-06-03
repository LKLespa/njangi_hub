import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/core/user/user.dart';
import 'package:njangi_hub/shared/shared.dart';

final routes = {
  PageRoutes.splash: (context) => const SplashScreen(),
  PageRoutes.home: (context) => const MyHomePage(),
  PageRoutes.intro: (context) => const IntroScreen(),
  PageRoutes.login: (context) => LoginWithPhoneNumberPage(),
  PageRoutes.otpVerify: (context) => OtpPage(),
  PageRoutes.userInformation: (context) => UserInformationRegistrationPage(),
  PageRoutes.enterEmail: (context) => EmailVerificationPage(),
  PageRoutes.settings: (context) => const SettingsPage(),
  PageRoutes.profile: (context) => const ProfilePage(),
  PageRoutes.theme: (context) => const ThemePage(),
  PageRoutes.usersProfile: (context) => const UserProfilePage(),
  PageRoutes.createGroup: (context) => CreateGroupPage(),
  PageRoutes.njangiGroup: (context) => NjangiGroupPage(),
  PageRoutes.searchGroups: (context) => const SearchNjangiGroupsPage(),
};