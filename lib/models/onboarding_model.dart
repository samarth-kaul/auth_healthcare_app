class OnboardingContent {
  String image;
  String text;

  OnboardingContent({required this.image, required this.text});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    text: 'Consult with a doctor you trust',
    image: 'assets/images/doc-patient.png',
  ),
  OnboardingContent(
    text: 'Find a lot of specialist doctors in one place',
    image: 'assets/images/doc-patient.png',
  ),
  OnboardingContent(
    text: 'Get our online consultaion',
    image: 'assets/images/doc-patient.png',
  ),
];
