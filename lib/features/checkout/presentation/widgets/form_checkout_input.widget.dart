import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/utils/validator/validator.dart';
import 'package:almusafir_direct/core/widget/field/date_picker_fild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                title: const Text("هل الرحلة ذهاب وعود؟"),
                secondary: const Icon(Iconsax.arrow_swap_horizontal_copy,
                    color: Colors.blue),
                onChanged: (value) =>
                    setState(() => servicesCubit.isRoundTrip = value ?? true),
              ),
            ]),

          if (orderType?.isAllowDepartureDestination == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(
                    title: "المحطة من ", icon: Iconsax.location),
                DropTextFieldWidget(
                  validator: orderType?.isRequiredDepartureDestination == 1
                      ? "هذا الحقل مطلوب".validator()
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
                const RouteInputWidget(
                    title: "المحطة الى", icon: Iconsax.location),
                DropTextFieldWidget(
                  controller: servicesCubit.toTripController,
                  validator: orderType?.isRequiredArrivalDestination == 1
                      ? "هذا الحقل مطلوب".validator()
                      : null,
                  onTap: () =>
                      formServiceCubit.manager.onToAirport(servicesCubit),
                ),
              ],
            ),
          if (orderType?.isAllowFlightNumber == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(
                    title: "الرحلات", icon: Iconsax.location),
                DropTextFieldWidget(
                  controller: servicesCubit.flightController,
                  validator: orderType?.isRequiredFlightNumber == 1
                      ? "هذا الحقل مطلوب".validator()
                      : null,
                  onTap: () =>
                      formServiceCubit.manager.onFlights(servicesCubit),
                ),
              ],
            ),
          if (orderType?.isAllowOrderDate == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(
                    title: "تاريخ الذهاب", icon: Iconsax.calendar),
                DatePickerFieldWidget(
                  controller: servicesCubit.orderDateController,
                  validator: orderType?.isRequiredOrderDate == 1
                      ? "هذا الحقل مطلوب".validator()
                      : null,
                ),
              ],
            ),
          if (orderType?.isAllowReturnDate == 1 && servicesCubit.isRoundTrip)
            CardInputWidget(
              children: [
                const RouteInputWidget(
                    title: "تاريخ العودة", icon: Iconsax.calendar),
                DatePickerFieldWidget(
                  controller: servicesCubit.returnDateController,
                  validator: orderType?.isRequiredReturnDate == 1
                      ? "هذا الحقل مطلوب".validator()
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
                  title: const Text("هل قابل للكسر ؟"),
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
                  title: const Text('حساس في مسألة التخزين ؟'),
                  secondary: const Icon(Iconsax.dcube, color: Colors.blue),
                  onChanged: (value) => setState(() =>
                      servicesCubit.isLoadStorageSensitive = value ?? true),
                ),
              ],
            ),
          if (orderType?.isAllowLoadType == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(title: "نوع الحمولة", icon: Iconsax.box),
                DropTextFieldWidget(
                  controller: servicesCubit.loadsTypeController,
                  validator: orderType?.isRequiredLoadType == 1
                      ? "هذا الحقل مطلوب".validator()
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
          //           validator: "هذا الحقل مطلوب".validator(),
          //           controller: servicesCubit.returnDateController),
          //     ],
          //   ),
          if (orderType?.isAllowLoadPeople == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(
                    title: "عدد الاشخاص", icon: Iconsax.profile_2user),
                TextFieldWidget(
                    keyboardType: TextInputType.number,
                    validator: orderType?.isRequiredLoadPeople == 1
                        ? "هذا الحقل مطلوب".validator()
                        : null,
                    controller: servicesCubit.countPersonController),
              ],
            ),
          if (orderType?.isAllowVehicleType == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(
                    title: "وسيلة التوصيل", icon: Iconsax.truck_fast),
                DropTextFieldWidget(
                  controller: servicesCubit.vehicleTypeController,
                  validator: orderType?.isRequiredVehicleType == 1
                      ? "هذا الحقل مطلوب".validator()
                      : null,
                  onTap: () =>
                      formServiceCubit.manager.onVehicleType(servicesCubit),
                ),
              ],
            ),
          CardInputWidget(
            children: [
              const RouteInputWidget(title: "طريقة الدفع", icon: Iconsax.money),
              DropTextFieldWidget(
                validator: "هذا الحقل مطلوب".validator(),
                controller: servicesCubit.paymentMethodTypeController,
                onTap: () =>
                    formServiceCubit.manager.onPaymentMothed(servicesCubit),
              ),
            ],
          ),

          if (orderType?.isAllowCoupon == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(title: "كود الخصم", icon: Iconsax.gift),
                TextFieldWidget(controller: servicesCubit.couponController)
              ],
            ),
          if (orderType?.isAllowTip == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(
                    title: "إكرامية السائق", icon: Iconsax.car),
                TextFieldWidget(
                    controller: servicesCubit.tipController,
                    keyboardType: TextInputType.number),
              ],
            ),
          if (orderType?.isAllowExpectedCartTotal == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(
                    title: "يرجى كتابة المبلغ المتوقع ",
                    icon: Iconsax.dollar_circle),
                TextFieldWidget(
                  keyboardType: TextInputType.number,
                  controller: servicesCubit.expectedTotalController,
                  validator: orderType?.isRequiredExpectedCartTotal == 1
                      ? "هذا الحقل مطلوب".validator()
                      : null,
                ),
              ],
            ),
          if (orderType?.isAllowCustomerNotes == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(
                    title: "ملاحظة العميل", icon: Iconsax.note),
                TextFieldWidget(
                  maxLines: 3,
                  controller: servicesCubit.customerNoteController,
                  validator: orderType?.isRequiredCustomerNotes == 1
                      ? "هذا الحقل مطلوب".validator()
                      : null,
                ),
              ],
            ),
          if (orderType?.isAllowLoadNotes == 1)
            CardInputWidget(
              children: [
                const RouteInputWidget(
                    title: "ملاحظات الحمولة", icon: Iconsax.note),
                TextFieldWidget(
                  maxLines: 3,
                  controller: servicesCubit.loadNotesController,
                  validator: orderType?.isRequiredLoadNotes == 1
                      ? "هذا الحقل مطلوب".validator()
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
