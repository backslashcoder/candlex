import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

/// Standard scrollable page container with consistent gutters (16px side
/// gutter preserved down to mobile).
class PageScaffold extends StatelessWidget {
  const PageScaffold({
    super.key,
    required this.child,
    this.scrollable = true,
    this.padding,
  });

  final Widget child;
  final bool scrollable;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final pad = padding ?? const EdgeInsets.all(AppSpacing.lg);
    if (!scrollable) {
      return Padding(padding: pad, child: child);
    }
    return SingleChildScrollView(
      padding: pad,
      child: child,
    );
  }
}
