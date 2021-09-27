import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class Car3DModel extends StatefulWidget {
  @override
  _Car3DModelState createState() => _Car3DModelState();
}

class _Car3DModelState extends State<Car3DModel> {
  void _onSceneCreated(Scene scene) {
    scene.camera.position.z = 10;
    scene.camera.target.y = 0;
    // from https://sketchfab.com/3d-models/ruby-rose-2270ee59d38e409491a76451f6c6ef80
    scene.world.add(Object(
        scale: Vector3(10.0, 10.0, 10.0),
        fileName: 'assets/3d_models/suv2/3.obj'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("SUV"),
      ),
      body: Center(
        child: Cube(
          onSceneCreated: _onSceneCreated,
        ),
      ),
    );
  }
}
