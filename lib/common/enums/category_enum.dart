import 'package:news_app/common/app_data.dart';

enum CategoryEnum {
  general,
  business,
  sports,
  technology,
  entertainment,
  health,
  science,
}

extension CategoryEnumExtension on CategoryEnum {
  String get title {
    switch (this) {
      case CategoryEnum.general:
        return 'General';
      case CategoryEnum.business:
        return 'Business';
      case CategoryEnum.sports:
        return 'Sports';
      case CategoryEnum.technology:
        return 'Technology';
      case CategoryEnum.entertainment:
        return 'Entertainment';
      case CategoryEnum.health:
        return 'Health';
      case CategoryEnum.science:
        return 'Science';
    }
  }

  String get lightImage {
    switch (this) {
      case CategoryEnum.general:
        return AppData.generalLight;
      case CategoryEnum.business:
        return AppData.businessLight;
      case CategoryEnum.sports:
        return AppData.sportsLight;
      case CategoryEnum.technology:
        return AppData.technologyLight;
      case CategoryEnum.entertainment:
        return AppData.entertainmentLight;
      case CategoryEnum.health:
        return AppData.healthLight;
      case CategoryEnum.science:
        return AppData.scienceLight;
    }
  }

  String get darkImage {
    switch (this) {
      case CategoryEnum.general:
        return AppData.generalDark;
      case CategoryEnum.business:
        return AppData.businessDark;
      case CategoryEnum.sports:
        return AppData.sportsDark;
      case CategoryEnum.technology:
        return AppData.technologyDark;
      case CategoryEnum.entertainment:
        return AppData.entertainmentDark;
      case CategoryEnum.health:
        return AppData.healthDark;
      case CategoryEnum.science:
        return AppData.scienceDark;
    }
  }

  bool get imageOnLeft {
    switch (this) {
      case CategoryEnum.general:
      case CategoryEnum.sports:
      case CategoryEnum.entertainment:
      case CategoryEnum.science:
        return true;

      case CategoryEnum.business:
      case CategoryEnum.technology:
      case CategoryEnum.health:
        return false;
    }
  }
}
