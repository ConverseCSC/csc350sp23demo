lastnames = ["Barrera", "Brown", "Mangum", "Sorrells"]
firstnames = ["Joe", "Peter", "Amanda", "Jessica"]

numbers = [56, 51, 47, 94, 48, 10, 56, 28, 37,
           87, 37, 30, 11, 63, 50, 4, 62, 12]


zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []  
zip' [] _ = []  
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

