import System.IO
import Control.Monad (when)

main :: IO ()
main = menu

menu :: IO ()
menu = do
    putStrLn "\n=== MENU DE FUNCIONES ==="
    putStrLn "1.  abs x         → Valor absoluto de x"
    putStrLn "2.  ceiling x     → Menor entero no menor que x"
    putStrLn "3.  floor x       → Mayor entero no mayor que x"
    putStrLn "4.  succ x        → Valor siguiente de x"
    putStrLn "5.  min x y       → Menor entre x y y"
    putStrLn "6.  max x y       → Mayor entre x y y"
    putStrLn "7.  div x y       → División entera de x entre y"
    putStrLn "8.  mod x y       → Módulo de x entre y"
    putStrLn "9.  even x        → x es par?"
    putStrLn "10. odd x         → x es impar?"
    putStrLn "11. gcd x y       → Máximo común divisor de x y y"
    putStrLn "12. signum x      → Signo de x"
    putStrLn "13. not x         → Negación booleana de x"
    putStrLn "14. snd (x, y)    → Segundo elemento de la tupla"
    putStrLn "15.  Salir"
    putStr "Selecciona una opcion :p "
    hFlush stdout
    opcion <- getLine
    ejecutar opcion

ejecutar :: String -> IO ()
ejecutar opcion = do
    case opcion of
        "1" -> do
            x <- leerInt "Ingresa x: "
            print (abs x)

        "2" -> do
            x <- leerDouble "Ingresa x: "
            print (ceiling x)

        "3" -> do
            x <- leerDouble "Ingresa x: "
            print (floor x)

        "4" -> do
            x <- leerInt "Ingresa x: "
            print (succ x)

        "5" -> do
            x <- leerInt "Ingresa x: "
            y <- leerInt "Ingresa y: "
            print (min x y)

        "6" -> do
            x <- leerInt "Ingresa x: "
            y <- leerInt "Ingresa y: "
            print (max x y)

        "7" -> do
            x <- leerInt "Ingresa x: "
            y <- leerInt "Ingresa y (≠ 0): "
            if y == 0 then putStrLn "Error: División por cero" else print (div x y)

        "8" -> do
            x <- leerInt "Ingresa x: "
            y <- leerInt "Ingresa y (≠ 0): "
            if y == 0 then putStrLn "Error: División por cero" else print (mod x y)

        "9" -> do
            x <- leerInt "Ingresa x: "
            print (even x)

        "10" -> do
            x <- leerInt "Ingresa x: "
            print (odd x)

        "11" -> do
            x <- leerInt "Ingresa x: "
            y <- leerInt "Ingresa y: "
            print (gcd x y)

        "12" -> do
            x <- leerInt "Ingresa x: "
            print (signum x)

        "13" -> do
            putStr "Ingresa un valor booleano True/False: "
            hFlush stdout
            val <- getLine
            case val of
                "True"  -> print (not True)
                "False" -> print (not False)
                _       -> putStrLn " Usa True o False."

        "14" -> do
            x <- leerInt "Ingresa el primer valor (x): "
            y <- leerInt "Ingresa el segundo valor (y): "
            print (snd (x, y))


        "15" -> do
            putStrLn "Bai"

        _ -> putStrLn "opcion no valida U_U"

    when (opcion /= "0") menu

-- Funciones auxiliares

leerInt :: String -> IO Int
leerInt mensaje = do
    putStr mensaje
    hFlush stdout
    readLn

leerDouble :: String -> IO Double
leerDouble mensaje = do
    putStr mensaje
    hFlush stdout
    readLn
