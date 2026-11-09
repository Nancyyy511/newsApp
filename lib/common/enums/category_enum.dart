import 'package:flutter/material.dart';
import 'package:news_app/common/app_data.dart';
import 'package:news_app/l10n/app_localizations.dart';

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
  String getTitle(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    switch (this) {
      case CategoryEnum.general:
        return loc.general;
      case CategoryEnum.business:
        return loc.business;
      case CategoryEnum.sports:
        return loc.sports;
      case CategoryEnum.technology:
        return loc.technology;
      case CategoryEnum.entertainment:
        return loc.entertainment;
      case CategoryEnum.health:
        return loc.health;
      case CategoryEnum.science:
        return loc.science;
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
