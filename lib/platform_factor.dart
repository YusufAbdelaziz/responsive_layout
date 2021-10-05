part of 'responsive_layout.dart';

class PlatformFactor {
  final double desktop;
  final double tablet;
  final double smallMobile;
  final double largeMobile;

  const PlatformFactor(
      {this.desktop = 2.5,
      this.tablet = 1.8,
      this.smallMobile = 1,
      this.largeMobile = 1.25});
}
