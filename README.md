# Logic And Struktur Data

## Getting Started
- Using Flutter version 2.2.2 and Dart 2.13.3

## Run

Via Terminal:

### Android

    flutter run -t lib/main.dart --debug


### You can run code bellow in https://dartpad.dev/?null_safety=true

    import 'dart:math';
    import 'package:collection/collection.dart';

    void main() {

      List<int> x = [6,90,1,4,6];
      _getMaxNumber(x);
      _sumArray(x);
      _sortArray(x);
      _printThirdMaxNumber(x);
    }

    void _printThirdMaxNumber(List<int> x) {
      if(x.length < 2) {
        print("Array must more than 2 index");
        return;
      }

        x..sort((a, b) => b.compareTo(a));
        print(x[2]);
    }

    void _getMaxNumber(List<int> x) {
       if(x.length < 1) {
        print("Array atleast must have 1 index");
        return;
      }

      print(x.reduce(max));
    }

    void _sumArray(List<int> x){
       print(x.sum);
    }

    void _sortArray(List<int> x) {
      print(x..sort());
    }
