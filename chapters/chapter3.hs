------------------------
------- 関数の構文 -------
------------------------
--1. パターンマッチ
lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky n = "UNLUCKY"

--2. 再帰
----数列
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

--3. タプルのパターンマッチ
----addVectors'の方がリーダブルなのでおすすめ
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors a b = (fst a + fst b, snd a + snd b)
addVectors' :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

--4. リストのパターンマッチ, リスト内包表記
listfunc list = [a+b | (a,b) <- list]
----(x,3)に一致するもの、つまりタプルの2番目の要素が3のものを抽出している
listfunc' list = [x*100 | (x,3) <- list]
----配列が空の場合エラーが出て、要素が1つ以上あればheadを取得
head' :: [a] -> a
head' [] = error "error"
head' (x:_) = x
----リストの数に応じてパターンマッチ
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
----要素が1つの場合
tell (x:[]) = "The list has one element: " ++ show x
----要素が2つの場合
tell (x:y:[]) = "The list has two element: " ++ show x ++ " and " ++ show y
----要素が3つ以上の場合
tell (x:y:z:_) = "The list is long. The first three elements are: "
  ++ show x ++ " and " ++ show y ++ " and " ++ show z

--5. as パターン
----{全体を表す定数}@(x:xs)
firstLetter :: String -> String
firstLetter "" = "Empty string, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

--6. ガード（場合分け） & where
----BMIの計算をwhereで行い、その結果を使い回す
bmiTell :: Double -> Double -> String
bmiTell weight height
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal. Pffft, you emo, you!"
  | bmi <= 30.0 = "You're fat! Lose some weight, fatty"
  | otherwise  = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2

--7. where のスコープ
----whereは定義した関数内からしかアクセスできない
----下記の例では、グローバルに定義する必要がある
badGreeting :: String
badGreeting = "Oh! Pfff. It's you. "

niceGreeting :: String
niceGreeting = "Hello! So very nice to see you, "

greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ name

--8. パターンマッチと where
----インデントは揃えないとエラー
initials :: String -> String -> String
initials firstname lastname = [f] ++ "." ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname

--9. where ブロックの中の関数
----whereの中では関数も定義できる
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h | (w, h) <- xs]
  where bmi weight height = weight / height ^ 2

--10. let It Be
----let {bindings} in {expression}
----letは式, whereは節. letは式の途中に入れることもできる
cylinder :: Double -> Double -> Double
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^ 2
  in sideArea + 2 + topArea

--11. リスト内包表記での let
----`(w, h) <- xs`は「ジェネレータ」と呼ばれ、let式より先に呼び出される
----bmiにはlet式以降からアクセスできる
calcBmis' :: [(Double, Double)] -> [Double]
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi > 25.0]

--12. case 式
----コードの中のどこでもパターンマッチが使える構文
----基底値を利用するパターンマッチは、case式の糖衣構文
----case {expression} of {pattern1} -> {result1}
----                     {pattern2} -> {result2}
----                     ...
head'' :: [a] -> a
head'' xs = case xs of [] -> error "error"
                       (x:_) -> x

main = do
  --1
  print $ lucky 7
  print $ lucky 3
  print $ lucky 9

  --2
  print $ factorial 5

  --3
  print $ addVectors (4.0, 5.0) (2.0, 6.0)
  print $ addVectors' (4.0, 5.0) (2.0, 6.0)

  --4
  print $ listfunc [(1,3), (4,3), (7,9)]
  print $ listfunc' [(1,3), (4,3), (7,9)]
  ----エラー出る
  --head' []
  print $ head' [1,2,3]
  print $ tell [1]
  print $ tell [1,2]
  print $ tell [1,2,3,4,5]

  --5
  print $ firstLetter ""
  print $ firstLetter "Meow"

  --6
  print $ bmiTell 54.8 1.70

  --7
  print $ greet "Juan"
  print $ greet "Fernando"
  print $ greet "Michael"

  --8
  print $ initials "Michael" "Jackson"

  --9
  print $ calcBmis [(54.8, 1.70), (70, 1.75)]

  --10
  print $ cylinder 3.0 10.0

  --11
  print $ calcBmis' [(54.8, 1.70), (70, 1.75)]

  --12
  ----エラー出る
  --head'' []
  print $ head'' [1,2,3]
