lastnames = ["Barrera", "Brown", "Mangum", "Sorrells"]
firstnames = ["Joe", "Peter", "Amanda", "Jessica"]

numbers = [56, 51, 47, 94, 48, 10, 56, 28, 37,
           87, 37, 30, 11, 63, 50, 4, 62, 12]


zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []  
zip' [] _ = []  
zip' (x:xs) (y:ys) = (x,y):zip' xs ys


mergesort:: (Ord a) => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = merge (mergesort firsthalf) (mergesort lasthalf)
    where halflength = length xs `div` 2
          firsthalf = take halflength xs
          lasthalf = drop halflength xs
          merge ys zs
            | null ys = zs
            | null zs = ys
            | head ys <= head zs = head ys : merge (tail ys) zs
            | head ys > head zs = head zs : merge ys (tail zs)
