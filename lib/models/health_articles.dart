class HealthArticle {
  String name;
  String image;
  String source;

  HealthArticle(
      {required this.name, required this.image, required this.source});
}

List<HealthArticle> articles = [
  HealthArticle(
      name: "Nutrition - Eating healthy in real life",
      image: "assets/images/nutrition.jpg",
      source: "www.healthline.com"),
  HealthArticle(
      name: "Signs and Symptoms of Vitamin B12 Deficiency",
      image: "assets/images/vitaminb12.jpg",
      source: "www.healthline.com"),
  HealthArticle(
      name: "Successful Weight-Loss",
      image: "assets/images/weightloss.jpg",
      source: "www.medicalnewstoday.com"),
  HealthArticle(
      name: "Managing Chronic Conditions",
      image: "assets/images/chronic.jpg",
      source: "www.healthdirect.gov.au"),
  HealthArticle(
      name: "Mental Health Stigma and Awareness",
      image: "assets/images/healthstigma.jpg",
      source: "www.psychiatry.org"),
  HealthArticle(
      name: "Understanding Allergies and Managing Them",
      image: "assets/images/allergy.jpg",
      source: "my.clevelandclinic.org"),
  HealthArticle(
      name: "Stress: Coping with Everyday Problems",
      image: "assets/images/stress.jpg",
      source: "mhanational.org"),
  HealthArticle(
      name: "Healthy & Happy Aging",
      image: "assets/images/happyageing.jpg",
      source: "www.everydayhealth.com"),
  HealthArticle(
      name: "Boosting Immunity Naturally",
      image: "assets/images/immunity.jpg",
      source: "www.healthline.com"),
];
