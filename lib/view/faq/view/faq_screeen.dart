import 'package:flutter/material.dart';

List<String> title = [
  "Cihaz bilgisini kaç kere sıfırlayabilirim?",
  "Neden cihaz eşleştirme hatası alıyorum?",
  "Bilgilerim doğru olmasına rağmen neden giriş yapamıyorum?"
];
List<String> subtitle = [
  "Cihaz bilgisini sıfırlama işlemini haftada bir kez yapabilirsiniz.",
  "Uygulamayı silip tekrar yüklemeniz veya başka cihazdan girmeniz halinde cihaz eşleştirme hatası alırsınız.",
  "Giriş ekranında öğrenciyseniz 'Öğrenci', akademisyen iseniz 'Akademisyen' seçeneğini seçtiğinizden emin olun."
];

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SSS"),
      ),
      body: _FAQScreenView(),
    );
  }
}

class _FAQScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: ((context, index) {
        return ListTile(
          leading: const Icon(Icons.info),
          title: Text(title[index], style: Theme.of(context).textTheme.bodyMedium,),
          subtitle: Text(subtitle[index]),
        );
      }),
    );
  }
}
