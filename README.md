## 概要
僕は「すごいHaskelたのしく学ぼう！」を毎日1章ずつ勉強しています。  
勉強する中で、自分のメモとしてもしくは誰かの助けになればと思い内容をGitHubに公開しています。  

著書はこちら: 
[すごいHaskelたのしく学ぼう！](https://shop.ohmsha.co.jp/shopdetail/000000001926/)

## 開発環境
macOS Catalina: version 10.15.6  
stack: version 2.3.3 x86_64  
GHCi: version 8.8.4

## stack導入
`$ curl -sSL https://get.haskellstack.org/ | sh`

## stackコマンド（プロジェクトの作成） 
1. プロジェクトの作成  
`$ stack new my-project`

2. プロジェクトの作成  
`$ cd my-project`

2. プロジェクトの作成  
`$ stack setup`

2. プロジェクトの作成  
`$ stack build`

2. プロジェクトの作成  
`$ stack exec my-project-exe`

## stackコマンド（便利）
GHCiの起動  
`$ stack ghci`  

GHCiの中断  
`prelude> :q` 
  
Haskellのコードをコンパイルなしで実行  
`$ stack runghc -- -isrc <haskellファイル>.hs`  