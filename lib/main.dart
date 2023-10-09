import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp() {
    // Implement your signup logic here
    String email = _emailController.text;
    String password = _passwordController.text;

    // Add your authentication logic here, such as calling an API
    print('Email: $email, Password: $password');

    // For simplicity, just navigate to a success page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpSuccessPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
                baseColor: Colors.blue, //
                spawnOpacity: 0.0, //
                minOpacity: 0.1, //
                spawnMinSpeed: 10.0, //
                spawnMaxSpeed: 70.0, //
                spawnMinRadius: 7.0,
                spawnMaxRadius: 15.0, //
                particleCount: 40, //
                image: Image(image: AssetImage('assets/alien.png')))),
        vsync: this,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _signUp,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Success'),
      ),
      body: Center(
        child: Text('Sign up successful!'),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.elevation = 2.0,
  }) : super(key: key);
  final Widget? title;
  final Widget? leading;
  final double elevation;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              0.27,
              1.0,
            ],
            colors: [
              Color.fromARGB(255, 16, 16, 16),
              Color.fromARGB(255, 53, 52, 53),
              Color.fromARGB(255, 113, 113, 113),
            ],
          ),
        ),
        child: AppBar(
          centerTitle: true,
          leading: leading,
          elevation: 0.0,
          title: Text("Demo Sign up with Animation"),
          backgroundColor: Colors.transparent,
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
