import 'package:almusafir_direct/core/utils/style/border_radius.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../data/custom/country.dart';
import '../../utils/resource/text_style.dart';

class MobileOrEmailFieldWidget extends StatefulWidget {
  const MobileOrEmailFieldWidget(
      {super.key,
      this.validator,
      required this.controller,
      required this.country,
      this.onChangedCountry});

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Country country;
  final void Function(Country)? onChangedCountry;

  @override
  State<StatefulWidget> createState() => _MobileOrEmailFieldWidgetState();
}

class _MobileOrEmailFieldWidgetState extends State<MobileOrEmailFieldWidget> {
  bool isEmail = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(checkInputType);
  }

  void checkInputType() {
    final text = widget.controller.text;
    final newIsEmail = text.contains('@');
    if (newIsEmail != isEmail) {
      setState(() {
        isEmail = newIsEmail;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(checkInputType);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: widget.controller,
        keyboardType:
            isEmail ? TextInputType.emailAddress : TextInputType.number,
        validator: widget.validator,
        maxLength: isEmail ? null : 15,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
          counterText: "",
          alignLabelWithHint: true,
          suffixIcon: isEmail
              ? null
              : _SuffixIconWidget(
                  country: widget.country,
                  onChangedCountry: widget.onChangedCountry,
                ),
        ),
      ),
    );
  }
}

class _SuffixIconWidget extends StatelessWidget {
  const _SuffixIconWidget({required this.country, this.onChangedCountry});
  final Country country;
  final void Function(Country)? onChangedCountry;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorderAttribute.all(10),
      onTap: chooseCountryDialoge,
      child: Row(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(),
          Text(country.flag, style: const TextStyle(fontSize: 20)),
          Text(
            country.code.replaceAll(RegExp(r'\+'), ''),
            textDirection: TextDirection.ltr,
            style: AppTextStyles.getMediumStyle(),
          ),
          const Icon(Iconsax.arrow_down),
          const SizedBox(width: 5),
        ],
      ),
    );
  }

  void chooseCountryDialoge() {
    Get.defaultDialog(
        title: "Choose the Country".tr,
        titleStyle: AppTextStyles.getBoldStyle(fontSize: 18),
        content: _ContariesWidget(onChangedCountry: onChangedCountry));
  }
}

class _ContariesWidget extends StatelessWidget {
  const _ContariesWidget({required this.onChangedCountry});
  final void Function(Country)? onChangedCountry;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: CountryManager.countries.length,
          itemBuilder: (context, index) {
            final country = CountryManager.countries[index];
            return ListTile(
              onTap: () {
                Get.back();
                onChangedCountry?.call(country);
              },
              leading: Text(country.flag, style: const TextStyle(fontSize: 20)),
              title: Text(country.name, style: AppTextStyles.getMediumStyle()),
              trailing: Text(country.code, style: AppTextStyles.getBoldStyle()),
            );
          },
        ),
      ),
    );
  }
}
