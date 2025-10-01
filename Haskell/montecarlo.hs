import System.Random (randomRIO)

puntoAleatorio :: IO (Double, Double)
puntoAleatorio = do
    x <- randomRIO(-1.0, 1.0)
    y <- randomRIO(-1.0, 1.0)
    return (x,y)


estaDentroCirculo :: (Double, Double) -> Bool
estaDentroCirculo (x,y) = x*x + y*y <= 1.0

calcularPI :: Int -> IO Double
calcularPI n = do
    puntos <- mapM(\_ -> puntoAleatorio)  [1..n]
    let dentroCirculo = length (filter estaDentroCirculo puntos)
    return (4.0 * fromIntegral dentroCirculo / fromIntegral n)

main :: IO ()
main = do
    putStrLN "Ingrese el numero de dardos: "
    n <- readLn
    piAprox <- calcularPI n 
    putStrLN ("PI vale: "++ show piAprox)
    --cabal install -- lib random