import 'package:flutter/material.dart';

class SearchBeer extends StatefulWidget {
  final Function(String) onChanged;

  const SearchBeer({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SearchBeer> createState() => _SearchBeerState();
}

class _SearchBeerState extends State<SearchBeer> {
  late final TextEditingController _editingController;

  @override
  void initState() {
    _editingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      onChanged: widget.onChanged,
      controller: _editingController,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search beers',
      ),
    );
  }
}
