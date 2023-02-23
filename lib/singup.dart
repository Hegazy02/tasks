import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
        create: (context) => testProvider(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            child: ListView(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: curvePainter(),
                      ),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        customtextfield1(
                          label: "Email",
                          icon: Icon(Icons.email),
                          inputtype: TextInputType.emailAddress,
                        ),
                        customtextfield1(
                          label: "Phone",
                          icon: Icon(Icons.phone),
                          inputtype: TextInputType.phone,
                        ),
                        Consumer<testProvider>(
                          builder: (context, value, child) {
                            return customtext2(
                              label: "Password",
                              isenable: value.isenabele,
                              change: value.changemood,
                            );
                          },
                        ),
                        Consumer<testProvider>(
                          builder: (context, value, child) {
                            return customtext2(
                              label: "Confirm Password",
                              isenable: value.isenabele,
                              change: value.changemood,
                            );
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        customButon(
                          color: Color(0xFF4762FD),
                          txt: "Login",
                          circular: 9,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customButon(
                          txt: "Sign Up",
                          circular: 9,
                          borderColor: Color(0xFF4762FD),
                          txtColor: Color(0xFF4762FD),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class customButon extends StatelessWidget {
  String? txt;
  Color? txtColor;
  Color? color;
  Color? borderColor;
  double? circular;
  customButon(
      {this.color, this.txt, this.circular, this.borderColor, this.txtColor});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(circular!)),
                side: BorderSide(color: borderColor ?? Colors.white),
                backgroundColor: color ?? Colors.white),
            onPressed: () {},
            child: Container(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    txt!,
                    style: TextStyle(color: txtColor ?? Colors.white),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

class customtextfield1 extends StatelessWidget {
  String? label;
  Icon? icon;
  TextInputType? inputtype;
  customtextfield1({this.label, this.icon, this.inputtype});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: inputtype,
        style: TextStyle(color: Color(0xFF4762FD)),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon,
          filled: true,
          fillColor: Color.fromARGB(255, 239, 240, 244),
          disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.white)),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.white)),
        ),
      ),
    );
  }
}

class customtext2 extends StatefulWidget {
  String? label;
  bool? isenable;
  Icon? icon;
  Function? change;
  customtext2({this.label, this.icon, this.isenable, this.change});

  @override
  State<customtext2> createState() => _customtext2State();
}

class _customtext2State extends State<customtext2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        style: TextStyle(color: Color(0xFF4762FD)),
        obscureText: widget.isenable == true ? false : true,
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Color.fromARGB(255, 239, 240, 244),
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 0, color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 0, color: Colors.white)),
            labelText: widget.label,
            prefixIcon: Icon(
              Icons.lock,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  widget.change!();
                },
                icon: widget.isenable == false
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off))),
      ),
    );
  }
}

class curvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ////////////////
    var paint = Paint();
    paint.color = Color(0xFF4762FD);
    paint.style = PaintingStyle.fill;
    // paint.strokeWidth = 2.0;
    ///////////
    var path = Path();

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.75,
        size.width * 0.3, size.height * 0.8);

    path.quadraticBezierTo(size.width * 0.7, size.height * 0.97,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class testProvider extends ChangeNotifier {
  bool isenabele = false;
  changemood() {
    isenabele = !isenabele;
    notifyListeners();
  }
}
