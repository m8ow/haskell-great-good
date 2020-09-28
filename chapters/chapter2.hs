------------------------
------ 型を信じろ！ ------
------------------------
--1. 大文字のみを抽出する関数
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

--2. 3つの値を足す
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

--3. 全てを掛けた値（product関数）
----Int（有界）のMaxは2^63-1なので、下記2つは異なる値になる
----有界とは、min, maxがある値
----Integerは有界ではなく、「はんぱなく大きい数！」らしい
factorial :: Int -> Int
factorial n = product [1..n]
factorial' :: Integer -> Integer
factorial' n = product [1..n]

--4. 直径 * π
----Floatは「単精度浮動小数点」
circumference :: Float -> Float
circumference r = 2 * pi * r

----Doubleは「倍精度浮動小数点」で、ビット数はFloatの2倍
circumference' :: Double -> Double
circumference' r = 2 * pi * r

--5. Eq 型クラス
----等値性の判断
----比較する2つの値は同じ型である必要がある
eqfunc :: (Eq a) => a -> a -> Bool
eqfunc x y = (x == y)
eqfunc' x y = (x /= y)

--6. Ord 型クラス
----順序を付ける型のための型クラス
----有名なquicksortなどでも使われる
ordfunc :: (Ord a) => a -> a -> Bool
ordfunc x y = (x < y)
ordfunc' x y = (x > y)
----compare関数は判定した後3つのどれかの返り値を持つ
------GT(Greater Than): xがyより大きい
------LT(Less Than): xがyより小さい
------EQ(Equal): 等しい
ordfunc'' x y = (x `compare` y)

--7. Show 型クラス
showfunc :: (Show a) => a -> [Char]
showfunc x = show x

--8. Read 型クラス
----型推論そのものを行える
----String と [Char] は同じように使える
----数値演算が行われたので、Intだと推論できる
readfunc :: String -> Int
readfunc x = read x + 1
----「型注釈」で型（Int）を明示する
readfunc' :: String -> Int
readfunc' x = read x :: Int

--9. Enum 型クラス
----順番に並んだ型
enumfunc :: (Enum a) => a -> a -> [a]
enumfunc x y = [x..y]

--10. Bounded 型クラス
boundedfunc _ = minBound :: Int
boundedfunc' _ = maxBound :: Char
boundedfunc'' _ = minBound :: (Int, Char, Bool)

--11. Num 型クラス
----あらゆる数は「多相定数」として表現される
----Int, Integer, Float, Doubleなどがそれに属する
numfunc :: Int -> Int
numfunc x = x :: Int
numfunc' :: Float -> Float
numfunc' x = x :: Float

--12. Floating 型クラス
----Floatingは浮動小数点（Float, Double）が含まれる


--13. Integral 型クラス
----Numは実数を含む全ての数を含む
----Integralは整数全体（Int, Integer）のみを含む
----fromIntegral :: (Num b, Integral a) => a -> b
----fromIntegralは数を抽象化してくれる（Integer -> Float（Num）に対応など）

main = do
  --1
  print $ removeNonUppercase "CaaaD"

  --2
  print $ addThree 3 9 8

  --3
  print $ factorial 50
  print $ factorial' 50

  --4
  print $ circumference 4.0
  print $ circumference' 4.0

  --5
  print $ eqfunc 5 5
  print $ eqfunc' 5 5

  --6
  print $ ordfunc 5 6
  print $ ordfunc' 5 6
  print $ ordfunc'' 5 6

  --7
  print $ showfunc 144
  print $ showfunc True

  --8
  print $ readfunc "32"
  print $ readfunc' "32"

  --9
  print $ enumfunc 'a' 'e'
  print $ enumfunc 1 3
  print $ enumfunc LT GT

  --10
  print $ boundedfunc 0
  print $ boundedfunc' 0
  print $ boundedfunc'' 0

  --11
  print $ numfunc 20
  print $ numfunc' 20

  --12

  --13
  print $ fromIntegral 3 + 3.2
