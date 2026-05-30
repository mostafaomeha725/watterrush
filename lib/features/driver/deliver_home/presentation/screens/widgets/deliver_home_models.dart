import 'package:equatable/equatable.dart';

enum DriverDeliveryStage { accepted, pickedUp, onTheWay, delivered, rejected }

class DeliverOrderLineModel extends Equatable {
  const DeliverOrderLineModel({required this.name, required this.priceLabel});

  final String name;
  final String priceLabel;

  @override
  List<Object?> get props => <Object?>[name, priceLabel];
}

class DeliverOrderModel extends Equatable {
  const DeliverOrderModel({
    required this.orderId,
    required this.customerName,
    required this.customerPhone,
    required this.time,
    required this.address,
    required this.items,
    required this.orderLines,
    required this.distanceKm,
    required this.etaMinutes,
    required this.priceLabel,
    required this.driverLat,
    required this.driverLng,
    required this.pickupLat,
    required this.pickupLng,
    required this.customerLat,
    required this.customerLng,
    this.isCash = false,
    this.currentStage = DriverDeliveryStage.accepted,
  });

  final String orderId;
  final String customerName;
  final String customerPhone;
  final String time;
  final String address;
  final List<String> items;
  final List<DeliverOrderLineModel> orderLines;
  final double distanceKm;
  final int etaMinutes;
  final String priceLabel;
  final double driverLat;
  final double driverLng;
  final double pickupLat;
  final double pickupLng;
  final double customerLat;
  final double customerLng;
  final bool isCash;
  final DriverDeliveryStage currentStage;

  @override
  List<Object?> get props => <Object?>[
    orderId,
    customerName,
    customerPhone,
    time,
    address,
    items,
    orderLines,
    distanceKm,
    etaMinutes,
    priceLabel,
    driverLat,
    driverLng,
    pickupLat,
    pickupLng,
    customerLat,
    customerLng,
    isCash,
    currentStage,
  ];
}

class DeliverDailySummaryModel extends Equatable {
  const DeliverDailySummaryModel({
    required this.customerName,
    required this.value,
    this.reason,
    this.isSuccess = true,
  });

  final String customerName;
  final String value;
  final String? reason;
  final bool isSuccess;

  @override
  List<Object?> get props => <Object?>[customerName, value, reason, isSuccess];
}

class DeliverHomeDemoData {
  DeliverHomeDemoData._();

  static const List<DeliverOrderModel> orders = <DeliverOrderModel>[
    DeliverOrderModel(
      orderId: '#ord-002',
      customerName: 'Nour Khalil',
      customerPhone: '+20 115 234 1111',
      time: '2:42 PM',
      address: '8 Zamalek St, Zamalek Island, Cairo',
      items: <String>['1× Office Hydration Pack'],
      orderLines: <DeliverOrderLineModel>[
        DeliverOrderLineModel(
          name: '1× Office Hydration Pack',
          priceLabel: 'EGP 320',
        ),
      ],
      distanceKm: 4.1,
      etaMinutes: 18,
      priceLabel: 'EGP 320',
      driverLat: 30.0561,
      driverLng: 31.2266,
      pickupLat: 30.0571,
      pickupLng: 31.2247,
      customerLat: 30.0545,
      customerLng: 31.2287,
      currentStage: DriverDeliveryStage.accepted,
    ),
    DeliverOrderModel(
      orderId: '#ord-003',
      customerName: 'Sara Mohamed',
      customerPhone: '+20 115 234 5678',
      time: '2:50 PM',
      address: '22 El Nil St, Giza, Giza Governorate',
      items: <String>['3× Nestle Pure Life x12', '1× ClearSpring 5-Gallon'],
      orderLines: <DeliverOrderLineModel>[
        DeliverOrderLineModel(
          name: '3× Nestle Pure Life x12',
          priceLabel: 'EGP 114',
        ),
        DeliverOrderLineModel(
          name: '1× ClearSpring 5-Gallon',
          priceLabel: 'EGP 65',
        ),
      ],
      distanceKm: 3.7,
      etaMinutes: 15,
      priceLabel: 'EGP 179',
      driverLat: 30.0334,
      driverLng: 31.2139,
      pickupLat: 30.0369,
      pickupLng: 31.2119,
      customerLat: 30.0295,
      customerLng: 31.2157,
      isCash: true,
      currentStage: DriverDeliveryStage.pickedUp,
    ),
    DeliverOrderModel(
      orderId: '#ord-004',
      customerName: 'Omar Farouk',
      customerPhone: '+20 109 876 2210',
      time: '3:05 PM',
      address: '45 El Moez St, Islamic Cairo',
      items: <String>['2× Safi 1.5L Pack', '1× Baraka 330ml Pack'],
      orderLines: <DeliverOrderLineModel>[
        DeliverOrderLineModel(name: '2× Safi 1.5L Pack', priceLabel: 'EGP 88'),
        DeliverOrderLineModel(
          name: '1× Baraka 330ml Pack',
          priceLabel: 'EGP 44',
        ),
      ],
      distanceKm: 5.2,
      etaMinutes: 22,
      priceLabel: 'EGP 132',
      driverLat: 30.0488,
      driverLng: 31.2395,
      pickupLat: 30.0507,
      pickupLng: 31.2337,
      customerLat: 30.0466,
      customerLng: 31.2452,
      isCash: true,
      currentStage: DriverDeliveryStage.onTheWay,
    ),
  ];

  static const List<String> rejectReasons = <String>[
    'Customer not available',
    'Address not available',
    'Vehicle breakdown',
    'Order damaged',
    'Customer refused receipt',
    'Other',
  ];

  static const List<DeliverDailySummaryModel> dailySummary =
      <DeliverDailySummaryModel>[
        DeliverDailySummaryModel(
          customerName: 'Ahmed Hassan',
          value: '+EGP 29',
        ),
        DeliverDailySummaryModel(
          customerName: 'Nour Khalil',
          value: 'Rejected',
          reason: 'Reason: customer refused delivery',
          isSuccess: false,
        ),
        DeliverDailySummaryModel(
          customerName: 'Sara Mohamed',
          value: 'Rejected',
          reason: 'Reason: customer refused receipt',
          isSuccess: false,
        ),
      ];
}