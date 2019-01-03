# wstring_for_hsp3 
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/inonote/wstring_for_hsp3/blob/master/LICENSE)  
HSP3でUTF-16を扱うためのモジュール。  
Shift_JISやUTF-8とは違い、良く使われるU+9999以下の文字であれば固定バイト長ですので、文字列の扱いが楽になります。

## 特徴
* C++の標準ライブラリ std::wstring に近い関数、命令。
  * 文字列の挿入、削除、置き換え、比較、検索、取り出し、交換、配列にコピー。
  * NULL終端文字列へのポインタの取得。
* NULL文字を文字列中に含むことが出来る。

## バイトオーダーについて
このモジュールは、LE、BEどちらでも使用できるようになっていますが、ANSI版の関数、命令の引数の文字列はUTF-16LEに変換されます。
