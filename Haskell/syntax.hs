import System.Win32 (xBUTTON1, aCCESS_SYSTEM_SECURITY, dACL_SECURITY_INFORMATION, SECURITY_ATTRIBUTES (nLength))
import Text.XHtml (cite)
--- PATTERN MATCHING

-- Straight from the recursive definition
factorial' :: (Integral a) => a -> a
factorial' 0 = 1 -- Pattern
factorial' 1 = 1  
factorial' x = x * factorial' (x - 1) -- Catchall pattern

-- Straight from the recursive definition
length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

-- Straight from the recursive definition
product' :: (Num a) => [a] -> a
product' [] = 1
product' (x:xs) = x * product' xs


-- Pull out members of a triple
x3 :: (a, b, c) -> a
x3 (x, _, _) = x

x4 :: (a, b, c, d) -> a
x4 (x, _, _, _) = x

y3 :: (a, b, c) -> b
y3 (_, y, _) = y

y4 :: (a, b, c, d) -> b
y4 (_, y, _, _) = y

z3 :: (a, b, c) -> c
z3 (_, _, z) = z

z4 :: (a, b, c, d) -> c
z4 (_, _, z, _) = z

w4 :: (a, b, c, d) -> d
w4 (_, _, _, w) = w

expt' :: (Num a, Eq a) => a -> a -> a
expt' x 0 = 1
expt' x y = x * expt' x (y - 1)


------------------- GUARDS

-- Converse class standing
standing :: (Num a, Ord a) => a -> String
standing hours
    | hours < 24 = "Freshman"
    | hours < 56 = "Sophomore"
    | hours < 87 = "Junior"
    | otherwise = "Senior"

-- Eligibility to serve in Congress
eligibility :: (Num a, Ord a) => a -> a -> String
eligibility age cit
    | age >= 30 && cit >= 9 = "Senate"
    | age >= 25 && cit >= 7 = "House"
    | otherwise = "Ineligible"

fastexp' :: (Fractional a, Integral b) => a -> b -> a
fastexp' x y
    | y == 0 = 1
    | y < 0 = 1 / fastexp' x (-y)
    | y > 0 && even y = fastexp' x (y `div` 2) ^ 2
    | y > 0 && odd y = x * fastexp' x (y `div` 2) ^ 2

---------------- Where

fib :: (Integral a) => a -> a
fib n
    | n < 2 = n
    | n >= 2 = fib (n - 1) + fib (n - 2)

fib' :: (Integral a) => a -> a
fib' n
    | n < 2 = n
    | n >= 2 = fst (fastfib n) -- fastfib defined in where
    where fastfib n  -- where can define functions as well as named values
            | n < 2 = (n, 0)
            | n >= 2 = (fst prevfib + snd prevfib, fst prevfib)
            where prevfib = fastfib (n - 1) 

---------------- Let

afterTax :: (Integral a, Fractional b) => a -> b
afterTax income = let taxRate = fromIntegral((income + 999) `div` 1000) * 0.005
                      fracIncome = fromIntegral(income)
                      tax = fracIncome * taxRate
                  in fracIncome - tax

--------------- Case

length'' :: [a] -> Int
length'' xs = case xs of [] -> 0
                         (_:xs2) -> 1 + length'' xs2
