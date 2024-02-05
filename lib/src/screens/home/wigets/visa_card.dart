import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_bangking_ap/src/bloc/home/home_bloc.dart';

class VisaCard extends StatelessWidget {
  const VisaCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 140, 67, 236),
                    Color.fromARGB(255, 15, 41, 238),
                  ],
                ),
                color: Color.fromARGB(255, 80, 63, 239),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Visa Platinum",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 231, 220, 220)),
                        ),
                        Transform.rotate(
                            angle: pi / 4,
                            child: Icon(
                              Icons.wifi,
                            )),
                      ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(),
                            Image(
                              image: AssetImage(
                                "assets/images/chip.png",
                              ),
                              width: 50,
                              height: 50,
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "0325-56448-999",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              return Text(
                                "${state.amount} USD",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kim Phanna",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[350]),
                        ),
                        Column(
                          children: [
                            Text(
                              "Visa",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text("Platinum")
                          ],
                        )
                      ]),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
