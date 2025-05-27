import 'package:flutter/material.dart';

abstract class BorderRadiusAttribute {
  static BorderRadius all(double radius) {
    return BorderRadius.circular(radius);
  }

  static BorderRadius top(double radius) {
    return BorderRadius.vertical(
      top: Radius.circular(radius),
    );
  }

  static BorderRadius bottom(double radius) {
    return BorderRadius.vertical(
      bottom: Radius.circular(radius),
    );
  }

  static BorderRadius right(double radius) {
    return BorderRadius.horizontal(
      right: Radius.circular(radius),
    );
  }

  static BorderRadius left(double radius) {
    return BorderRadius.horizontal(
      left: Radius.circular(radius),
    );
  }

  static BorderRadius onlyTop(double topLeft, double topRight) {
    return BorderRadius.only(
        topLeft: Radius.circular(topLeft), topRight: Radius.circular(topRight));
  }

  static BorderRadius onlyBottom(double bottomLeft, double bottomRight) {
    return BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight));
  }

  static BorderRadius onlyRight(double topRight, double bottomRight) {
    return BorderRadius.only(
        topRight: Radius.circular(topRight),
        bottomRight: Radius.circular(bottomRight));
  }

  static BorderRadius onlyLeft(double topLeft, double bottomLeft) {
    return BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        bottomLeft: Radius.circular(bottomLeft));
  }

  static BorderRadius topRight(double radius) {
    return BorderRadius.only(
      topRight: Radius.circular(radius),
    );
  }

  static BorderRadius topLeft(double radius) {
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
    );
  }

  static BorderRadius bottomLeft(double radius) {
    return BorderRadius.only(
      bottomLeft: Radius.circular(radius),
    );
  }

  static BorderRadius bottomRight(double radius) {
    return BorderRadius.only(
      bottomRight: Radius.circular(radius),
    );
  }
}

abstract class RoundedRectangleBorderAttribute {
  static RoundedRectangleBorder all(double radius) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  static RoundedRectangleBorder top(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(radius),
    ));
  }

  static RoundedRectangleBorder bottom(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(radius),
    ));
  }

  static RoundedRectangleBorder right(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
      right: Radius.circular(radius),
    ));
  }

  static RoundedRectangleBorder left(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
      left: Radius.circular(radius),
    ));
  }

  static RoundedRectangleBorder onlyTop(double topLeft, double topRight) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight)));
  }

  static RoundedRectangleBorder onlyBottom(
      double bottomLeft, double bottomRight) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight)));
  }

  static RoundedRectangleBorder onlyRight(double topRight, double bottomRight) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(topRight),
            bottomRight: Radius.circular(bottomRight)));
  }

  static RoundedRectangleBorder onlyLeft(double topLeft, double bottomLeft) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft)));
  }

  static RoundedRectangleBorder topRight(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topRight: Radius.circular(radius),
    ));
  }

  static RoundedRectangleBorder topLeft(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radius),
    ));
  }

  static RoundedRectangleBorder bottomLeft(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(radius),
    ));
  }

  static RoundedRectangleBorder bottomRight(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(radius),
    ));
  }
}
