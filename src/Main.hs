-----------------------------------------------------------------------------
--
-- Module      :  Main
-- Copyright   :  
-- License     :  MIT License
--
-- Maintainer  : Robert F. Dickerson
-- Stability   :
-- Portability :
--
-- |
--
-----------------------------------------------------------------------------



module Main where

-- | Acceleration due to gravity.
gravityAccel :: Double
gravityAccel = 9.8

printAngle :: Maybe Double -> String
printAngle x = case x of
             Just r -> show (r)
             Nothing -> "Bad angles"

epsilon :: Double
epsilon = 0.002


type Position = (Double, Double)
type Force = (Double, Double)
type Velocity = (Double, Double)
type Vertex = (Double, Double)

--data TriangleInfo = 
--  Triangle {a :: Vertex, b :: Vertex, c :: Vertex}
--    deriving (Show)

data TriangleInfo =
  Triangle Vertex Vertex Vertex
    deriving (Show)

subVector :: Vertex -> Vertex -> Vertex
subVector v0 v1 = (fst v0 - fst v1, snd v0 - snd v1)

areaTriangle :: Triangle -> Double
areaTriangle a = 0.5 * 

data Particle
  =
    Bead
    !Position
    !Velocity
    deriving Show

main :: IO ()
main = putStrLn (printAngle (angle [3,7] [5,6]))

newtonRaphson :: Double -> (Double -> Double) -> Double
newtonRaphson guess f
  | difference <= epsilon = newguess
  | otherwise = newtonRaphson newguess f
  where
    newguess = guess - f guess/fprime guess
    difference = abs(newguess - guess)
    fprime = deriv f

mysqrt :: Double -> Double -> Double
mysqrt a x
  | difference <= epsilon = newguess
  | otherwise = mysqrt a newguess
  where
    newguess = 1 / 2 * (x + a/x)
    difference = abs(newguess - x)


deriv :: (RealFloat a) => (a->a) -> a -> a
deriv f x = (f (x + dx) - f x) / dx
    where dx = 0.0001*x

-- Some example functions that I don't use
-- g :: (RealFloat a) => a -> a
-- g x = x^3 - 4*x + 1

-- g2 :: (RealFloat a) => a -> a -> a
-- g2 y x = x*y

-- Euler method
euler :: (Double->Double) -> Double -> Double
euler f y0 = y0 + h * f y0
    where h = 0.1
          
-- Backwards Euler --------------------
eulerBackwards :: 
	(Double->Double) -> 
	Double -> 
	Double

eulerBackwards f y0 = newtonRaphson guess g
  where 
    h = 0.002
    guess = euler f y0
    g = (\x -> x - y0 - h*f x)


infinitelist = 1.0 : map (+ 0.01) infinitelist
-- function, x0, y0

eulerIter :: (Double->Double) -> Double -> [Double]
eulerIter f y0 = y0 : eulerIter f yp 
  where 
    yp = eulerBackwards f y0 

{-eulerIter :: (Double->Double) -> Double -> Double -> [(Double,Double)]
eulerIter f x0 y0 = x
  where 
    dx = 0.001
    yp = euler f y0
    x = 1.0 : map (+ dx) x
    -}

-- Modified Euler method
{-
eulerModified :: (RealFloat a) => (a->a->a) -> a -> a -> a
eulerModified f y0 x0 = y0 + h/2 * ( yp0 + yp1)
  where
    yp0 = f y0 x0
    yp1 = euler f y0 x0
    h = 0.0001
-}

mag :: [Double] -> Double
mag [] = 0
mag v = sqrt(sumsqr)
  where sumsqr = foldr (\x y -> x^2 + y) 0 v

dot :: [Double] -> [Double] -> Maybe Double
dot [] [] = Just 0.0
dot (x:xs) [] = Nothing
dot [] (x:xs) = Nothing
dot (x:xs) (y:ys) =  case dot xs ys of
   Just r -> Just(x * y + r)
   Nothing -> Nothing

myreverse :: [Char] -> [Char]
myreverse [] = []
myreverse (x:xs) = myreverse xs ++ [x]


angle :: [Double] -> [Double] -> Maybe Double
angle a b = case dot a b of
  Just r -> Just( acos (r / (mag a * mag b)))
  Nothing -> Nothing

 

  -- gprime :: (RealFloat a) => a -> a
-- gprime x = 3*x^2 - 4

