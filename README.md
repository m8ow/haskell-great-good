## 概要
僕は「すごいHaskelたのしく学ぼう！」を毎日1章ずつ勉強しています。  
勉強する中で、自分のメモとしてもしくは誰かの助けになればと思い内容をGitHubに公開しています。  

書籍はこちら: 
[すごいHaskelたのしく学ぼう！](https://shop.ohmsha.co.jp/shopdetail/000000001926/)

## 開発環境
macOS Catalina: version 10.15.6  
stack: version 2.3.3 x86_64  
GHCi: version 8.8.4

## stack導入
`$ brew install haskell-stack`

## stackコマンド（プロジェクト一連の作業） 
1. プロジェクトの作成  
`$ stack new my-project`

2. プロジェクトに移動  
`$ cd my-project`

3. コンパイラ（GHC）のインストール  
`$ stack setup`

4. プロジェクトをビルド（コンパイルしているわけではないです）  
`$ stack build`

5. ビルドファイルを実行  
`$ stack exec my-project-exe`

## stackコマンド（便利）
GHCiコンソール（REPL）の起動
> ファイルを作らずともコンソール上でHaskellを実行できます。
  
`$ stack ghci`  

GHCiの中断  
`prelude> :q` 
  
Haskellのコードを直接実行  
`$ stack runghc -- -isrc <haskellファイル>.hs`  