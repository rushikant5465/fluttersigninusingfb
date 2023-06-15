import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../modals/animal.dart';

class MultiSelect extends StatefulWidget {
  final List<Animal> animals;
 final  VoidCallbackAction selectedItem;
  final String title;

  const MultiSelect({
    Key? key,
    required List<Animal> this.animals,  required this.title, required this.selectedItem,
  }) : super(key: key);

  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  @override
  Widget build(BuildContext context) {
    final _items = widget.animals
        .map((animal) => MultiSelectItem<Animal>(animal, animal.name!))
        .toList();
    return Container(
      child: MultiSelectDialogField(
        items: _items,
        title:Text(widget.title),
        selectedColor: Colors.blue,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
        ),
        buttonIcon: const Icon(
          Icons.pets,
          color: Colors.blue,
        ),
        buttonText: Text(
          "Favorite Animals",
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 16,
          ),
        ),
        onConfirm: (results) {
          //_selectedAnimals = results;
        },
      ),
    );
  }
}
