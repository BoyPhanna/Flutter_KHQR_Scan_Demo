// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_bangking_ap/src/bloc/home/home_bloc.dart';
import 'package:qr_bangking_ap/src/screens/route.dart';

class ConferScreen extends StatefulWidget {
  const ConferScreen({super.key});

  @override
  State<ConferScreen> createState() => _ConferScreenState();
}

class _ConferScreenState extends State<ConferScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Lottie.asset(
                    'assets/gifs/icons8-done.json',
                    controller: _controller,
                    onLoaded: (composition) {
                      _controller.forward();
                    },
                  ),
                ),
              ),
              Text(
                "ការទូរទាត់ប្រាក់ជោគជ័យ",
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "លេខគណនីវេចេញ :",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                " 032514646",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "លេខគណនីទទួល :",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  " 032514646",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 35, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ឈ្មោះ :",
                  style: TextStyle(fontSize: 20),
                ),
                BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  return Text(
                    "${state.accountName}",
                    style: TextStyle(fontSize: 20),
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 35, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ទឹកប្រាក់ចំនួន :",
                  style: TextStyle(fontSize: 20),
                ),
                BlocBuilder<HomeBloc, HomeState>(builder: ((context, state) {
                  return Text(
                    " ${state.money} ដុល្លា",
                    style: TextStyle(fontSize: 20),
                  );
                })),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 35, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "កម្រៃសេវា :",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  " 0 ដុល្លា",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 35, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ទៅកាន់ធានាគារ :",
                  style: TextStyle(fontSize: 20),
                ),
                BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  return Text(
                    "${state.bankName}",
                    style: TextStyle(fontSize: 20),
                  );
                }),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.home);
              },
              child: Text("យល់ព្រមគ្រប់ករណី")),
        ],
      ),
    );
  }
}
