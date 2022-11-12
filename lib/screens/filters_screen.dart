import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  static const routeName = "/filters";
  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subTitle, bool currentVal, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () {
                widget.saveFilters({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                });
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchListTile(
                  "Gluten-Free", "only contain gluten free meals", _glutenFree,
                  (newVal) {
                setState(() {
                  _glutenFree = newVal;
                });
              }),
              _buildSwitchListTile("Lactose-Free",
                  "only contain lactose free meals", _lactoseFree, (newVal) {
                setState(() {
                  _lactoseFree = newVal;
                });
              }),
              _buildSwitchListTile(
                  "Vegetarian", "only contain vegetarian meals", _vegetarian,
                  (newVal) {
                setState(() {
                  _vegetarian = newVal;
                });
              }),
              _buildSwitchListTile("Vegan", "only contain vegan meals", _vegan,
                  (newVal) {
                setState(() {
                  _vegan = newVal;
                });
              }),
            ],
          ),
        )
      ]),
    );
  }
}
