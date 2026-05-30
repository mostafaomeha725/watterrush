import 'package:waterrush/core/constants/app_assets.dart';
import 'package:waterrush/features/custoomer/customer_profile/presentation/screens/widgets/profile_models.dart';

class ProfileDemoData {
  ProfileDemoData._();

  static final List<ProfileOrderModel> orders = <ProfileOrderModel>[
    ProfileOrderModel(
      id: '#1253',
      orderedAt: DateTime(2024, 4, 15),
      totalPrice: '\$32.50',
      status: 'Delivered',
      itemsSummary: '24 x 500ml Cartons',
      deliveryType: '5-Gallon Bottle',
      meta: 'Delivered at 3:00 PM   •   45 Nile St, Giza, Egypt   •   Cash',
      thumbnailAsset: Assets.logo,
    ),
    ProfileOrderModel(
      id: '#1228',
      orderedAt: DateTime(2024, 4, 5),
      totalPrice: '\$14.00',
      status: 'Delivered',
      itemsSummary: '6 x 5-Gallon Bottles',
      deliveryType: 'Home Delivery',
      meta: '2:30 PM   •   123 Tahrir Square, Cairo, Egypt   •   Cash',
      thumbnailAsset: Assets.logo,
    ),
    ProfileOrderModel(
      id: '#1195',
      orderedAt: DateTime(2024, 3, 28),
      totalPrice: '\$44.00',
      status: 'Delivered',
      itemsSummary: '5 x 5-Gallon Bottles',
      deliveryType: 'Express Delivery',
      meta: '4:00 PM   •   123 Tahrir Sq, Cairo   •   Cash',
      thumbnailAsset: Assets.logo,
    ),
  ];
}