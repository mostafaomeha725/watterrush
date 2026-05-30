class HomeBannerViewModel {
  const HomeBannerViewModel({
    required this.title,
    required this.subtitle,
    required this.offerText,
    required this.mainImageUrl,
    required this.secondaryImageUrl,
  });

  final String title;
  final String subtitle;
  final String offerText;
  final String mainImageUrl;
  final String secondaryImageUrl;
}

class HomeCategoryViewModel {
  const HomeCategoryViewModel({
    required this.title,
    required this.subtitle,
    required this.routeDescription,
    required this.imageUrl,
    this.badgeText = '',
  });

  final String title;
  final String subtitle;
  final String routeDescription;
  final String imageUrl;
  final String badgeText;
}

class HomeTrustFeatureViewModel {
  const HomeTrustFeatureViewModel({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final String icon;
  final String title;
  final String subtitle;
}