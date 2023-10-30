import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  double _buttonradius = 100;

  final Tween<double> _backgroundscale = Tween<double>(begin: 0.0, end: 1.0);

  AnimationController? _stariconcontroller;

  @override
  void initState() {
    super.initState();
    _stariconcontroller = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 4,
        ));
    _stariconcontroller!.repeat();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pagebackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _circularanimationbtn(),
                _staricon(),
              ],
            ),
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

  Widget _staricon() {
    return AnimatedBuilder(
      animation: _stariconcontroller!.view,
      builder: (_buildContext, _child) {
        return Transform.rotate(
          angle: _stariconcontroller!.value * 2 * 3.14,
          child: _child,
        );
      },
      child: Icon(
        Icons.star,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
