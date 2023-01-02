import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_attendance/view/login/validation/login_validation.dart';
import 'package:qr_attendance/view/widgets/src/custom_alert_dialog.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biruni Üniversitesi"),
        centerTitle: true,
      ),
      body: const LoginScreenView(),
    );
  }
}

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: [
          _BiruniLogo(),
          _LoginForm(),
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

class _LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogiFormState();
  }
}

class _LogiFormState extends State<_LoginForm> {
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();

  var isChecked = false;

  Widget _mailBox() {
    return TextField(
      controller: _mailController,
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
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).errorColor, width: 3.0),
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

  Widget _passwordBox() {
    return TextField(
      controller: _passwordController,
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
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).errorColor, width: 3.0),
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

  Widget _rememberMe() {
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

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          var loginValidation = LoginValidation(mailBoxInput: _mailController.value.text, passwordBoxInput: _passwordController.value.text);
          if(loginValidation.errorMsg.isNotEmpty){
            showDialog(context: context, builder: (_) => CustomAlertDialog(alertText: loginValidation.errorMsg,));
          }
        },
        child: const Text("Giriş Yap"),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _mailBox(),
        const SizedBox(
          height: 12,
        ),
        _passwordBox(),
        _rememberMe(),
        _loginButton(),
      ],
    );
  }
}
