import 'package:auth_healthcare_app/Models/doctor_details.dart';
import 'package:auth_healthcare_app/View/doc_screen.dart';
import 'package:flutter/material.dart';

class BestDocsScreen extends StatefulWidget {
  const BestDocsScreen({super.key});

  @override
  State<BestDocsScreen> createState() => _BestDocsScreenState();
}

class _BestDocsScreenState extends State<BestDocsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Top Doctors",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
            itemCount: doctors.length,
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
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Row(
                    children: [
                      Image.asset(doctors[index].dp),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctors[index].name,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            doctors[index].designation,
                            style: TextStyle(color: Colors.black38),
                          ),
                          const SizedBox(
                            height: 11,
                          ),
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
                                Text(" " + doctors[index].rating.toString(),
                                    style: TextStyle(color: Colors.black38)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 14,
                                  // color: Theme.of(context).primaryColor,
                                  color: Colors.black38,
                                ),
                                Text(
                                  doctors[index].distance.toString() +
                                      " km away",
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
