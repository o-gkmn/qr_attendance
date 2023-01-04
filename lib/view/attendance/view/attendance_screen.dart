import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AttendanceScreenView(),
    );
  }
}

class AttendanceScreenView extends StatelessWidget {
  const AttendanceScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(),
        const Spacer(flex: 1),
        _Body(),
        const Spacer(flex: 1),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.help, color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person, color: Colors.white)),
            ],
          ),
          Text(
            "Özgür Gökmen",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Bilgisayar Mühendisliği",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  void _showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7,
          builder: (context, controller) {
            return Column(
              children: [
                //Divider
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey),
                ),
                //QR textlerinin olduğu kısım
                Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor),
                    child: Expanded(
                      child: Column(
                        children: [
                          Text(
                            "QR Kodu Okutun",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.black, fontSize: 16),
                          ),
                          const Spacer(flex: 1),
                          Text(
                            "Qr kodunu belirlenen alana ortalayacak şekilde hizalayın",
                            style: Theme.of(context).textTheme.caption,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    )),
                Container(
                  height: 227,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _showSheet(context);
      },
      child: Column(
        children: [
          Icon(
            Icons.qr_code_scanner,
            size: MediaQuery.of(context).size.height * 0.25,
            color: Theme.of(context).primaryColor,
          ),
          Text("Okutmak için tıklayın",
              style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
    );
  }
}
