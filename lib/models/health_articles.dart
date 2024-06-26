class HealthArticle {
  String name;
  String image;
  String source;
  String url;

  HealthArticle(
      {required this.name,
      required this.image,
      required this.source,
      required this.url});
}

List<HealthArticle> articles = [
  HealthArticle(
      name: "Nutrition - Eating healthy in real life",
      image: "assets/images/nutrition.jpg",
      source: "www.healthline.com",
      url: "https://www.healthline.com/nutrition"),
  HealthArticle(
      name: "Signs and Symptoms of Vitamin B12 Deficiency",
      image: "assets/images/vitaminb12.jpg",
      source: "www.healthline.com",
      url:
          "https://www.healthline.com/nutrition/vitamin-b12-deficiency-symptoms"),
  HealthArticle(
      name: "Successful Weight-Loss",
      image: "assets/images/weightloss.jpg",
      source: "www.medicalnewstoday.com",
      url: "https://www.medicalnewstoday.com/articles/303409"),
  HealthArticle(
      name: "Managing Chronic Conditions",
      image: "assets/images/chronic.jpg",
      source: "www.healthdirect.gov.au",
      url: "https://www.healthdirect.gov.au/management-of-chronic-conditions"),
  HealthArticle(
      name: "Mental Health Stigma and Awareness",
      image: "assets/images/healthstigma.jpg",
      source: "www.psychiatry.org",
      url:
          "https://www.psychiatry.org/patients-families/stigma-and-discrimination"),
  HealthArticle(
      name: "Understanding Allergies and Managing Them",
      image: "assets/images/allergy.jpg",
      source: "my.clevelandclinic.org",
      url: "https://my.clevelandclinic.org/health/diseases/8610-allergies"),
  HealthArticle(
      name: "Stress: Coping with Everyday Problems",
      image: "assets/images/stress.jpg",
      source: "mhanational.org",
      url: "https://mhanational.org/conditions/stress"),
  HealthArticle(
      name: "Healthy & Happy Aging",
      image: "assets/images/happyageing.jpg",
      source: "www.everydayhealth.com",
      url: "https://www.everydayhealth.com/self-care/"),
  HealthArticle(
      name: "Boosting Immunity Naturally",
      image: "assets/images/immunity.jpg",
      source: "www.healthline.com",
      url: "https://www.healthline.com/nutrition/how-to-boost-immune-health"),
];
