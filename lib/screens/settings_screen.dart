import 'package:flutter/material.dart';
import 'package:refeicoes/components/main_drawer.dart';
import 'package:refeicoes/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen({
    required this.onSettingsChanged,
    required this.settings,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Configurações",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  "Sem Glutten",
                  "Só exibe Refeições sem glutten",
                  settings!.isGlutenFree!,
                  (value) => setState(() => settings?.isGlutenFree = value),
                ),
                _createSwitch(
                  "Sem lacotose",
                  "Só exibe Refeições sem Lactose",
                  settings!.isLactoseFree!,
                  (value) => setState(() => settings?.isLactoseFree = value),
                ),
                _createSwitch(
                  "Sem Vegana",
                  "Só exibe Refeições Veganas",
                  settings!.isVegan!,
                  (value) => setState(() => settings?.isVegan = value),
                ),
                _createSwitch(
                  "Sem Vegetariana",
                  "Só exibe Refeições Vegetariana",
                  settings!.isVegetarian!,
                  (value) => setState(() => settings?.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
