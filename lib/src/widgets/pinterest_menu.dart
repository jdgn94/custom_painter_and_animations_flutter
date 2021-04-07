import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool show;
  final List<PinterestButton> items = [
    PinterestButton(
      icon: Icons.pie_chart,
      onPressed: () => print('Icon pie_chart'),
    ),
    PinterestButton(
      icon: Icons.search,
      onPressed: () => print('Icon search'),
    ),
    PinterestButton(
      icon: Icons.notifications,
      onPressed: () => print('Icon notifications'),
    ),
    PinterestButton(
      icon: Icons.supervised_user_circle,
      onPressed: () => print('Icon supervised_user_circle'),
    ),
  ];

  PinterestMenu({this.show = true});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: show ? 1 : 0,
        child: _PinterestMenuBackground(
          child: _MenuItem(items),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
        ],
      ),
      child: child,
    );
  }
}

class _MenuItem extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItem(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(menuItems.length,
          (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSelected = Provider.of<_MenuModel>(context).itemSeleced;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleced = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: itemSelected == index ? 35 : 25,
          color: itemSelected == index ? Colors.black : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;

  int get itemSeleced => this._itemSelected;

  set itemSeleced(int index) {
    this._itemSelected = index;
    notifyListeners();
  }
}
