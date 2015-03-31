このディレクトリーは、日本語入力プログラミング
(http://home.catv.ne.jp/pp/ginoue/im/index.html)
にあったサンプルプログラムを Linux RedHat 7.1(たぶん)上で
動作するように修正を加えたものです。

主な修正は、setlocale()のあとに、XSetLocaleModifiers("")を呼び出す
ようにした点です。 また、Makefileも用意しました。

使い方は、 make後、kinput2を起動し、XIMが使用できるようにしたあと、
環境変数 LANGとXMODIFIERSを設定し、

  % setenv LANG ja_JP.ujis
  % setenv XMODIFIERS "@im=kinput2"

各プログラムを起動してください。

  % ./xim1

Shift+SPACEを入力すると kinput2で日本語が入力できるように
なるはずです。

2002/12/05(Thu) 成松 宏 (nari@humblesoft.com)

