import 'package:flutter/material.dart';

import 'config/routes/routes.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: Routes.routeGenerator,
  ));
}
