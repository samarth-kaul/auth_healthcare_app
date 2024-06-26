class DoctorDeets {
  String name;
  String dp;
  double rating;
  double distance;
  String designation;

  DoctorDeets(
      {required this.name,
      required this.dp,
      required this.rating,
      required this.distance,
      required this.designation});
}

List<DoctorDeets> doctors = [
  DoctorDeets(
      name: "Dr. Grace Johnson",
      dp: "assets/images/doc1.png",
      rating: 4.5,
      distance: 0.7,
      designation: "Psychiatrist"),
  DoctorDeets(
      name: "Dr. Benjamin Parker",
      dp: "assets/images/doc2.png",
      rating: 4.1,
      distance: 2.0,
      designation: "Dermatologist"),
  DoctorDeets(
      name: "Dr. Olivia Ramirez",
      dp: "assets/images/doc3.png",
      rating: 4.8,
      distance: 1.5,
      designation: "Pediatrician"),
  DoctorDeets(
      name: "Dr. Daniel Chen",
      dp: "assets/images/doc4.png",
      rating: 4.0,
      distance: 0.9,
      designation: "Cardiologist"),
  DoctorDeets(
      name: "Dr. Rachel Morgan",
      dp: "assets/images/doc5.png",
      rating: 4.2,
      distance: 0.7,
      designation: "Psychiatrist"),
  DoctorDeets(
      name: "Dr. Alexander Williams",
      dp: "assets/images/doc1.png",
      rating: 4.9,
      distance: 1.4,
      designation: "Cardiologist"),
  DoctorDeets(
      name: "Dr. Sophia Lee",
      dp: "assets/images/doc2.png",
      rating: 3.7,
      distance: 0.6,
      designation: "Neurologist"),
  DoctorDeets(
      name: "Dr. Jacob Anderson",
      dp: "assets/images/doc3.png",
      rating: 4.5,
      distance: 0.4,
      designation: "Dermatologist"),
  DoctorDeets(
      name: "Dr. Lucas Garcia",
      dp: "assets/images/doc4.png",
      rating: 4.3,
      distance: 2.7,
      designation: "Pediatrician"),
  DoctorDeets(
      name: "Dr. Ethan Wilson",
      dp: "assets/images/doc5.png",
      rating: 4.8,
      distance: 1.7,
      designation: "Neurologist"),
];
