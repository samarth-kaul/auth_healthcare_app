import 'package:auth_healthcare_app/models/doctor_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Find your desired\nhealth solution",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {
                        print("bell icon pressed");
                      },
                      icon: const Icon(
                        Icons.notifications_rounded,
                        size: 33,
                      ))
                ],
              ),
              // Row(
              //   children: [
              //     Image.asset("assets/images/Doctor.png"),
              //     Image.asset("assets/images/Pharmacy.png"),
              //     Image.asset("assets/images/Hospital.png"),
              //     Image.asset("assets/images/Ambulance.png"),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_hospital_rounded),
                  Icon(Icons.local_hospital_rounded),
                  Icon(Icons.local_hospital_rounded),
                  Icon(Icons.local_hospital_rounded),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: doctors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 6, right: 6, top: 10, bottom: 10),
                      margin: const EdgeInsets.only(right: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black45)),
                      width: sWidth * 0.38,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            doctors[index].dp,
                            // height: sHeight * 0.2,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            doctors[index].name,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600),
                          ),
                          Text(doctors[index].designation),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                color: Color(0xffE8F3F1),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      size: 14,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Text(" " + doctors[index].rating.toString(),
                                        style:
                                            TextStyle(color: Colors.black38)),
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
                                          "km away",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
