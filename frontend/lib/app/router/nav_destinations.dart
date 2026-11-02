import 'package:flutter/material.dart';

/// A primary navigation destination shown in the sidebar.
class NavDestination {
  const NavDestination(this.path, this.label, this.icon);
  final String path;
  final String label;
  final IconData icon;
}

const List<NavDestination> kNavDestinations = [
  NavDestination('/overview', 'Overview', Icons.dashboard_outlined),
  NavDestination('/scanner', 'Stock Scanner', Icons.radar_outlined),
  NavDestination('/breadth', 'Market Breadth', Icons.bubble_chart_outlined),
  NavDestination('/sectors', 'Sector Intelligence', Icons.grid_view_outlined),
  NavDestination('/signals', 'Strategy Signals', Icons.insights_outlined),
  NavDestination('/watchlists', 'Watchlists', Icons.star_outline),
  NavDestination('/telegram', 'Telegram Alerts', Icons.send_outlined),
  NavDestination('/settings', 'Settings', Icons.settings_outlined),
];
