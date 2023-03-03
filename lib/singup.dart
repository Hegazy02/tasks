import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class singup extends StatefulWidget {
  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  bool isSec = false;
  bool isSec2 = false;
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
              shrinkWrap: true,
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
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
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
                      customtext2(
                        label: "Password",
                        isenable: isSec,
                        onPressed: () {
                          setState(() {
                            isSec = !isSec;
                          });
                        },
                      ),

                      customtext2(
                        label: "Confirm Password",
                        isenable: isSec2,
                        onPressed: () {
                          setState(() {
                            isSec2 = !isSec2;
                          });
                        },
                      ),
                      // Consumer<testProvider>(
                      //   builder: (context, value, child) {
                      //     print('!!!!!!!!!!!!!!!!!!!');
                      //     return Text(value.ins!);
                      //   },
                      // ),
                      SizedBox(
                        height: 50,
                      ),
                      customButon(
                        color: Color(0xFF4762FD),
                        txt: "Login",
                        circular: 9,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customButon(
                        txt: "Sign Up",
                        circular: 9,
                        borderColor: Color(0xFF4762FD),
                        txtColor: Color(0xFF4762FD),
                        onPressed: () =>
                            Navigator.of(context).pushReplacementNamed("home"),
                      ),
                    ],
                  ),
                )
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
  Function()? onPressed;

  customButon(
      {this.color,
      this.txt,
      this.circular,
      this.borderColor,
      this.txtColor,
      this.onPressed});
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
            onPressed: onPressed,
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

  Function()? onPressed;

  customtext2({this.label, this.icon, this.isenable, this.onPressed});

  @override
  State<customtext2> createState() => _customtext2State();
}

class _customtext2State extends State<customtext2> {
  @override
  Widget build(BuildContext context) {
    print("qqqqqqqqqqqq");
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
          suffixIcon: Consumer<testProvider>(
            builder: (context, value, child) {
              return IconButton(
                  onPressed: widget.onPressed,
                  icon: widget.isenable == false
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off));
            },
          ),
        ),
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
  bool isenabele2 = false;
  String? ins = 'www';
  changemood() {
    isenabele = !isenabele;
    // ins = "haaah?";
    notifyListeners();
  }

  changemood2() {
    isenabele2 = !isenabele2;
    // ins = "haaah?";
    print("object");
    notifyListeners();
  }

  get val => ins;
}
// بنستخدم الكنسيومر للوديجت الي هتعمل التغيير (المسئولة عنو)
//بنستخدم السيليكتور للويدجت الي هيبان فيها التغيير
//السيليكتور مش هيعمل ريبيلد للويدجت تاني لو محصلش تغيير
