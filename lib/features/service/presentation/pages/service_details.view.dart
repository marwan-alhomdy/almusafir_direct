import 'package:almusafir_direct/core/widget/button/button.widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/resource/images.dart';
import '../../../../core/widget/image/image_service.widget.dart';
import '../../../shopping/data/models/shop_products/shop_products.dart';
import '../widgets/booking_requirements.widget.dart';
import '../widgets/routes_row_widget.dart';
import '../widgets/terms_list.widget.dart';

class ServiceDetailsView extends StatelessWidget {
  const ServiceDetailsView({super.key, required this.product});
  final ShopProduct product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            title: Image.asset(AppImages.logo, height: 30),
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: ImageServiceWidget(
                    images: (product.images?.isEmpty ?? true)
                        ? ([product.image?.original ?? ""])
                        : product.images
                                ?.map((image) => image.original ?? "")
                                .toList() ??
                            [])),
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name ?? "-----",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  // Rating
                  Row(
                    spacing: 4,
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(
                          '${product.averageRating ?? 0} (${product.countRating ?? 0} reviews)',
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Company Information
                  const Text('Company Information',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(product.description ?? "----"),
                  const SizedBox(height: 20),

                  // Popular Routes
                  const RoutesRowWidget(),
                  const SizedBox(height: 20),

                  // Bus Specifications
                  const Text('Bus Specifications',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Wrap(
                    spacing: 2,
                    runSpacing: 0,
                    children: [
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
                      const SizedBox(width: 12),
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
