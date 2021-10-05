part of 'responsive_layout.dart';

typedef Builder = Widget Function(
  BuildContext context,
  BoxConstraints constraints,
);

class ResponsiveLayoutBuilder extends StatelessWidget {
  final BuildContext context;
  final Builder mobile;
  final PlatformFactor? platformFactor;
  final bool init;
  final Builder? tablet;
  final Builder? desktop;

  const ResponsiveLayoutBuilder({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
    required this.context,
    this.platformFactor,
    this.init = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final orientation = constraints.maxHeight > constraints.maxWidth
          ? Orientation.landscape
          : Orientation.portrait;
      if (init) {
        ResponsiveLayoutData.init(
            constraints: constraints,
            context: context,
            orientation: orientation,
            platformFactor: platformFactor ?? const PlatformFactor());
      }
      final responsiveLayoutData = ResponsiveLayoutData();
      if (responsiveLayoutData.deviceType == DeviceType.largeMobile ||
          responsiveLayoutData.deviceType == DeviceType.smallMobile) {
        return mobile(context, constraints);
      } else if (responsiveLayoutData.deviceType == DeviceType.desktop) {
        print('desktop !');
        return desktop == null
            ? mobile(
                context,
                constraints,
              )
            : desktop!(
                context,
                constraints,
              );
      } else {
        print('tablet');
        return tablet == null
            ? mobile(
                context,
                constraints,
              )
            : tablet!(
                context,
                constraints,
              );
      }
    });
  }
}
