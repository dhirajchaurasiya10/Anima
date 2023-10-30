import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _buttonradius = 100;

  final Tween<double> _backgroundscale = Tween<double>(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pagebackground(),
            _circularanimationbtn(),
          ],
        ),
      ),
    );
  }

  Widget _pagebackground() {
    return TweenAnimationBuilder(
      tween: _backgroundscale,
      duration: Duration(seconds: 2),
      builder: (_context, double _scle, _child) {
        return Transform.scale(
          scale: _scle,
          child: _child,
        );
      },
      child: Container(
        color: Colors.blueAccent,
      ),
    );
  }

  Widget _circularanimationbtn() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonradius += _buttonradius == 200 ? -100 : 100;
          });
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.bounceInOut,
          height: _buttonradius,
          width: _buttonradius,
          decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(
                100,
              )),
          child: Center(
            child: Text(
              "Basic",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
