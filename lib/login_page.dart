import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  //giving animation to the flutter logo
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    //give controller
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    //give type of animation
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeInOutCubic,
    );

    //add the listener
    _iconAnimation.addListener(() {
      this.setState(() {});
    });

    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Login Page"),
      ),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage("assets/me.jpeg"),
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black45,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: _iconAnimation.value * 100,
                ),
                Container(
                  padding: EdgeInsets.all(40.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            // hintText: "Enter Email",
                            labelText: "Enter Email",
                            labelStyle: TextStyle(
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            // hintText: "Enter Password",
                            labelText: "Enter Password",
                            labelStyle: TextStyle(
                              fontFamily: "Cursive",
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        MaterialButton(
                          color: Colors.amber,
                          height: 50.0,
                          minWidth: 80.0,
                          onPressed: () {},
                          child: new Icon(Icons.login),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
