import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_bangking_ap/src/bloc/home/home_bloc.dart';
import 'package:qr_bangking_ap/src/screens/route.dart';

class CaseOut extends StatefulWidget {
  const CaseOut({super.key});

  @override
  State<CaseOut> createState() => _CaseOutState();
}

class _CaseOutState extends State<CaseOut> {
  final moneyControler = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moneyControler.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "KHQR",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple[700],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "សូមបញ្ចូលចំនួនទឹកប្រាក់",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Text(
                        "វេទៅឲ្យ : ${state.accountName}",
                        style: TextStyle(fontSize: 25),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Text(
                        "ធានាគារ : ${state.bankName}",
                        style: TextStyle(fontSize: 25),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: moneyControler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text(
                  "លុយដុល្លា",
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (moneyControler.text != "") {
                  context
                      .read<HomeBloc>()
                      .add(HomeEventCaseOut(double.parse(moneyControler.text)));
                  Navigator.pushNamed(context, AppRoute.conferm);
                }
              },
              child: Text("គិតលុយ"),
            ),
          ],
        ),
      ),
    );
  }
}
