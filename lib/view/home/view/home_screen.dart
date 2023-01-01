import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_attendance/view/home/validation/validation.dart';

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

class _LogiFormState extends State<_LoginForm>
    with TickerProviderStateMixin, ValidationMixin {
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var isChecked = false;

  Widget _mailBox() {
    return TextFormField(
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
      validator: mailBoxValidation,
    );
  }

  Widget _passwordBox() {
    return TextFormField(
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
      validator: passwordBoxValidation,
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
          if (_formKey.currentState != null &&
              _formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _formKey.currentState!.reset();
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _mailBox(),
          const SizedBox(
            height: 12,
          ),
          _passwordBox(),
          _rememberMe(),
          _loginButton(),
        ],
      ),
    );
  }
}
