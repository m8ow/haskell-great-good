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
--9. Enum 型クラス
--10. Bounded 型クラス
--11. Num 型クラス
--12. Floating 型クラス
--13. Integral 型クラス

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
  --print $

  --9
  --print $

  --10
  --print $

  --11
  --print $

  --11
  --print $

  --12
  --print $

  --13
  --print $
