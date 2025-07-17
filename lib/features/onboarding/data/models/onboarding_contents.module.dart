import '../../../../core/utils/resource/images.dart';

class OnboardingContent {
  final String title;
  final String image;
  final String desc;

  OnboardingContent({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContent> onboardingContents = [
  OnboardingContent(
    image: AppImages.onboarding1,
    title:
        "استعد لمغامرتك القادمة! سواء كنت تخطط لرحلة عمل أو عطلة، نحن نوفر لك كل ما تحتاجه في مكان واحد.",
    desc: "",
  ),
  OnboardingContent(
    image: AppImages.onboarding2,
    title:
        "احجز تذاكر الطيران، التنقلات البرية، أو مكان الإقامة بضغطة زر. راحة وسرعة وتوفير وقتك أولويتنا.",
    desc: "",
  ),
  OnboardingContent(
    image: AppImages.onboarding3,
    title:
        "استكشف، احجز، وسافر بثقة. تطبيقنا يرافقك في كل خطوة لتجربة سفر آمنة ومريحة وخالية من التعقيد.",
    desc: "",
  ),
];
