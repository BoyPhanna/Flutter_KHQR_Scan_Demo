// ignore_for_file: empty_catches, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_bangking_ap/src/bloc/home/home_bloc.dart';
import 'package:qr_bangking_ap/src/screens/home/wigets/menu_feture.dart';
import 'package:qr_bangking_ap/src/screens/home/wigets/visa_card.dart';
import 'package:qr_bangking_ap/src/screens/route.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:quickalert/quickalert.dart';
import 'package:string_scanner/string_scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Co Mobile Banking",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple[700],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          VisaCard(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.60,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(200)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.purple, Colors.blue])),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              getScan();
                            },
                            child: const MenuFetur(
                              icon: "assets/images/accounting.png",
                              title: "លុយបង់ថ្លៃស្រា",
                            ),
                          ),
                          const MenuFetur(
                              icon: "assets/images/graduation-cap.png",
                              title: "លុយបង់សាលា")
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MenuFetur(
                            icon: "assets/images/money-transfer.png",
                            title: "វេលុយសងគេ",
                          ),
                          MenuFetur(
                              icon: "assets/images/piggy-bank.png",
                              title: "លុយទុកទិញស្រា")
                        ],
                      ),
                    ]),
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 75, 119, 230),
      bottomNavigationBar: bottonNavigationBarCustom(),
    );
  }

  BottomNavigationBar bottonNavigationBarCustom() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: const Color.fromARGB(255, 161, 206, 26),
      backgroundColor: const Color.fromARGB(255, 2, 27, 47),
      onTap: (numb) {
        if (numb == 1) {
          getScan();
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: 'Calls',
          activeIcon: Icon(
            Icons.home,
            color: Color.fromARGB(255, 161, 206, 26),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.qr_code,
            color: Colors.white,
          ),
          label: 'Camera',
          activeIcon: Icon(
            Icons.qr_code,
            color: Color.fromARGB(255, 161, 206, 26),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.question_answer,
            color: Colors.white,
          ),
          label: 'Chats',
          activeIcon: Icon(
            Icons.question_answer,
            color: Color.fromARGB(255, 161, 206, 26),
          ),
        ),
      ],
    );
  }

  Future<void> getScan() async {
    String qrCode;

    try {
      qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      List<String> txt = qrCode.split("KH");
      if (txt.length == 2) {
        List<String> txt1 = txt[1].toUpperCase().split("PHNOM PENH");
        String textWithoutNumbers = txt1[0].replaceAll(RegExp(r"\d"), "");
        String bankName = txt[0].split("@")[1].substring(
              5,
            );
        String bank = bankName.replaceAll(RegExp(r"\d"), "");
        StringScanner scanner = StringScanner(bank);
        if (scanner.scan("ABA Bank")) {
          bank = "ABA Bank";
        } else if (scanner.scan("Phnom Penh Commercial Bank")) {
          bank = "PPC Bank";
        } else {}

        context
            .read<HomeBloc>()
            .add(HomeAccountName(bankName: bank, name: textWithoutNumbers));
        Navigator.pushNamed(context, AppRoute.caseOut);
      } else if (qrCode == "") {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'QR code មានបញ្ហា',
          text: 'សូមមេត្ដាព្យាយាមម្ដងទៀត',
        );
        context.read<HomeBloc>().add(HomeAccountName(name: "", bankName: ""));
      }
    } on PlatformException {
    } on Exception {
      return;
    }
  }
}
