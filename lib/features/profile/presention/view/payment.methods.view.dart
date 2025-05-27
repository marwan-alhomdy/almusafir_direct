import 'package:almusafir_direct/core/utils/resource/text_style.dart';
import 'package:almusafir_direct/core/widget/image/image_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/Animation/animation_limiter_widget.dart';
import '../../../../core/widget/appbar/my_appbar.dart';

class PaymentMethodsWidget extends StatelessWidget {
  const PaymentMethodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWithLogo(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimationLimiterWidget(
          children: [
            CardPaymentWidget(
                image:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNM-fF5JAlTYp_vWZ-rA2zcZkgfNcJZIsGVQ&s",
                title: "الكريمي",
                description: "1234567890"),
            CardPaymentWidget(
                image:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaKA7zXtFzrTp6lW2_NBISJ-EzHJuqs87qdAbaDjdZiEpA11OeagzZM1CoRkCOI8duymg&usqp=CAU",
                title: "محفظة جيب",
                description: "1234567890"),
            CardPaymentWidget(
                image:
                    "https://play-lh.googleusercontent.com/MJGb3rEIRGyFqnvE6C0TDm097FrLFcXmz3wi2xxwCdm-YKb3sf_CQO4zfHGtNqLfn10",
                title: "محفظة كاش",
                description: "1234567890"),
            CardPaymentWidget(
                image:
                    "https://play-lh.googleusercontent.com/DaZdX1qJynxsMa0ktpZAqdLDCgilj3sMT2gEKnFLLmu03L_YDqkxQrktXfTQOyy8MmCP",
                title: "محفظة ون كاش",
                description: "1234567890"),
          ],
        ),
      ),
    );
  }
}

class CardPaymentWidget extends StatelessWidget {
  const CardPaymentWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        leading: SizedBox(
          width: 40,
          height: 40,
          child: ImageWidget(image),
        ),
        title: Text(title, style: AppTextStyles.getMediumStyle()),
        subtitle: Text(description, style: AppTextStyles.getRegularStyle()),
      ),
    );
  }
}
