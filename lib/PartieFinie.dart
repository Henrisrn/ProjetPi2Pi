import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PartieFinie extends StatefulWidget {
  const PartieFinie({super.key});

  @override
  State<PartieFinie> createState() => _PartieFinieState();
}

class _PartieFinieState extends State<PartieFinie> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Text("La partie est fini"),
    ));
  }
}
