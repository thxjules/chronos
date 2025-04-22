import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:chronos/database_helper.dart'; 

class UsuariosJsonScreen extends StatefulWidget {
  @override
  _UsuariosJsonScreenState createState() => _UsuariosJsonScreenState();
}

class _UsuariosJsonScreenState extends State<UsuariosJsonScreen> {
  String _jsonData = 'Cargando...';

  @override
  void initState() {
    super.initState();
    _loadUsuarios();
  }

  Future<void> _loadUsuarios() async {
    final usuarios = await DatabaseHelper.instance.getAllUsers();
    final jsonString = JsonEncoder.withIndent('  ').convert(usuarios);
    setState(() {
      _jsonData = jsonString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuarios en JSON')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: SelectableText(
          _jsonData,
          style: TextStyle(fontSize: 14, fontFamily: 'monospace'),
        ),
      ),
    );
  }
}
