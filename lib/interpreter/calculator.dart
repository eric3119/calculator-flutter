import 'package:calculator/interpreter/category.dart';
import 'package:calculator/interpreter/tokenizer.dart';

class Calculator {
  Tokenizer tokenizer = new Tokenizer();
  Token tk;
  String strErr;

  String getInput(String input) {
    
    if (input.length <= 0){
      return '0';
    }else if(input.length == 2){
      if(input[0] == '0' && input[1] != ',') {
        return input.substring(1);
      }
    }
    
    return input;
    

    // tokenizer.setBuffer(input);
    // tk = tokenizer.nextToken();
    // if (tk.categ == Category.CteInt) {
    //   display += int.parse(tk.lex).toString();
    // }
    // if (tokenizer.getCurrentPosition() < input.length)
    //   display += input.substring(tokenizer.getCurrentPosition(), input.length);

    // return display;
  }

  String getResult(String input) {
    strErr = '';
    tokenizer.setBuffer(input);

    tk = tokenizer.nextToken();

    double res = fRes();

    if (strErr == '')
      return res.toString();
    else
      return strErr;
  }

  double fRes() {
    return fEa();
  }

  double fEa() {
    return fEar(fTa());
  }

  double fEar(double Earvh) {
    if (tk.categ == Category.OpMais) {
      tk = tokenizer.nextToken();
      return fEar(Earvh + fTa());
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
      return fTar(Tarvh / fFa());

      // }else if(tk.categ == Category.OpPot){
      //     tk = tokenizer.nextToken();
      //     return fTar(pow(Tarvh, fFa()));

    } else
      return Tarvh;
  }

  double fFa() {
    double Faval;
    // if (tk.categ == Category.AbPar) {
    //   tk = tokenizer.nextToken();
    //   Faval = fEa();
    //   if (tk.categ != Category.FePar) {
    //     print("')' esperado");
    //     return 0;
    //   } else {
    //     tk = tokenizer.nextToken();
    //     return Faval;
    //   }
    // } else
    if (tk.categ == Category.CteFloat || tk.categ == Category.CteInt) {
      Faval = double.parse(tk.lex);
      tk = tokenizer.nextToken();
      return Faval;
    } else {
      strErr = "sintax error";
      return 0;
    }
  }
}
