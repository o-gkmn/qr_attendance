import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biruni Üniversitesi"),
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
          _MailBox(),
          const SizedBox(
            height: 12,
          ),
          _PasswordBox(),
          _RememberMe(),
          _LoginButton(),
        ],
      ),
    );
  }
}

class _BiruniLogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BiruniLogoState();
  }
}

class _BiruniLogoState extends State<_BiruniLogo>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    //animation controller was declared. this provides control on animation
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    //this makes the animation repeat
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight!;
    double radius = height / (2 * pi);
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //this makes rotation animation
          RotationTransition(
            //this generate turns between 0 and 1
            turns: Tween<double>(begin: 0.0, end: 1.0).animate(_controller),
            child: CircleAvatar(
                backgroundImage: const AssetImage('assets/biruni_logo.jpg'),
                radius: radius),
          ),
          Text(
            "Oturum Açın",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
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
        prefixIcon: Icon(
          Icons.password,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      obscureText: true,
    );
  }
}

class _RememberMe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RememberMeState();
  }
}

class _RememberMeState extends State {
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: Colors.blue,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
              });
            }),
        const Text("Beni Hatırla"),
      ],
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
