import 'package:almusafir_direct/core/widget/button/button.widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/resource/images.dart';
import '../widgets/booking_requirements.widget.dart';
import '../widgets/image_service.widget.dart';
import '../widgets/routes_row_widget.dart';
import '../widgets/terms_list.widget.dart';

class ServiceDetailsView extends StatelessWidget {
  const ServiceDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            title: Image.asset(AppImages.LOGO_COLORS, height: 30),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: ImageServiceWidget(
                images: [
                  "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1035_202505141305230050_PromoBannerImage.jpg",
                  "https://dynamicimagesae.rehlat.com/DynamicImages/DealsAndOffers/DealsPromos/1033_202505141244365789_DealsPromoImageMWeb.jpg",
                  "https://cdn.almatar.com/widgets/XCzGJGrnzL9PJxB4LK2n3Dj3pbnwZl1C5Y91ZU8N.jpg",
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text('4.5 (275 reviews)', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Company Information
                  const Text('Company Information',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'Yemen Express Transport provides premium transportation services with a focus on comfort and punctuality. Our modern fleet includes VIP buses with spacious seating and entertainment options for a pleasant journey experience.',
                  ),
                  const SizedBox(height: 20),

                  // Popular Routes
                  const RoutesRowWidget(),
                  const SizedBox(height: 20),

                  // Bus Specifications
                  const Text('Bus Specifications',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 2,
                    runSpacing: 0,
                    children: const [
                      Chip(label: Text('VIP Seating')),
                      Chip(label: Text('High-Speed WiFi')),
                      Chip(label: Text('USB & Power Outlets')),
                      Chip(label: Text('LCD Screens')),
                      Chip(label: Text('Refreshments')),
                      Chip(label: Text('Air Conditioning')),
                      Chip(label: Text('Reclining Seats')),
                      Chip(label: Text('Extra Legroom')),
                      Chip(label: Text('On-board Toilet')),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Terms & Policies
                  const Text('Terms & Policies',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const TermsListWidget(),

                  const SizedBox(height: 20),

                  // Booking Requirements
                  const Text('Booking Requirements',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const BookingRequirementsWidget(),

                  const SizedBox(height: 30),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(onTap: () {}, text: 'Book Now'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButtonWidget(
                            onTap: () {}, text: 'Inquire Now'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
