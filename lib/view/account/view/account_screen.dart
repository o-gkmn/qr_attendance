import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap"),
      ),
      body: _AccountScreenView(),
    );
  }
}

class _AccountScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 44.0),
            child: Row(children: const [Text("Ad:"), Spacer(), Text("ÖZGÜR")]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 44.0),
            child: Row(children: const [Text("Soyad:"), Spacer(), Text("Gökmen")]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 44.0),
            child: Row(children: const [
              Text("Fakülte:"),
              Spacer(),
              Text("Mühendislik ve Doğa Bilimleri Fakültesi")
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 22.0),
            child: Row(children: const [Text("Bölüm:"), Spacer(), Text("Bilgisayar Mühendisliği")]),
          ),
          TextButton(onPressed: () {}, child: const Text("Çıkış Yap")),
        ],
      ),
    );
  }
}
