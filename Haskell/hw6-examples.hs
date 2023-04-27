taxrate:: (Fractional b, Integral a) => a -> b
taxrate x = fromIntegral((x + 999) `div` 1000) * 0.005

tax :: (Fractional b, Integral a) => a -> b
tax x = taxrate x * fromIntegral x

afterTax :: (Fractional b, Integral a) => a -> b
afterTax x = fromIntegral x - tax x