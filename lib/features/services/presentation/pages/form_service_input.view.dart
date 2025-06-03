import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/utils/validator/validator.dart';
import 'package:almusafir_direct/core/widget/button/button.widget.dart';
import 'package:almusafir_direct/core/widget/field/date_picker_fild_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/widget/appbar/my_appbar.dart';
import '../../../../core/widget/field/text_field.widget.dart';
import '../../../home/data/model/orderstypes/datum.dart';

class FormServiceInputView extends StatefulWidget {
  const FormServiceInputView({super.key, required this.orderType});

  final OrderType? orderType;

  @override
  State<FormServiceInputView> createState() => _FormServiceInputViewState();
}

class _FormServiceInputViewState extends State<FormServiceInputView> {
  final orderDateController = TextEditingController();
  final returnDateController = TextEditingController();
  final fromAddressController = TextEditingController();
  final toAddressController = TextEditingController();
  bool isRoundTrip = true;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    orderDateController.dispose();
    returnDateController.dispose();
    fromAddressController.dispose();
    toAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWithLogo(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              CardInputWidget(children: [
                CheckboxListTile(
                  contentPadding: EdgeInsetsDirectional.only(start: 10),
                  value: isRoundTrip,
                  title: Text("هل الرحلة ذهاب وعود؟"),
                  secondary: Icon(Iconsax.arrow_swap_horizontal_copy),
                  onChanged: (value) =>
                      setState(() => isRoundTrip = value ?? true),
                ),
              ]),
              CardInputWidget(
                children: [
                  RouteInputWidget(title: "الرحلة من ", icon: Iconsax.location),
                  TextFieldWidget(
                      validator: "هذا الحقل مطلوب".validator(),
                      controller: fromAddressController),
                ],
              ),
              CardInputWidget(
                children: [
                  RouteInputWidget(title: "الرحلة الى", icon: Iconsax.location),
                  TextFieldWidget(
                      validator: "هذا الحقل مطلوب".validator(),
                      controller: toAddressController),
                ],
              ),

              CardInputWidget(
                children: [
                  RouteInputWidget(
                      title: "تاريخ الذهاب", icon: Iconsax.calendar),
                  DatePickerFieldWidget(
                      validator: "هذا الحقل مطلوب".validator(),
                      controller: orderDateController),
                ],
              ),

              // TODO: add  widget.orderType?.isRoundTrip == 1 &&
              if (isRoundTrip)
                CardInputWidget(
                  children: [
                    RouteInputWidget(
                        title: "تاريخ العودة", icon: Iconsax.calendar),
                    DatePickerFieldWidget(
                        validator: "هذا الحقل مطلوب".validator(),
                        controller: returnDateController),
                  ],
                ),
              CardInputWidget(children: [
                CheckboxListTile(
                  contentPadding: EdgeInsetsDirectional.only(start: 10),
                  value: isRoundTrip,
                  title: Text("هل قابل للكسر ؟"),
                  secondary: Icon(Iconsax.dcube),
                  onChanged: (value) =>
                      setState(() => isRoundTrip = value ?? true),
                ),
              ]),

              CardInputWidget(
                children: [
                  RouteInputWidget(title: "نوع الحمولة", icon: Iconsax.box),
                  TextFieldWidget(
                      validator: "هذا الحقل مطلوب".validator(),
                      controller: returnDateController),
                ],
              ),

              CardInputWidget(
                children: [
                  RouteInputWidget(
                      title: "اوزان الحمولة", icon: Iconsax.align_vertically),
                  TextFieldWidget(
                      validator: "هذا الحقل مطلوب".validator(),
                      controller: returnDateController),
                ],
              ),

              CardInputWidget(
                children: [
                  RouteInputWidget(
                      title: "عدد الاشخاص", icon: Iconsax.profile_2user),
                  TextFieldWidget(
                      validator: "هذا الحقل مطلوب".validator(),
                      controller: returnDateController),
                ],
              ),

              CardInputWidget(
                children: [
                  RouteInputWidget(
                      title: "وسيلة التوصيل", icon: Iconsax.truck_fast),
                  TextFieldWidget(
                      validator: "هذا الحقل مطلوب".validator(),
                      controller: returnDateController),
                ],
              ),

              CardInputWidget(
                children: [
                  RouteInputWidget(title: "طريقة الدفع", icon: Iconsax.card),
                  TextFieldWidget(
                      validator: "هذا الحقل مطلوب".validator(),
                      controller: returnDateController),
                ],
              ),

              CardInputWidget(
                children: [
                  RouteInputWidget(title: "كود الخصم", icon: Iconsax.gift),
                  TextFieldWidget(controller: returnDateController)
                ],
              ),

              CardInputWidget(
                children: [
                  RouteInputWidget(title: "إكرامية السائق", icon: Iconsax.car),
                  TextFieldWidget(controller: returnDateController),
                ],
              ),

              CardInputWidget(
                children: [
                  RouteInputWidget(title: "الملاحظات", icon: Iconsax.note),
                  TextFieldWidget(
                      validator: "هذا الحقل مطلوب".validator(),
                      controller: returnDateController,
                      maxLines: 3),
                ],
              ),

              ButtonWidget(
                  onTap: () {
                    formKey.currentState?.validate();
                  },
                  text: "OK".tr),
              SizedBox(height: 30),
            ],
          ),
        ),
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
    return Row(
      spacing: 5,
      children: [
        SizedBox(),
        Icon(icon, size: 15),
        Text(title, style: AppTextStyles.getMediumStyle()),
      ],
    );
  }
}
