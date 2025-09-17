-- Promedio de 4 números
promedio :: Float -> Float -> Float -> Float -> Float
promedio a b c d = (a + b + c + d) / 4

-- Suma de monedas
monedas :: Int -> Int -> Int -> Int -> Float
monedas a b c d = fromIntegral (a*1 + b*5 + c*10 + d*50)

-- Volumen de una esfera
volumenEsfera :: Float -> Float
volumenEsfera r = (4/3) * pi * r^3

-- Verificar si a, b y c son iguales
iguales :: Int -> Int -> Int -> Bool
iguales a b c = a == b && b == c

-- Verificar si a, b y c son diferentes
diferentes :: Int -> Int -> Int -> Bool
diferentes a b c = a /= b && b /= c && a /= c

-- Precio final con descuentos
precioFinal :: Float -> Float
precioFinal x
    | x > 1000  = x * 0.6    -- 40% descuento
    | x > 500   = x * 0.7    -- 30% descuento
    | x > 100   = x * 0.9    -- 10% descuento
    | otherwise = x

-- Última cifra de un número
ultimaCifra :: Int -> Int
ultimaCifra n = n `mod` 10

-- Menú de opciones
menu :: IO ()
menu = do
    putStrLn "\nSelecciona una opción :P:"
    putStrLn "0. Salir"
    putStrLn "1. Promedio de 4 números"
    putStrLn "2. Suma de monedas"
    putStrLn "3. Volumen de una esfera"
    putStrLn "4. Verificar si tres números son iguales"
    putStrLn "5. Verificar si tres números son diferentes"
    putStrLn "6. Calcular precio final con descuento"
    putStrLn "7. Última cifra de un número"
    opcion <- getLine
    case opcion of
        "0" -> putStrLn "Bai ᓚᘏᗢ"
        "1" -> do
            putStrLn "Ingresa 4 números:"
            a <- readLn :: IO Float
            b <- readLn :: IO Float
            c <- readLn :: IO Float
            d <- readLn :: IO Float
            print (promedio a b c d)
            menu
        "2" -> do
            putStrLn "Ingresa la cantidad de monedas a=$1, b=$5, c=$10, d=$50:"
            a <- readLn :: IO Int
            b <- readLn :: IO Int
            c <- readLn :: IO Int
            d <- readLn :: IO Int
            print (monedas a b c d)
            menu
        "3" -> do
            putStrLn "Ingresa el radio de la esfera:"
            r <- readLn :: IO Float
            print (volumenEsfera r)
            menu
        "4" -> do
            putStrLn "Ingresa tres números:"
            a <- readLn :: IO Int
            b <- readLn :: IO Int
            c <- readLn :: IO Int
            print (iguales a b c)
            menu
        "5" -> do
            putStrLn "Ingresa tres números:"
            a <- readLn :: IO Int
            b <- readLn :: IO Int
            c <- readLn :: IO Int
            print (diferentes a b c)
            menu
        "6" -> do
            putStrLn "Ingresa el precio de la compra:"
            x <- readLn :: IO Float
            print (precioFinal x)
            menu
        "7" -> do
            putStrLn "Ingresa un número:"
            n <- readLn :: IO Int
            print (ultimaCifra n)
            menu
        _ -> do
            putStrLn "Opción no valida U_U"
            menu

-- Punto de entrada
main :: IO ()
main = menu
