part of responsive_layout;

extension Factor on num {
  /// Multiplies the number by a platform factor defined in [ResponsiveLayoutData].
  double get f => ResponsiveLayoutData().factor * this;
}
