module SortingAlgorithms where


-- quickSort
quickSort::(Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort (filter (\y -> y < x ) xs) ++ [x] ++  quickSort (filter (\y -> y >= x ) xs)


-- mergeSort TopDown
merge::(Ord a) => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x <= y 
                        then x:merge xs (y:ys)
                        else y:merge (x:xs) ys

mergeSortTopDown::(Ord a) => [a] -> [a]
mergeSortTopDown xs = let n = length xs
              in  
                if n <= 1 
                then xs
                else merge (mergeSortTopDown (take (n `div` 2) xs)) (mergeSortTopDown (drop (n `div` 2) xs))
-- Bottom Up 
-- reference: https://riptutorial.com/haskell/example/7552/merge-sort
mergeSortBottomUp::(Ord a) => [a] -> [a]
mergeSortBottomUp [] = []
mergeSortBottomUp xs = go [[x] | x <- xs]
    where
    go [a] = a
    go xs = go (pairs xs)
    pairs (a:b:t) = merge a b : pairs t
    pairs t = t

-- selection Sort

minimunElement:: Ord b => [b]-> b
minimunElement [x] = x
minimunElement (x:y:xs) = minimunElement ((if x <= y then x else y):xs)

removeItem::(Eq a) => a -> [a] -> [a]
removeItem _ [] = []
removeItem x (y:ys) | x == y    = removeItem x ys
                    | otherwise = y : removeItem x ys

selectionSort::(Ord a) => [a] -> [a]
selectionSort [] = []
selectionSort xs = (x:selectionSort (removeItem x xs))
          where 
             x = minimunElement xs

