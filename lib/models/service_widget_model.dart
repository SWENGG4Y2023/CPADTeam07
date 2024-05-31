import 'package:flutter/material.dart';

class ServiceWidget {
  final String _name;
  final Widget _icon;
  final Function _navigateToService;

  ServiceWidget(this._name, this._icon, this._navigateToService);

  String get name => _name;
  Widget get icon => _icon;
  Function get navigateToService => _navigateToService;
}
