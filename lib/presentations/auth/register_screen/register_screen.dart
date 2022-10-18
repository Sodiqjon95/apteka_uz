
import 'package:apteka_uz/cubits/auth/auth_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:apteka_uz/presentations/auth/widgets/phone_input_component.dart';
import 'package:apteka_uz/presentations/auth/widgets/universal_text_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final AnimationController controller;
  late final Animation colorAnimation;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    colorAnimation = ColorTween(
            begin: const Color.fromARGB(255, 33, 150, 243),
            end: const Color.fromARGB(255, 185, 224, 255))
        .animate(controller);
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: RPSCustomPainter(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.98,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        shadows: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            color: Colors.blue,
                          ),
                        ],
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 110,
                  ),

                  /// input information: email, password, confirm password
                  SizedBox(
                    height: 150,
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              labelText: "Enter your username",
                              labelStyle: const TextStyle(
                                color: Colors.blue,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: colorAnimation.value,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            controller:
                                context.read<AuthCubit>().usernameController,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.visibility,
                                color: Colors.blue,
                              ),
                              labelText: "Enter your email",
                              labelStyle: const TextStyle(color: Colors.blue),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: colorAnimation.value,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onSubmitted: (v) {},
                            controller:
                                context.read<AuthCubit>().emailController,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            textInputAction: TextInputAction.go,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.visibility,
                                color: Colors.blue,
                              ),
                              labelText: "Create password",
                              labelStyle: const TextStyle(color: Colors.blue),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: colorAnimation.value,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            controller:
                                context.read<AuthCubit>().passwordController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  /// submit
                  SizedBox(
                    child: TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        // shadowColor: MaterialStateProperty.all(MyColors.white),
                        minimumSize: MaterialStateProperty.all(
                          const Size(250, 50),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        context.read<AuthCubit>().signUp(context);
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),

                  /// already member? login
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          text: "Already Member? ",
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context
                                    .read<AuthCubit>()
                                    .changeState(SignInState()),
                              text: "Login",
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      appBar: AppBar(
        title: const Text("register"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          UniversalTextInput(
            onChanged: (String value) {},
            hintText: 'FirstName ',
            initialText: '',
            keyBoardType: TextInputType.text,
            errorText: 'Ism kiriting',
          ),
          const SizedBox(
            height: 15,
          ),
          UniversalTextInput(
            onChanged: (String value) {},
            hintText: 'LastName ',
            initialText: '',
            keyBoardType: TextInputType.text,
            errorText: 'Familya kiriting',
          ),
          const SizedBox(
            height: 15,
          ),
          UniversalTextInput(
            onChanged: (String value) {},
            hintText: 'Email',
            initialText: '',
            keyBoardType: TextInputType.emailAddress,
            errorText: 'Email kiriting',
          ),
          const SizedBox(
            height: 15,
          ),
          UniversalTextInput(
            onChanged: (String value) {},
            hintText: 'Password',
            initialText: '',
            keyBoardType: TextInputType.text,
            errorText: 'A-Z, a-z, !-#, 0-9',
          ),
          const SizedBox(
            height: 15,
          ),
          PhoneInputComponent(
            phoneText: (String value) {},
            initialValue: '',
            caption: 'phone number',
          )
        ],

      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height * 0.2993714);
    path0.quadraticBezierTo(size.width * 0.1317500, size.height * 0.2917714,
        size.width * 0.5194722, size.height * 0.2892714);
    path0.quadraticBezierTo(size.width * 0.8608611, size.height * 0.2853286,
        size.width, size.height * 0.2888286);
    path0.lineTo(size.width, 0);

    canvas.drawPath(path0, paint0);

    Paint paint1 = Paint()
      ..color = const Color.fromARGB(255, 185, 224, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path1 = Path();
    path1.moveTo(0, size.height * 0.2856571);
    path1.quadraticBezierTo(size.width * -0.0090000, size.height * 0.3129000,
        size.width * 0.0021667, size.height * 0.3130857);
    path1.quadraticBezierTo(size.width * 0.1099444, size.height * 0.3690714,
        size.width * 0.5054167, size.height * 0.3405143);
    path1.quadraticBezierTo(size.width * 0.8751111, size.height * 0.2913000,
        size.width, size.height * 0.5317571);
    path1.lineTo(size.width * 0.9998611, size.height * 0.2030571);
    path1.quadraticBezierTo(size.width * 0.7769722, size.height * 0.0694857,
        size.width * 0.4891389, size.height * 0.1974714);
    path1.cubicTo(
        size.width * 0.2906111,
        size.height * 0.2653143,
        size.width * 0.1610278,
        size.height * 0.2912143,
        0,
        size.height * 0.2856571);
    path1.close();

    canvas.drawPath(path1, paint1);

    Path path2 = Path();
    path2.moveTo(0, size.height);
    path2.lineTo(size.width, size.height);
    path2.lineTo(size.width, size.height * 0.8154286);
    path2.quadraticBezierTo(size.width * 0.7356944, size.height * 0.7767286,
        size.width * 0.4473056, size.height * 0.8633714);
    path2.quadraticBezierTo(size.width * 0.1736944, size.height * 0.9592143, 0,
        size.height * 0.9169143);

    canvas.drawPath(path2, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
