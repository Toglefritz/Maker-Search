import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Provides a text input used to collect a search query from the user
class SearchInput extends StatefulWidget {
  final void Function(String) onSubmit;

  const SearchInput({Key? key, required this.onSubmit}) : super(key: key);

  @override
  SearchInputState createState() => SearchInputState();
}

class SearchInputState extends State<SearchInput> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Handles submissions into the search field.
  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(
                width: 3.0,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(
                width: 3.0,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(
                width: 3.0,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            hintText: AppLocalizations.of(context)!.searchPrompt,
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold,
                ),
            filled: true,
            fillColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
          ),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.errorSearchEmpty;
            }
            return null;
          },
          onFieldSubmitted: (value) => _handleSubmit(),
        ),
      ),
    );
  }
}
