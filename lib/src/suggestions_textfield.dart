import 'package:flutter/material.dart';

// InputSuggestions version 0.0.1
// currently yield inline suggestions

// I will soon implement a list with suggestions
// Credit Dn-a -> https://github.com/Dn-a

/// Used by [SuggestionsTextField.onChanged].
typedef OnChangedCallback = void Function(String string);

/// Used by [SuggestionsTextField.onSubmitted].
typedef OnSubmittedCallback = void Function(String string);

class SuggestionsTextField extends StatefulWidget {
  const SuggestionsTextField(
      {super.key, required this.tagsTextField, this.onSubmitted});

  final TagsTextField tagsTextField;
  final OnSubmittedCallback? onSubmitted;

  @override
  SuggestionsTextFieldState createState() => SuggestionsTextFieldState();
}

class SuggestionsTextFieldState extends State<SuggestionsTextField> {
  final _controller = TextEditingController();

  List<String> _matches = [];
  String _helperText = "no matches";
  bool _helperCheck = true;

  List<String>? _suggestions;
  bool _constraintSuggestion = false;
  double _fontSize = 12;
  InputDecoration? _inputDecoration;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _helperText = widget.tagsTextField.helperText ?? "no matches";
    _suggestions = widget.tagsTextField.suggestions;
    _constraintSuggestion = widget.tagsTextField.constraintSuggestion;
    _inputDecoration = widget.tagsTextField.inputDecoration;
    _fontSize = widget.tagsTextField.textStyle.fontSize ?? 12;

    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Visibility(
          visible: _suggestions != null,
          child: Container(
            //width: double.infinity,
            padding: _inputDecoration != null
                ? _inputDecoration?.contentPadding
                : EdgeInsets.symmetric(
                    vertical: 6 * (_fontSize / 14),
                    horizontal: 6 * (_fontSize / 14)),
            child: Text(
              _matches.isNotEmpty ? (_matches.first) : "",
              softWrap: false,
              overflow: TextOverflow.fade,
              style: TextStyle(
                height: widget.tagsTextField.textStyle.height ?? 1,
                fontSize: _fontSize,
                color: widget.tagsTextField.suggestionTextColor,
              ),
            ),
          ),
        ),
        TextField(
          controller: _controller,
          enabled: widget.tagsTextField.enabled,
          autofocus: widget.tagsTextField.autofocus ?? true,
          keyboardType: widget.tagsTextField.keyboardType,
          textCapitalization: widget.tagsTextField.textCapitalization ??
              TextCapitalization.none,
          maxLength: widget.tagsTextField.maxLength,
          maxLines: 1,
          autocorrect: widget.tagsTextField.autocorrect ?? false,
          style: widget.tagsTextField.textStyle.copyWith(
              height: widget.tagsTextField.textStyle.height == null ? 1 : null),
          decoration: _initialInputDecoration,
          onChanged: (str) => _checkOnChanged(str),
          onSubmitted: (str) => _onSubmitted(str),
        )
      ],
    );
  }

  InputDecoration get _initialInputDecoration {
    var input = _inputDecoration ??
        InputDecoration(
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                vertical: 6 * (_fontSize / 14),
                horizontal: 6 * (_fontSize / 14)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey[300] ?? Colors.red,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey[400]?.withValues(alpha: 0.3) ??
                      Colors.red),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey[400]?.withValues(alpha: 0.3) ??
                      Colors.red),
            ));

    return input.copyWith(
        helperText: _helperCheck || _suggestions == null ? null : _helperText,
        helperStyle: widget.tagsTextField.helperTextStyle,
        hintText: widget.tagsTextField.hintText ?? 'Add a tag',
        hintStyle: TextStyle(color: widget.tagsTextField.hintTextColor));
  }

  ///OnSubmitted
  void _onSubmitted(String str) {
    var onSubmitted = widget.onSubmitted;

    if (_suggestions != null && _matches.isNotEmpty) str = _matches.first;

    if (widget.tagsTextField.lowerCase) str = str.toLowerCase();

    str = str.trim();

    if (_suggestions != null) {
      if (_matches.isNotEmpty || !_constraintSuggestion) {
        if (onSubmitted != null) onSubmitted(str);
        setState(() {
          _matches = [];
        });
        _controller.clear();
      }
    } else if (str.isNotEmpty) {
      if (onSubmitted != null) onSubmitted(str);
      _controller.clear();
    }
  }

  ///Check onChanged
  void _checkOnChanged(String str) {
    if (_suggestions != null) {
      _matches =
          _suggestions?.where((String sgt) => sgt.startsWith(str)).toList() ??
              [];

      if (str.isEmpty) _matches = [];

      if (_matches.length > 1) _matches.removeWhere((String mtc) => mtc == str);

      setState(() {
        _helperCheck =
            _matches.isNotEmpty || str.isEmpty || !_constraintSuggestion
                ? true
                : false;
        _matches.sort((a, b) => a.compareTo(b));
      });
    }

    widget.tagsTextField.onChanged?.call(str);
  }
}

/// Tags TextField
class TagsTextField {
  TagsTextField(
      {this.lowerCase = false,
      this.textStyle = const TextStyle(fontSize: 14),
      this.width = 200,
      this.padding,
      this.enabled = true,
      this.duplicates = false,
      this.suggestions = const [],
      this.constraintSuggestion = true,
      this.autocorrect,
      this.autofocus,
      this.hintText,
      this.hintTextColor,
      this.suggestionTextColor,
      this.helperText,
      this.helperTextStyle,
      this.keyboardType,
      this.textCapitalization,
      this.maxLength,
      this.inputDecoration,
      this.onSubmitted,
      this.onChanged});

  final double width;
  final EdgeInsets? padding;
  final bool enabled;
  final bool duplicates;
  final TextStyle textStyle;
  final InputDecoration? inputDecoration;
  final bool? autocorrect;
  final List<String> suggestions;

  /// Allows you to insert tags not present in the list of suggestions
  final bool constraintSuggestion;
  final bool lowerCase;
  final bool? autofocus;
  final String? hintText;
  final Color? hintTextColor;
  final Color? suggestionTextColor;
  final String? helperText;
  final TextStyle? helperTextStyle;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final OnSubmittedCallback? onSubmitted;
  final OnChangedCallback? onChanged;
}
