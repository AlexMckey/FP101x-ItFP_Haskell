import Data.List
import System.Environment
import Distribution.Simple.PreProcess.Unlit

main = do
    lhsFile : hsFile : _ <- getArgs
    sources <- readFile lhsFile >>= return . (unlit lhsFile)
    let compact = unlines $ concatMap foldEmptyLines $ group $ lines sources
            where foldEmptyLines g = if null $ head g then [""] else g
    writeFile hsFile compact