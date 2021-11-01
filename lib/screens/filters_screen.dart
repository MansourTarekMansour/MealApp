import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filter_screen';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  const FiltersScreen(this.currentFilter, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  initState(){
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegetarian'];
    _vegetarian = widget.currentFilter['vegan'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> selectFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectFilters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile('Gluten Free',
                    "only include gluten free meals.", _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                buildSwitchListTile('Lactose Free',
                    "only include Lactose free meals.", _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', "only include vegetarian meals", _vegetarian,
                    (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                buildSwitchListTile('Vegan', "only include vegan meals", _vegan,
                    (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
