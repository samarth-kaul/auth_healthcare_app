class OnboardingContent {
  String image;
  String text;

  OnboardingContent({required this.image, required this.text});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    text: 'Consult with a doctor\nyou trust',
    image: 'assets/images/onb1.png',
  ),
  OnboardingContent(
    text: 'Find a lot of specialist doctors in one place',
    image: 'assets/images/onb2.png',
  ),
  OnboardingContent(
    text: 'Get our\nonline consultaion',
    image: 'assets/images/onb3.png',
  ),
];
