import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/home_models.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/special_offer_card_accent_strip.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/special_offer_card_body_row.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/special_offer_card_footer.dart';
import 'package:waterrush/features/custoomer/customer_home/presentation/screens/widgets/special_offer_card_top_row.dart';

class SpecialOfferListCard extends StatelessWidget {
  const SpecialOfferListCard({super.key, required this.offer, this.onTap});

  final OfferSliderItemData offer;
  final VoidCallback? onTap;

  Color get _accentColor =>
      offer.colors.isNotEmpty ? offer.colors.first : const Color(0xFF1E73D9);

  String get _categoryTag {
    final String t = offer.title.toLowerCase();
    final String s = offer.subtitle.toLowerCase();
    if (t.contains('flash') || s.contains('selected products')) {
      return 'Water Cartons';
    }
    if (t.contains('gallon') || s.contains('gallon')) return '5-Gallon';
    if (t.contains('office') || s.contains('bulk')) return 'Bulk Orders';
    return 'Special Offer';
  }

  @override
  Widget build(BuildContext context) {
    final Color accent = _accentColor;
    final String tag = _categoryTag;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: const Color(0xFFECF1FB)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFF2A4F7D).withValues(alpha: 0.07),
              blurRadius: 18.r,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SpecialOfferCardAccentStrip(color: accent),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SpecialOfferCardTopRow(
                          offer: offer,
                          accentColor: accent,
                          categoryTag: tag,
                        ),
                        verticalSpacing(12),
                        SpecialOfferCardBodyRow(
                          offer: offer,
                          accentColor: accent,
                        ),
                        verticalSpacing(12),
                        SpecialOfferCardFooter(offer: offer),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
