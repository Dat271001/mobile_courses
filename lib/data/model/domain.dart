import 'package:second_app_api/constants/index.dart';

enum Domain {
  ios(Constants.iosDomain, Constants.iosFilter, Strings.iOS),
  android(Constants.androidDomain, Constants.androidFilter, Strings.android),
  flutter(Constants.flutterDomain, Constants.flutterFilter, Strings.flutter),
  sss(Constants.sssDomain, Constants.sssFilter, Strings.sss),
  unity(Constants.unityDomain, Constants.unityFilter, Strings.unity),
  macos(Constants.macOSDomain, Constants.macOSFilter, Strings.macOS),
  archived(
      Constants.archivedDomain, Constants.archivedOSFilter, Strings.archived),
  all('', Constants.allFilter, Strings.all),
  unknow('unknow', Constants.allFilter, Strings.unknow);

  final String id;
  final int value;
  final String name;

  const Domain(this.id, this.value, this.name);

  static List<Domain> get filters =>
      values.where((e) => e != Domain.unknow).toList();

  static Domain getDomain(String domainId) {

    for (var domain in values) {
      if (domain.id == domainId) return domain;
    }
    return Domain.unknow;
  }
}
