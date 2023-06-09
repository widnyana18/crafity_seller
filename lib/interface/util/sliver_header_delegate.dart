import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
    Widget collapseChild,
  }) : this.collapseChild = collapseChild ?? child;

  final double minHeight;
  final double maxHeight;
  final Widget collapseChild;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: Material(
        color: Colors.white,
        elevation: shrinkOffset == maxExtent ? 12 : 0,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: shrinkOffset == maxExtent ? collapseChild : child,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child ||
        collapseChild != oldDelegate.collapseChild;
  }
}
