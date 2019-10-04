import 'package:calculator/interpreter/category.dart';
import 'package:calculator/interpreter/tokenizer.dart';

class Calculator {
  Tokenizer tokenizer = new Tokenizer();
  Token tk;
  String strErr = '';

  String getInput(String input) {
    if (input.length <= 0) {
      return '';
    }

    return replaceOperator(input);
  }

  String replaceOperator(String input) {
    if (input.length == 1) {
      tokenizer.setBuffer(input);
      tk = tokenizer.nextToken();

      if (tk.categ != Category.CteFloat && tk.categ != Category.CteInt)
        return '';
    } else if (input.length != 0) {
      tokenizer.setBuffer(input.substring(input.length - 2));
      tk = tokenizer.nextToken();
      if (tk.categ != Category.CteFloat && tk.categ != Category.CteInt) {
        tk = tokenizer.nextToken();
        if (tk.categ != Category.CteFloat && tk.categ != Category.CteInt)
          return input.substring(0, input.length - 2) + input[input.length - 1];
      }
    }

    return input;
  }

  String getResult(String input) {
    strErr = '';
    tokenizer.setBuffer(input);

    tk = tokenizer.nextToken();

    double res = fEar(fTa());

    if (strErr == '') {
      List<String> splitDecimal = res.toString().split(".");
      if (splitDecimal.length == 2 && int.parse(splitDecimal[1]) == 0)
        return splitDecimal[0];

      return res.toString();
    } else
      return '';
  }

  double fEar(double Earvh) {
    if (tk.categ == Category.OpMais) {
      tk = tokenizer.nextToken();
      return fEar(Earvh + fTa());
    } else if (tk.categ == Category.OpMenos) {
      tk = tokenizer.nextToken();
      return fEar(Earvh - fTa());
    } else
      return Earvh;
  }

  double fTa() {
    return fTar(fFa());
  }

  double fTar(double Tarvh) {
    if (tk.categ == Category.OpMult) {
      tk = tokenizer.nextToken();
      return fTar(Tarvh * fFa());
    } else if (tk.categ == Category.OpDiv) {
      tk = tokenizer.nextToken();
      double res = Tarvh / fFa();
      if (res == double.infinity ||
          res == double.nan ||
          res == double.negativeInfinity) {
        strErr = 'division error';
        return 0;
      }
      return res;
    } else
      return Tarvh;
  }

  double fFa() {
    double Faval;
    if (tk.categ == Category.CteFloat || tk.categ == Category.CteInt) {
      Faval = double.parse(tk.lex);
      tk = tokenizer.nextToken();
      return Faval;
    } else {
      strErr = "Bad expression";
      return 0;
    }
  }
}
