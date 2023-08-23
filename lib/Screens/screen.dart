import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String oldText = '';
  String result = '';
  double plus(String n1, double num1) {
    return num1 + double.parse(n1);
  }

  double minus(String n1, double num1) {
    return num1 - double.parse(n1);
  }

  double multi(String n1, double num1) {
    return num1 * double.parse(n1);
  }

  double div(String n1, double num1) {
    return num1 / double.parse(n1);
  }

  String calculate(String bracketString) {
    String op = '';
    List<String> stack = [];
    double num1 = 0;
    String n1 = '';
    String bracket = '';
    for (int i = 0; i < bracketString.length; i++) {
      if (stack.isNotEmpty) {
        if (bracketString[i] != ')') {
          bracket += bracketString[i];
        } else {
          stack.removeLast();
          if (stack.isEmpty) {
            n1 = calculate(bracket);
          }
        }
      } else if (bracketString[i] != '%' && (int.tryParse(bracketString[i]) != null || bracketString[i] == '.')) {
        n1 = n1 + bracketString[i];
      } else if (bracketString[i] == '(') {
        stack.add("(");
      } else {
        if (op == '+') {
          num1 = plus(n1, num1);
          n1 = '';
        } else if (op == '-') {
          num1 = minus(n1, num1);
          n1 = '';
        } else if (op == '*') {
          num1 = multi(n1, num1);
          n1 = '';
        } else if (op == '/') {
          num1 = div(n1, num1);
          n1 = '';
        } else if (op == '%') {
          num1 = double.parse(n1)/100;
        } else {
          if(bracketString[i]!='%'){
            num1 = double.parse(n1);
            n1 = '';
          }
        }
        op = bracketString[i];
      }
    }
    if (op == '+') {
      num1 = plus(n1, num1);
    } else if (op == '-') {
      num1 = minus(n1, num1);
    } else if (op == '*') {
      num1 = multi(n1, num1);
    } else if (op == '/') {
      num1 = div(n1, num1);
    } else if (op == '%') {
      num1 = double.parse(n1)/100;
    } else {
      num1 = double.parse(n1);
    }
    return num1.toString();
  }

  void equalClick() {
    setState(() {
      result = calculate(oldText);
    });
  }

  void removeOneChar() {
    setState(() {
      oldText = oldText.substring(0, oldText.length - 1);
    });
  }

  void removeAllChar() {
    setState(() {
      oldText = '';
      result = '';
    });
  }

  void handleTap(String newText) {
    setState(() {
      oldText = oldText + newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            // title and display
            Container(
              width: double.infinity,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // title
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    child: const Text(
                      "Calculator",
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 50,
                    ),
                    child: Text(
                      oldText,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 50,
                    ),
                    child: Text(
                      result,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.black87,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'V',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: removeAllChar,
                          child: const Text(
                            'AC',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        const Text(
                          'X',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('/'),
                          child: const Text(
                            '/',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => handleTap('('),
                          child: const Text(
                            '(',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap(')'),
                          child: const Text(
                            ')',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('%'),
                          child: const Text(
                            '%',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('*'),
                          child: const Text(
                            '*',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => handleTap('1'),
                          child: const Text(
                            '1',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('2'),
                          child: const Text(
                            '2',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('3'),
                          child: const Text(
                            '3',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('-'),
                          child: const Text(
                            '-',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => handleTap('4'),
                          child: const Text(
                            '4',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('5'),
                          child: const Text(
                            '5',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('6'),
                          child: const Text(
                            '6',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('+'),
                          child: const Text(
                            '+',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => handleTap('7'),
                          child: const Text(
                            '7',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('8'),
                          child: const Text(
                            '8',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('9'),
                          child: const Text(
                            '9',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: removeOneChar,
                          child: const Text(
                            '<',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => handleTap('0'),
                          child: const Text(
                            '0',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('00'),
                          child: const Text(
                            '00',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleTap('.'),
                          child: const Text(
                            '.',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: equalClick,
                          child: const Text(
                            '=',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
