import 'category.dart';

const List<String> RegExList = [
  r'([0-9]+),([0-9]*)',
  r'([0-9]+)',
  r'\+',
  r'\-',
  r'x',
  r'/',
  r'=',
  r'End',
  r'Err'
];

const int END_OF_STRING = 1;

class Tokenizer {
  String _buffer = '';
  Token _tk = new Token();
  int _current_position = 0;

  int getCurrentPosition() => _current_position;

  void setBuffer(String s) {
    _current_position = 0;
    _buffer = s;
  }

  Token nextToken() {
    _tk.col = _current_position;
    _tk.categ = Category.End;
    _tk.lex = '';

    if (_buffer.length <= 0) return _tk;

    int res = findRegex();

    return _tk;
  }

  int findRegex() {
    RegExp re = new RegExp(r'');
    String temp_lex = '';

    if (_current_position < _buffer.length) {
      temp_lex += _buffer[_current_position];
      _tk.col = _current_position;
      _current_position++;

      if (!is_delim(temp_lex)) {
        while (_current_position < _buffer.length &&
            !is_delim(_buffer[_current_position])) {
          temp_lex += _buffer[_current_position];
          _current_position++;
        }
      }

      for (Category cat in Category.values) {
        re = new RegExp(RegExList[cat.index]);

        if (re.hasMatch(temp_lex)) {
          _tk.categ = cat;
          _tk.lex = temp_lex;
          break;
        }
      }
    } else
      return END_OF_STRING;
  }

  bool is_delim(String s) {
    return s == '+' || s == '-' || s == 'x' || s == '/' || s == '=';
  }
}

class Token {
  int col;
  Category categ;
  String lex;

  @override
  String toString() {
    return "$lex >> ${categ.toString()}";
  }
}
