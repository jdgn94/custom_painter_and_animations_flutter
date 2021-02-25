import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool indicatorTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  const Slideshow({
    @required this.slides,
    this.indicatorTop = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12.0,
    this.secondaryBullet = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SlideshowModel>(context).primaryColor =
                this.primaryColor;
            Provider.of<_SlideshowModel>(context).secondaryColor =
                this.secondaryColor;
            Provider.of<_SlideshowModel>(context).primaryBullet =
                this.primaryBullet;
            Provider.of<_SlideshowModel>(context).secondaryBullet =
                this.secondaryBullet;

            return Column(
              children: [
                if (indicatorTop) _Dots(this.slides.length),
                Expanded(
                  child: _Slides(this.slides),
                ),
                if (!indicatorTop) _Dots(this.slides.length),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(10),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(
    this.totalSlides,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);

    final dotActive =
        ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5;

    return AnimatedContainer(
      duration: Duration(microseconds: 1000),
      width: dotActive ? ssModel.primaryBullet : ssModel.secondaryBullet,
      height: dotActive ? ssModel.primaryBullet : ssModel.secondaryBullet,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: dotActive ? ssModel.primaryColor : ssModel.secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => this._currentPage;
  set currentPage(double page) {
    this._currentPage = page;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor(Color color) {
    this._secondaryColor = color;
  }

  double get primaryBullet => this._primaryBullet;
  set primaryBullet(double value) {
    this._primaryBullet = value;
  }

  double get secondaryBullet => this._secondaryBullet;
  set secondaryBullet(double value) {
    this._secondaryBullet = value;
  }
}
