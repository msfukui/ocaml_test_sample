# oUnit sample

OCaml のテストフレームワークである oUnit を使ったコードのサンプルです。

## Setup

opam のセットアップは完了している前提とします。

実行前には `eval $(opam env)` で環境設定を有効にしておくことを忘れずに.

```
$ opam install oasis ounit
```

プロジェクトのトップディレクトリに \_oasis ファイルを作って、

src/ にコード、 tests/ にテストを書いて、

```
$ oasis setup
```

で Makefile, configure, setup.ml などの build に必要な各種ファイルを生成します。

## Run tests

```
$ make configure CONFIGUREFLAGS=--enable-tests
ocaml setup.ml -configure --enable-tests
...
```

で configure を実行して、

```
$ make test
ocaml setup.ml -build
Finished, 1 target (0 cached) in 00:00:00.
Finished, 13 targets (0 cached) in 00:00:00.
ocaml setup.ml -test
.
Ran: 1 tests in: 0.10 seconds.
OK
```

で build && run tests します。

## Troubleshooting

```
$ oasis setup
W: Cannot find source file matching module 'OunitSample' in library ounit_sample.
W: Use InterfacePatterns or ImplementationPatterns to define this file with feature "source_patterns".
```

OCaml のモジュール名は、ファイル名の先頭英文字を大文字にしたものになるそうなので、名前に注意しましょう。。

c.f. [モジュール - OCaml](https://ocaml.org/learn/tutorials/modules.ja.html)

```
$ make configure CONFIGUREFLAGS=--enable-tests
ocaml setup.ml -configure --enable-tests
E: Field test is not defined in schema environment
make: *** [configure] Error 1
```

\_oasis ファイルの flag(tests) の記述ミスに注意しましょう。。

## Reference

* [OUnitでOCamlライブラリのテストを書く - type holyshared = Engineer<mixed>](https://holyshared.hatenablog.com/entry/2016/12/18/110000)

Oasis, OUnit の導入部分を平易にご紹介いただいています。ほぼそのまま参考にさせていただきました。

* [OUnit user guide](http://ounit.forge.ocamlcore.org/documentation.html)

OUnit の公式マニュアル

* [OASIS Documentation](http://oasis.forge.ocamlcore.org/documentation.html)

OCaml プロジェクトの build 支援ツール (configure, build, installツール)

* [opam - install](https://opam.ocaml.org/doc/Install.html)

OCaml のパッケージマネージャー
