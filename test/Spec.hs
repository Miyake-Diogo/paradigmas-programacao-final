{-# OPTIONS_GHC -Wno-missing-signatures #-}
{-# OPTIONS_GHC -Wno-type-defaults #-}

import           SortingAlgorithms
import           Test.Tasty
import           Test.Tasty.HUnit

main :: IO ()
main = do
  defaultMain tests

tests :: TestTree
tests =
  (testGroup "SortingAlgorithms" [test01])--, test02, test03, test04])

test01 =
  testGroup
    ""
    [ testCase "[3,4,5,2,1]" (assertEqual "[1,2,3,4,5]" (quickSort [3,4,5,2,1]))
    , testCase "[90,-1,-99,6,8,120,50]" (assertEqual "[-99,-1,6,8,50,90,120]" (quickSort [90,-1,-99,6,8,120,50]))
 ]
