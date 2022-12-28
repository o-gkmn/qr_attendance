import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yoklama Sistemi"),
        centerTitle: true,
      ),
      body: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: [
          _BiruniLogo(),
          const Text("Oturum Açın"),
          const Spacer(
            flex: 2,
          ),
          _MailBox(),
          const SizedBox(
            height: 12,
          ),
          _PasswordBox(),
          _RememberMe(),
          _LoginButton(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

class _BiruniLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
        backgroundImage: AssetImage('assets/biruni_logo.jpg'),
        radius: 125);
  }
}

class _MailBox extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        labelText: "Email",
        labelStyle: Theme.of(context).textTheme.labelMedium,
        prefixIcon: Icon(
          Icons.mail,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}

class _PasswordBox extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        labelText: "Şifre",
        labelStyle: Theme.of(context).textTheme.labelMedium,
        prefixIcon: Icon(
          Icons.password,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      obscureText: true,
    );
  }
}

class _RememberMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: ListTile(
        title: const Text("Beni Hatırla"),
        leading: Radio(
            value: "RemeberMe",
            groupValue: "remember",
            onChanged: (String? value) {}),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {},
        child: const Text("Giriş Yap"),
      ),
    );
  }
}
