{-# LANGUAGE ScopedTypeVariables #-}
module LibSpec (spec) where

import Lib (square, ggT)
import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = do
    describe "square" $ do
        it "calculates the square of 5.3" $
            square 5.3 `shouldBe` 28.09
        it "calculates the square of an arbitrary integer" $
            property $ \(n :: Integer) -> square n == n * n
        it "calculates the square of an arbitrary double" $
            property $ \(n :: Double) -> square n == n * n   
    describe "ggT" $ do 
        it "calculates the greatest common divider of 96 and 126" $
            ggT 96 126 `shouldBe` 6
        it "calculates the same as Haskells gcd" $
            property $ \(a :: Integer) (b :: Integer) -> ggT a b == gcd a b
        