------------------------
------ Hello 再帰! ------
------------------------
--1. フィボナッチ数列
fib :: Int -> Int
----基底部
fib 0 = 0
fib 1 = 1
----再帰部
fib n = fib (n-1) + fib (n-2)

--2. 最大値を返す関数
----[]の場合は下記にしないとエラーが出る
----maximumFunc :: [Int] -> Int
maximumFunc :: (Ord a) => [a] -> a
maximumFunc [] = error "the list is empty"
maximumFunc [x] = x
----max関数は2値を比べて大きい値を返す
----トーナメント方式で、勝ち残った値が最大値となる
maximumFunc (x:xs) = max x (maximumFunc xs)

--3. replicate
replicateFunc :: Int -> a -> [a]
replicateFunc n x
  | n <= 0 = []
  | otherwise = x : replicateFunc (n-1) x

--4. take
takeFunc :: Int -> [a] -> [a]
takeFunc n _
  | n <= 0 = []
takeFunc _ [] = []
takeFunc n (x:xs) = x : takeFunc (n-1) xs

--5. reverse
reverseFunc :: [a] -> [a]
reverseFunc [] = []
reverseFunc (x:xs) = reverseFunc xs ++ [x]

--6. repeat
repeatFunc :: a -> [a]
repeatFunc x = take 5 (x : repeatFunc x)

--7. zip
zipFunc :: [a] -> [b] -> [(a,b)]
zipFunc _ [] = []
zipFunc [] _ = []
zipFunc (x:xs) (y:ys) = (x,y) : zipFunc xs ys

--8. elem
elemFunc :: (Eq a) => a -> [a] -> Bool
elemFunc _ [] = False
elemFunc n (x:xs)
  | n == x = True
  | otherwise = elemFunc n xs

--9.quicksort
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
  let smaller = [a | a <- xs, a <= x]
      larger = [a | a <- xs, a > x]
  in quickSort smaller ++ [x] ++ quickSort larger

main = do
  --1
  print $ fib 10

  --2
  --エラーが出る
  --print $ maximumFunc []
  print $ maximumFunc [3]
  print $ maximumFunc [3,5,2]

  --3
  print $ replicateFunc 3 5

  --4
  print $ takeFunc (-1) [1,2,3,4,5]
  --エラーが出る
  --print $ takeFunc 2 []
  print $ takeFunc 3 [1,2,3,4,5]

  --5
  print $ reverseFunc [1,2,3]

  --6
  print $ repeatFunc 3

  --7
  print $ zipFunc [1,2] [3,4,5]

  --8
  print $ elemFunc 3 []
  print $ elemFunc 3 [1,2,4]
  print $ elemFunc 3 [1,2,3]

  --9
  print $ quickSort [4,3,6,7,2,1]

