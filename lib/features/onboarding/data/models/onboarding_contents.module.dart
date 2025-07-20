import '../../../../core/utils/resource/images.dart';

class OnboardingContent {
  final String title;
  final String image;
  final String titleEn;

  OnboardingContent({
    required this.title,
    required this.image,
    required this.titleEn,
  });
}

List<OnboardingContent> onboardingContents = [
  OnboardingContent(
    image: AppImages.onboarding1,
    title:
        "استعد لمغامرتك القادمة! سواء كنت تخطط لرحلة عمل أو عطلة، نحن نوفر لك كل ما تحتاجه في مكان واحد.",
    titleEn:
        "Get ready for your next adventure! Whether you're planning a business trip or a vacation, we provide everything you need all in one place.",
  ),
  OnboardingContent(
    image: AppImages.onboarding2,
    title:
        "احجز تذاكر الطيران، التنقلات البرية، أو مكان الإقامة بضغطة زر. راحة وسرعة وتوفير وقتك أولويتنا.",
    titleEn:
        "Book your flight tickets, ground transportation, or accommodation with just a click. Comfort, speed, and saving your time are our priorities.",
  ),
  OnboardingContent(
    image: AppImages.onboarding3,
    title:
        "استكشف، احجز، وسافر بثقة. تطبيقنا يرافقك في كل خطوة لتجربة سفر آمنة ومريحة وخالية من التعقيد.",
    titleEn:
        "Explore, book, and travel with confidence. Our app accompanies you every step of the way for a safe, comfortable, and hassle-free travel experience.",
  ),
];
