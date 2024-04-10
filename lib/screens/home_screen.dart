import 'package:auth_healthcare_app/models/doctor_details.dart';
import 'package:auth_healthcare_app/models/health_articles.dart';
import 'package:auth_healthcare_app/screens/article_webpage.dart';
import 'package:auth_healthcare_app/screens/best_docs_screen.dart';
import 'package:auth_healthcare_app/screens/doc_screen.dart';
import 'package:auth_healthcare_app/screens/onboarding_screen2.dart';
import 'package:auth_healthcare_app/widgets/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = size.height;
    var sWidth = size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Find your desired\nhealth solution",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            print("bell icon pressed");
                          },
                          icon: Icon(
                            Icons.notifications_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print("logout pressed");
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "NO",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OnboardingLoginSignUp()));
                                        },
                                        child: const Text(
                                          "YES",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                  title: const Text(
                                      "Are you sure you want to logout?"),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.logout_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // SvgPicture.asset(
                //   "assets/card.svg",
                //   height: sHeight * 0.28,
                //   width: double.maxFinite,
                // ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: sHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xffE8F3F1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Enjoy protection for\nyour family health",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            margin: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text(
                                "Learn More",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ],
                      ),
                      Image.asset("assets/images/homepageimage.png"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          "assets/doctor.svg",
                          height: sHeight * 0.05,
                          width: sWidth * 0.05,
                        ),
                        Text("Doctor"),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          "assets/ambulance.svg",
                          height: sHeight * 0.05,
                          width: sWidth * 0.05,
                        ),
                        Text("Pharmacy"),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          "assets/hospital.svg",
                          height: sHeight * 0.05,
                          width: sWidth * 0.05,
                        ),
                        Text("Hospital"),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          "assets/ambulance.svg",
                          height: sHeight * 0.05,
                          width: sWidth * 0.05,
                        ),
                        Text("Doctor"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recommended Doctors",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w800),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BestDocsScreen()));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: sHeight * 0.01,
                ),
                SizedBox(
                  height: sHeight * 0.22,
                  // width: sWidth * 0.3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: doctors.length,
                    // itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DocScreen(
                                      name: doctors[index].name,
                                      designation: doctors[index].designation,
                                      distance: doctors[index].distance,
                                      dp: doctors[index].dp,
                                      rating: doctors[index].rating)));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 6, right: 6, top: 6, bottom: 6),
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black12)),
                          width: sWidth * 0.38,
                          // height: sHeight * 0.38,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(doctors[index].dp),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                // textAlign: TextAlign.center,
                                doctors[index].name,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              // const SizedBox(
                              //   height: 5,
                              // ),
                              Text(
                                doctors[index].designation,
                                style: const TextStyle(color: Colors.black38),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffE8F3F1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          size: 14,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Text(
                                            " " +
                                                doctors[index]
                                                    .rating
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.black38)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 14,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Text(
                                          doctors[index].distance.toString() +
                                              " km away",
                                          style:
                                              TextStyle(color: Colors.black38),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Health Articles",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 17),
                    )
                  ],
                ),
                SizedBox(
                  height: sHeight * 0.01,
                ),
                SizedBox(
                  height: sHeight * 0.3,
                  // width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    // itemCount: doctors.length,
                    itemCount: articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticleScreen(
                                        urll: articles[index].url,
                                      )));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 6, right: 6, top: 10, bottom: 10),
                          margin: const EdgeInsets.only(bottom: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black12)),
                          width: double.maxFinite,
                          // height: sHeight * 0.1,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  articles[index].image,
                                  // height: sHeight * 0.2,
                                  // width: sWidth * 0.2,
                                  scale: 2,
                                ),
                              ),
                              SizedBox(
                                width: sWidth * 0.1,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      articles[index].name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      articles[index].source,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
