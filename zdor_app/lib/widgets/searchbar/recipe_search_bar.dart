import 'package:flutter/material.dart';
import 'package:zdor_app/widgets/style/constant.dart';

class RecipeSearchBar extends StatefulWidget {
  final TextEditingController
      searchController; // Controller per il campo di ricerca
  final Function(String)
      onSearch; // Funzione chiamata quando si avvia una ricerca
  final Function(bool)
      onFocusChanged; // Funzione chiamata quando lo stato di focus cambia

  const RecipeSearchBar({
    super.key,
    required this.searchController,
    required this.onSearch,
    required this.onFocusChanged,
  });

  @override
  _RecipeSearchBarState createState() => _RecipeSearchBarState();
}

class _RecipeSearchBarState extends State<RecipeSearchBar> {
  bool _isFocused = false; // Flag per indicare se il campo di ricerca ha lo stato di focus attivo

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: widget.searchController,
        cursorColor: kWhiteColor,
        style: const TextStyle(color: kWhiteColor, fontSize: 20.0),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            // Imposta i bordi del campo di ricerca
            borderRadius: BorderRadius.circular(30.0), 
          ),          
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                30.0), // Imposta i bordi del campo di ricerca quando è in focus
            borderSide: const BorderSide(
              color:
                  kOrangeColor, // Imposta il colore del bordo quando è in focus
            ),
          ),
          filled: true, // Imposta se il campo di ricerca è riempito
          fillColor: kDarkGreyColor,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.search,
              color: kOrangeColor,
              size: 34.0,
            ),
            onPressed: () {
              widget.onSearch(widget.searchController
                  .text); // Chiama la funzione di ricerca con il testo attuale
            },
          ),
          hintText: "Cerca una ricetta...",
          hintStyle: const TextStyle(
            color: kGreyColor,
            fontSize: 20.0,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        onChanged: (value) {
          setState(() {
            _isFocused = value.isNotEmpty; // Aggiorna lo stato di focus in base al testo inserito
          });
          widget
              .onFocusChanged(_isFocused); // Chiama la funzione di cambio focus
        },
        onTap: () {
          setState(() {
            _isFocused =
                true; // Imposta lo stato di focus a true quando si tocca il campo di ricerca
          });
          widget
              .onFocusChanged(_isFocused); // Chiama la funzione di cambio focus
        },
        onEditingComplete: () {
          setState(() {
            _isFocused =
                false; // Imposta lo stato di focus a false quando si completa la modifica del testo
          });
          widget
              .onFocusChanged(_isFocused); // Chiama la funzione di cambio focus
        },
      ),
    );
  }
}
