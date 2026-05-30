import 'package:flutter/material.dart';
import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/customer_home_view_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';

// ─── Mock Products per Category ───────────────────────────────────────────────

const List<OfferProductItemData> waterCartonProducts = <OfferProductItemData>[
  OfferProductItemData(
    name: 'Nestle Pure Life 500ml',
    subtitle: 'Pack of 24 bottles · Still water',
    imageUrl:
        'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=700&q=80',
    currentPrice: 38,
    oldPrice: 50,
    saveAmount: 12,
    rating: 4.8,
    reviewsCount: 312,
    discountLabel: '24% OFF',
    isPopular: true,
    isOnOffer: true,
  ),
  OfferProductItemData(
    name: 'Baraka 330ml Carton',
    subtitle: 'Pack of 12 cartons · Mineral water',
    imageUrl:
        'https://images.unsplash.com/photo-1553361371-9b22f78e8b1d?auto=format&fit=crop&w=700&q=80',
    currentPrice: 22,
    oldPrice: 28,
    saveAmount: 6,
    rating: 4.5,
    reviewsCount: 187,
    discountLabel: '21% OFF',
    isPopular: true,
    isOnOffer: true,
  ),
  OfferProductItemData(
    name: 'Aquafina 600ml',
    subtitle: 'Pack of 12 bottles · Purified water',
    imageUrl:
        'https://images.unsplash.com/photo-1527137342181-19aab11a8ee8?auto=format&fit=crop&w=700&q=80',
    currentPrice: 32,
    oldPrice: 32,
    saveAmount: 0,
    rating: 4.3,
    reviewsCount: 98,
    discountLabel: '',
    isPopular: false,
    isOnOffer: false,
  ),
  OfferProductItemData(
    name: 'Safi 1.5L Carton',
    subtitle: 'Pack of 12 bottles · Spring water',
    imageUrl:
        'https://images.unsplash.com/photo-1562564055-71e051d33c19?auto=format&fit=crop&w=700&q=80',
    currentPrice: 29,
    oldPrice: 38,
    saveAmount: 9,
    rating: 4.6,
    reviewsCount: 234,
    discountLabel: '24% OFF',
    isPopular: true,
    isOnOffer: true,
  ),
  OfferProductItemData(
    name: 'Hayat 200ml Mini',
    subtitle: 'Pack of 30 cartons · Still water',
    imageUrl:
        'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=700&q=80',
    currentPrice: 18,
    oldPrice: 22,
    saveAmount: 4,
    rating: 4.2,
    reviewsCount: 76,
    discountLabel: '18% OFF',
    isPopular: false,
    isOnOffer: true,
  ),
];

const List<OfferProductItemData> gallonProducts = <OfferProductItemData>[
  OfferProductItemData(
    name: 'WaterRush 5-Gallon Refill',
    subtitle: 'Home & office delivery · Polycarbonate jug',
    imageUrl:
        'https://images.unsplash.com/photo-1585238342024-78d387f4a707?auto=format&fit=crop&w=700&q=80',
    currentPrice: 55,
    oldPrice: 70,
    saveAmount: 15,
    rating: 4.9,
    reviewsCount: 502,
    discountLabel: '21% OFF',
    isPopular: true,
    isOnOffer: true,
  ),
  OfferProductItemData(
    name: 'Crystal Clear 5-Gallon',
    subtitle: 'Mineral enriched · Home delivery',
    imageUrl:
        'https://images.unsplash.com/photo-1553361371-9b22f78e8b1d?auto=format&fit=crop&w=700&q=80',
    currentPrice: 60,
    oldPrice: 75,
    saveAmount: 15,
    rating: 4.7,
    reviewsCount: 318,
    discountLabel: '20% OFF',
    isPopular: true,
    isOnOffer: true,
  ),
  OfferProductItemData(
    name: 'AquaPure 5-Gallon',
    subtitle: 'Filtered · Alkaline pH 8.5',
    imageUrl:
        'https://images.unsplash.com/photo-1614991294199-d0f29c3ecf68?auto=format&fit=crop&w=700&q=80',
    currentPrice: 65,
    oldPrice: 65,
    saveAmount: 0,
    rating: 4.5,
    reviewsCount: 145,
    discountLabel: '',
    isPopular: false,
    isOnOffer: false,
  ),
  OfferProductItemData(
    name: 'Primo Sparkling 5-Gallon',
    subtitle: 'Sparkling water · Premium quality',
    imageUrl:
        'https://images.unsplash.com/photo-1527137342181-19aab11a8ee8?auto=format&fit=crop&w=700&q=80',
    currentPrice: 75,
    oldPrice: 90,
    saveAmount: 15,
    rating: 4.4,
    reviewsCount: 88,
    discountLabel: '17% OFF',
    isPopular: false,
    isOnOffer: true,
  ),
];

const List<OfferProductItemData> bulkOrderProducts = <OfferProductItemData>[
  OfferProductItemData(
    name: 'Office Bundle — 10 Gallons',
    subtitle: '10 × 5-gallon jugs · Bi-weekly delivery',
    imageUrl:
        'https://images.unsplash.com/photo-1614991294199-d0f29c3ecf68?auto=format&fit=crop&w=700&q=80',
    currentPrice: 480,
    oldPrice: 650,
    saveAmount: 170,
    rating: 4.9,
    reviewsCount: 421,
    discountLabel: '26% OFF',
    isPopular: true,
    isOnOffer: true,
  ),
  OfferProductItemData(
    name: 'Event Pack — 50 Cartons',
    subtitle: '50 × 24-pack cartons · Same-day delivery',
    imageUrl:
        'https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?auto=format&fit=crop&w=700&q=80',
    currentPrice: 820,
    oldPrice: 1100,
    saveAmount: 280,
    rating: 4.7,
    reviewsCount: 193,
    discountLabel: '25% OFF',
    isPopular: true,
    isOnOffer: true,
  ),
  OfferProductItemData(
    name: 'Gym Monthly Bundle',
    subtitle: '20 × 5-gallon + 10 × carton packs',
    imageUrl:
        'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=700&q=80',
    currentPrice: 990,
    oldPrice: 1300,
    saveAmount: 310,
    rating: 4.6,
    reviewsCount: 147,
    discountLabel: '24% OFF',
    isPopular: false,
    isOnOffer: true,
  ),
  OfferProductItemData(
    name: 'Hotel Supply Pack',
    subtitle: '100 × 500ml bottles · Weekly delivery',
    imageUrl:
        'https://images.unsplash.com/photo-1562564055-71e051d33c19?auto=format&fit=crop&w=700&q=80',
    currentPrice: 350,
    oldPrice: 420,
    saveAmount: 70,
    rating: 4.5,
    reviewsCount: 89,
    discountLabel: '17% OFF',
    isPopular: false,
    isOnOffer: false,
  ),
];

const List<HomeBannerViewModel> customerHomeBanners = [
  HomeBannerViewModel(
    title: 'Weekend\nFlash Offer',
    subtitle: 'Get up to 35% off on\nselected products',
    offerText: 'UP TO\n35%\nOFF',
    mainImageUrl:
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8?auto=format&fit=crop&w=1200&q=80',
    secondaryImageUrl:
        'https://images.unsplash.com/photo-1566288623394-377af472d81b?auto=format&fit=crop&w=900&q=80',
  ),
  HomeBannerViewModel(
    title: 'Weekend\nFlash Offer',
    subtitle: 'Get up to 35% off on\nselected products',
    offerText: 'UP TO\n35%\nOFF',
    mainImageUrl:
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8?auto=format&fit=crop&w=1200&q=80',
    secondaryImageUrl:
        'https://images.unsplash.com/photo-1566288623394-377af472d81b?auto=format&fit=crop&w=900&q=80',
  ),
  HomeBannerViewModel(
    title: 'Weekend\nFlash Offer',
    subtitle: 'Get up to 35% off on\nselected products',
    offerText: 'UP TO\n35%\nOFF',
    mainImageUrl:
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8?auto=format&fit=crop&w=1200&q=80',
    secondaryImageUrl:
        'https://images.unsplash.com/photo-1566288623394-377af472d81b?auto=format&fit=crop&w=900&q=80',
  ),
];

const List<HomeCategoryViewModel> customerHomeCategories = [
  HomeCategoryViewModel(
    title: 'Water Cartons',
    subtitle: 'Packaged hydration in cartons',
    routeDescription: 'Packaged hydration in cartons',
    imageUrl:
        'https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?auto=format&fit=crop&w=700&q=80',
  ),
  HomeCategoryViewModel(
    title: '5-Gallon Bottles',
    subtitle: 'Bulk 5-gallon refills for home & office',
    routeDescription: 'Bulk 5-gallon refills for home & office',
    imageUrl:
        'https://images.unsplash.com/photo-1585238342024-78d387f4a707?auto=format&fit=crop&w=700&q=80',
  ),
  HomeCategoryViewModel(
    title: 'Bulk Orders',
    subtitle: 'Discounts on large volume orders',
    routeDescription: 'Discounts on large volume orders',
    imageUrl:
        'https://images.unsplash.com/photo-1614991294199-d0f29c3ecf68?auto=format&fit=crop&w=700&q=80',
    badgeText: '%',
  ),
];

const List<HomeTrustFeatureViewModel> customerHomeTopTrustItems = [
  HomeTrustFeatureViewModel(
    icon: 'bolt',
    title: 'Fast Delivery',
    subtitle: 'in minutes',
  ),
  HomeTrustFeatureViewModel(
    icon: 'shield',
    title: 'Safe & Secure',
    subtitle: '100% trusted',
  ),
  HomeTrustFeatureViewModel(
    icon: 'drop',
    title: 'Pure & Fresh',
    subtitle: 'quality assured',
  ),
  HomeTrustFeatureViewModel(
    icon: 'support',
    title: '24/7 Support',
    subtitle: 'we are here',
  ),
];

const List<HomeTrustFeatureViewModel> customerHomeBottomTrustItems = [
  HomeTrustFeatureViewModel(
    icon: 'truck',
    title: 'On-Time Delivery',
    subtitle: 'You can count on us',
  ),
  HomeTrustFeatureViewModel(
    icon: 'badge',
    title: 'Top Brands',
    subtitle: 'Trusted quality',
  ),
  HomeTrustFeatureViewModel(
    icon: 'swap',
    title: 'Easy Returns',
    subtitle: 'Hassle-free',
  ),
  HomeTrustFeatureViewModel(
    icon: 'lock',
    title: 'Secure Payments',
    subtitle: '100% safe',
  ),
];

List<OfferSliderItemData> get customerHomeOffers => <OfferSliderItemData>[
  OfferSliderItemData(
    title: 'Weekend Flash Offer',
    subtitle: 'Get up to 35% off on selected products',
    imagePath: Assets.specialOffer,
    colors: const <Color>[Color(0xFF1A6FD4), Color(0xFF0EA5DC)],
    flashDealLabel: 'FLASH DEAL',
    discountLabel: '35% OFF',
    validUntil: DateTime(2026, 4, 30),
    terms: const <String>[
      'Valid on selected water cartons only',
      'Cannot be combined with other offers',
      'Limited to 5 units per customer',
    ],
    products: const <OfferProductItemData>[
      OfferProductItemData(
        name: 'Nestle Pure Life 500ml',
        subtitle: 'Pack of 24 · Still water · 35% OFF',
        imageUrl:
            'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=700&q=80',
        currentPrice: 33,
        oldPrice: 50,
        saveAmount: 17,
        rating: 4.8,
        reviewsCount: 312,
        discountLabel: '35% OFF',
        isPopular: true,
        isOnOffer: true,
      ),
      OfferProductItemData(
        name: 'Baraka 330ml Carton',
        subtitle: 'Pack of 12 cartons · Mineral water · Flash deal',
        imageUrl:
            'https://images.unsplash.com/photo-1553361371-9b22f78e8b1d?auto=format&fit=crop&w=700&q=80',
        currentPrice: 18,
        oldPrice: 28,
        saveAmount: 10,
        rating: 4.5,
        reviewsCount: 187,
        discountLabel: '36% OFF',
        isPopular: true,
        isOnOffer: true,
      ),
      OfferProductItemData(
        name: 'Safi 1.5L Carton',
        subtitle: 'Pack of 12 bottles · Spring water · Weekend special',
        imageUrl:
            'https://images.unsplash.com/photo-1562564055-71e051d33c19?auto=format&fit=crop&w=700&q=80',
        currentPrice: 25,
        oldPrice: 38,
        saveAmount: 13,
        rating: 4.6,
        reviewsCount: 234,
        discountLabel: '34% OFF',
        isPopular: true,
        isOnOffer: true,
      ),
      OfferProductItemData(
        name: 'Hayat 200ml Mini',
        subtitle: 'Pack of 30 · Purified still water',
        imageUrl:
            'https://images.unsplash.com/photo-1527137342181-19aab11a8ee8?auto=format&fit=crop&w=700&q=80',
        currentPrice: 14,
        oldPrice: 22,
        saveAmount: 8,
        rating: 4.2,
        reviewsCount: 76,
        discountLabel: '36% OFF',
        isPopular: false,
        isOnOffer: true,
      ),
    ],
  ),
  OfferSliderItemData(
    title: 'Subscription Gift',
    subtitle: 'Subscribe now and get your first delivery free',
    imagePath: Assets.specialOffer,
    colors: const <Color>[Color(0xFF23B26D), Color(0xFF16A05C)],
    flashDealLabel: 'MEMBER DEAL',
    discountLabel: '20% OFF',
    validUntil: DateTime(2026, 5, 15),
    terms: const <String>[
      'New subscribers only',
      'First delivery free of charge',
      'Auto-renews monthly — cancel anytime',
    ],
    products: const <OfferProductItemData>[
      OfferProductItemData(
        name: 'WaterRush 5-Gallon Refill',
        subtitle: 'Subscriber price · Home & office · 20% OFF',
        imageUrl:
            'https://images.unsplash.com/photo-1585238342024-78d387f4a707?auto=format&fit=crop&w=700&q=80',
        currentPrice: 44,
        oldPrice: 55,
        saveAmount: 11,
        rating: 4.9,
        reviewsCount: 502,
        discountLabel: '20% OFF',
        isPopular: true,
        isOnOffer: true,
      ),
      OfferProductItemData(
        name: 'Crystal Clear 5-Gallon',
        subtitle: 'Mineral enriched · Member exclusive deal',
        imageUrl:
            'https://images.unsplash.com/photo-1553361371-9b22f78e8b1d?auto=format&fit=crop&w=700&q=80',
        currentPrice: 48,
        oldPrice: 60,
        saveAmount: 12,
        rating: 4.7,
        reviewsCount: 318,
        discountLabel: '20% OFF',
        isPopular: true,
        isOnOffer: true,
      ),
      OfferProductItemData(
        name: 'AquaPure Alkaline 5-Gallon',
        subtitle: 'pH 8.5 · Filtered · Subscriber deal',
        imageUrl:
            'https://images.unsplash.com/photo-1614991294199-d0f29c3ecf68?auto=format&fit=crop&w=700&q=80',
        currentPrice: 52,
        oldPrice: 65,
        saveAmount: 13,
        rating: 4.5,
        reviewsCount: 145,
        discountLabel: '20% OFF',
        isPopular: false,
        isOnOffer: true,
      ),
    ],
  ),
  OfferSliderItemData(
    title: 'Office Bundle Deal',
    subtitle: 'Save more on bulk orders for offices',
    imagePath: Assets.specialOffer,
    colors: const <Color>[Color(0xFF6C3FC8), Color(0xFF8B52E0)],
    flashDealLabel: 'BULK SAVER',
    discountLabel: '30% OFF',
    validUntil: DateTime(2026, 5, 6),
    terms: const <String>[
      'Minimum 10 units per order',
      'Available for office accounts only',
      'Free priority delivery on all bulk orders',
    ],
    products: const <OfferProductItemData>[
      OfferProductItemData(
        name: 'Office Bundle — 10 Gallons',
        subtitle: '10 × 5-gallon jugs · Bi-weekly delivery · 30% OFF',
        imageUrl:
            'https://images.unsplash.com/photo-1614991294199-d0f29c3ecf68?auto=format&fit=crop&w=700&q=80',
        currentPrice: 385,
        oldPrice: 550,
        saveAmount: 165,
        rating: 4.9,
        reviewsCount: 421,
        discountLabel: '30% OFF',
        isPopular: true,
        isOnOffer: true,
      ),
      OfferProductItemData(
        name: 'Event Pack — 50 Cartons',
        subtitle: '50 × 24-pack cartons · Same-day delivery',
        imageUrl:
            'https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?auto=format&fit=crop&w=700&q=80',
        currentPrice: 770,
        oldPrice: 1100,
        saveAmount: 330,
        rating: 4.7,
        reviewsCount: 193,
        discountLabel: '30% OFF',
        isPopular: true,
        isOnOffer: true,
      ),
      OfferProductItemData(
        name: 'Gym Monthly Bundle',
        subtitle: '20 × 5-gallon + 10 × carton packs',
        imageUrl:
            'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=700&q=80',
        currentPrice: 910,
        oldPrice: 1300,
        saveAmount: 390,
        rating: 4.6,
        reviewsCount: 147,
        discountLabel: '30% OFF',
        isPopular: false,
        isOnOffer: true,
      ),
      OfferProductItemData(
        name: 'Hotel Supply Pack',
        subtitle: '100 × 500ml bottles · Weekly delivery',
        imageUrl:
            'https://images.unsplash.com/photo-1562564055-71e051d33c19?auto=format&fit=crop&w=700&q=80',
        currentPrice: 294,
        oldPrice: 420,
        saveAmount: 126,
        rating: 4.5,
        reviewsCount: 89,
        discountLabel: '30% OFF',
        isPopular: false,
        isOnOffer: true,
      ),
    ],
  ),
];