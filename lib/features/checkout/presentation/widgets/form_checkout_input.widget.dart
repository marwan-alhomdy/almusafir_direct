import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/utils/validator/validator.dart';
import 'package:almusafir_direct/core/widget/field/date_picker_fild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/Animation/animation_column_widget.dart';
import '../../../../core/widget/field/droptext_field.widget.dart';
import '../../../../core/widget/field/text_field.widget.dart';
import '../../../home/data/model/orderstypes/datum.dart';
import '../logic/form_checkout_cubit/form_checkout_cubit.dart';
import '../logic/form_service_cubit/form_service_cubit.dart';

class FormCheckoutInputWidget extends StatefulWidget {
  const FormCheckoutInputWidget({super.key, required this.orderType});

  final OrderType? orderType;

  @override
  State<FormCheckoutInputWidget> createState() =>
      _FormCheckoutInputWidgetState();
}

class _FormCheckoutInputWidgetState extends State<FormCheckoutInputWidget> {
  late final FormCheckoutCubit servicesCubit;
  late final FormServiceCubit formServiceCubit;

  OrderType? get orderType => widget.orderType;

  @override
  void initState() {
    servicesCubit = context.read<FormCheckoutCubit>();
    formServiceCubit = context.read<FormServiceCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: servicesCubit.formKey,
      child: AnimationColumnWidget(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          if (orderType?.isAllowRoundTrip == 1)
            CardInputWidget(children: [
              CheckboxListTile(
                contentPadding: const EdgeInsetsDirectional.only(start: 10),
                value: servicesCubit.isRoundTrip,
                title: Text("Is the trip round-trip?".tr),
                secondary: const Icon(Iconsax.arrow_swap_horizontal_copy,
                    color: Colors.blue),
                onChanged: (value) =>
                    setState(() => servicesCubit.isRoundTrip = value ?? true),
              ),
            ]),

          if (orderType?.isAllowDepartureDestination == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(
                    title: "Departure Station".tr, icon: Iconsax.location),
                DropTextFieldWidget(
                  validator: orderType?.isRequiredDepartureDestination == 1
                      ? "This field is required".tr.validator()
                      : null,
                  controller: servicesCubit.fromTripController,
                  onTap: () =>
                      formServiceCubit.manager.onFromAirport(servicesCubit),
                ),
              ],
            ),

          if (orderType?.isAllowArrivalDestination == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(
                    title: "Arrival Station".tr, icon: Iconsax.location),
                DropTextFieldWidget(
                  controller: servicesCubit.toTripController,
                  validator: orderType?.isRequiredArrivalDestination == 1
                      ? "This field is required".tr.validator()
                      : null,
                  onTap: () =>
                      formServiceCubit.manager.onToAirport(servicesCubit),
                ),
              ],
            ),
          if (orderType?.isAllowFlightNumber == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(title: "Trips".tr, icon: Iconsax.location),
                DropTextFieldWidget(
                  controller: servicesCubit.flightController,
                  validator: orderType?.isRequiredFlightNumber == 1
                      ? "This field is required".tr.validator()
                      : null,
                  onTap: () =>
                      formServiceCubit.manager.onFlights(servicesCubit),
                ),
              ],
            ),
          if (orderType?.isAllowOrderDate == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(
                    title: "Departure Date".tr, icon: Iconsax.calendar),
                DatePickerFieldWidget(
                  controller: servicesCubit.orderDateController,
                  validator: orderType?.isRequiredOrderDate == 1
                      ? "This field is required".tr.validator()
                      : null,
                ),
              ],
            ),
          if (orderType?.isAllowReturnDate == 1 && servicesCubit.isRoundTrip)
            CardInputWidget(
              children: [
                RouteInputWidget(
                    title: "Return Date".tr, icon: Iconsax.calendar),
                DatePickerFieldWidget(
                  controller: servicesCubit.returnDateController,
                  validator: orderType?.isRequiredReturnDate == 1
                      ? "This field is required".tr.validator()
                      : null,
                ),
              ],
            ),
          if (orderType?.isAllowLoadFragileMaterials == 1)
            CardInputWidget(
              children: [
                CheckboxListTile(
                  contentPadding: const EdgeInsetsDirectional.only(start: 10),
                  value: servicesCubit.isLoadFragileMaterials,
                  title: Text("Is it breakable?".tr),
                  secondary: const Icon(Iconsax.dcube, color: Colors.blue),
                  onChanged: (value) => setState(() =>
                      servicesCubit.isLoadFragileMaterials = value ?? true),
                ),
              ],
            ),

          if (orderType?.isAllowLoadStorageSensitive == 1)
            CardInputWidget(
              children: [
                CheckboxListTile(
                  contentPadding: const EdgeInsetsDirectional.only(start: 10),
                  value: servicesCubit.isLoadStorageSensitive,
                  title: Text("Is it sensitive in terms of storage?".tr),
                  secondary: const Icon(Iconsax.dcube, color: Colors.blue),
                  onChanged: (value) => setState(() =>
                      servicesCubit.isLoadStorageSensitive = value ?? true),
                ),
              ],
            ),
          if (orderType?.isAllowLoadType == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(title: "Type of Cargo".tr, icon: Iconsax.box),
                DropTextFieldWidget(
                  controller: servicesCubit.loadsTypeController,
                  validator: orderType?.isRequiredLoadType == 1
                      ? "This field is required".tr.validator()
                      : null,
                  onTap: () =>
                      formServiceCubit.manager.onLoadsTypes(servicesCubit),
                ),
              ],
            ),
          // if (orderType?.isAllowWeight == 1 ||
          //     orderType?.isAllowWidth == 1 ||
          //     orderType?.isAllowLength == 1)
          //   CardInputWidget(
          //     children: [
          //       RouteInputWidget(
          //           title: "اوزان الحمولة", icon: Iconsax.align_vertically),
          //       TextFieldWidget(
          //           validator: "This field is required".tr.validator(),
          //           controller: servicesCubit.returnDateController),
          //     ],
          //   ),
          if (orderType?.isAllowLoadPeople == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(
                    title: "Number of People".tr, icon: Iconsax.profile_2user),
                TextFieldWidget(
                    keyboardType: TextInputType.number,
                    validator: orderType?.isRequiredLoadPeople == 1
                        ? "This field is required".tr.validator()
                        : null,
                    controller: servicesCubit.countPersonController),
              ],
            ),
          if (orderType?.isAllowVehicleType == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(
                    title: "Delivery Method".tr, icon: Iconsax.truck_fast),
                DropTextFieldWidget(
                  controller: servicesCubit.vehicleTypeController,
                  validator: orderType?.isRequiredVehicleType == 1
                      ? "This field is required".tr.validator()
                      : null,
                  onTap: () =>
                      formServiceCubit.manager.onVehicleType(servicesCubit),
                ),
              ],
            ),
          CardInputWidget(
            children: [
              RouteInputWidget(title: "Payment Method".tr, icon: Iconsax.money),
              DropTextFieldWidget(
                validator: "This field is required".tr.validator(),
                controller: servicesCubit.paymentMethodTypeController,
                onTap: () =>
                    formServiceCubit.manager.onPaymentMothed(servicesCubit),
              ),
            ],
          ),

          if (orderType?.isAllowCoupon == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(title: "Discount Code".tr, icon: Iconsax.gift),
                TextFieldWidget(controller: servicesCubit.couponController)
              ],
            ),
          if (orderType?.isAllowTip == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(title: "Driver Tip".tr, icon: Iconsax.car),
                TextFieldWidget(
                    controller: servicesCubit.tipController,
                    keyboardType: TextInputType.number),
              ],
            ),
          if (orderType?.isAllowExpectedCartTotal == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(
                    title: "Please enter the expected amount".tr,
                    icon: Iconsax.dollar_circle),
                TextFieldWidget(
                  keyboardType: TextInputType.number,
                  controller: servicesCubit.expectedTotalController,
                  validator: orderType?.isRequiredExpectedCartTotal == 1
                      ? "This field is required".tr.validator()
                      : null,
                ),
              ],
            ),
          if (orderType?.isAllowCustomerNotes == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(title: "Customer Note".tr, icon: Iconsax.note),
                TextFieldWidget(
                  maxLines: 3,
                  controller: servicesCubit.customerNoteController,
                  validator: orderType?.isRequiredCustomerNotes == 1
                      ? "This field is required".tr.validator()
                      : null,
                ),
              ],
            ),
          if (orderType?.isAllowLoadNotes == 1)
            CardInputWidget(
              children: [
                RouteInputWidget(title: "Cargo Notes".tr, icon: Iconsax.note),
                TextFieldWidget(
                  maxLines: 3,
                  controller: servicesCubit.loadNotesController,
                  validator: orderType?.isRequiredLoadNotes == 1
                      ? "This field is required".tr.validator()
                      : null,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class CardInputWidget extends StatelessWidget {
  const CardInputWidget({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      elevation: 0.2,
      child: Column(
        spacing: 5,
        children: children,
      ),
    );
  }
}

class RouteInputWidget extends StatelessWidget {
  const RouteInputWidget({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   minTileHeight: 0,
    //   leading: Icon(icon, color: Colors.blue),
    //   title: Text(title),
    //   subtitle: Text(title),
    // );

    return Row(
      spacing: 5,
      children: [
        const SizedBox(),
        Icon(icon, size: 18, color: Colors.blue),
        Text(title, style: AppTextStyles.getMediumStyle()),
      ],
    );
  }
}
