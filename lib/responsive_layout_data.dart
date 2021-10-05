part of responsive_layout;

enum DeviceType { smallMobile, largeMobile, tablet, desktop }

const kTabletBreakpoint = 768.0;
const kDesktopBreakpoint = 1100.0;

class ResponsiveLayoutData {
  static late ResponsiveLayoutData _instance;

  late BoxConstraints _constraints;
  late DeviceType _deviceType;
  late Orientation _orientation;
  late double _factor;

  ResponsiveLayoutData._();

  factory ResponsiveLayoutData() {
    return _instance;
  }

  static void init(
      {Orientation orientation = Orientation.portrait,
      required BuildContext context,
      required BoxConstraints constraints,
      required PlatformFactor platformFactor}) {
    _instance = ResponsiveLayoutData._()
      .._orientation = orientation
      .._factor = _definePlatformFactor(constraints, platformFactor)
      .._constraints = constraints
      .._deviceType = _mapSizeToDeviceType(constraints);
  }

  DeviceType get deviceType => _instance._deviceType;

  Orientation get orientation => _instance._orientation;

  // Returns a factor for a specific platform.
  double get factor => _instance._factor;

  double get screenHeight => _instance._constraints.maxHeight;

  double get screenWidth => _instance._constraints.maxWidth;

  // static bool _isSmallMobile(BuildContext context) =>
  //     _mediaQuerySize(context).width < kTabletBreakpoint &&
  //     _mediaQuerySize(context).height < 750;

  static bool _isLargeMobile(BoxConstraints constraints) =>
      constraints.maxWidth < kTabletBreakpoint;

  static bool _isTablet(BoxConstraints constraints) =>
      constraints.maxWidth >= kTabletBreakpoint;

  static bool _isDesktop(BoxConstraints constraints) =>
      constraints.maxWidth >= kDesktopBreakpoint;

  static double _definePlatformFactor(
      BoxConstraints constraints, PlatformFactor factor) {
    if (_isDesktop(constraints))
      return factor.desktop;
    else if (_isTablet(constraints))
      return factor.tablet;
    else if (_isLargeMobile(constraints))
      return factor.largeMobile;
    else
      return factor.smallMobile;
  }

  static DeviceType _mapSizeToDeviceType(BoxConstraints constraints) {
    if (_isDesktop(constraints))
      return DeviceType.desktop;
    else if (_isTablet(constraints))
      return DeviceType.tablet;
    else if (_isLargeMobile(constraints))
      return DeviceType.largeMobile;
    else
      return DeviceType.smallMobile;
  }
}
