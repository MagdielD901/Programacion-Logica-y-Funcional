public class Example {
    public static void main(String[] args) {
        
        
        
        // int x = 10;
        // int b = 10;



        // Expresión #1
        int x = 10;
        int b = 10;
        System.out.println("Expresión #1:");
        // x++ imprime el valor actual de x y luego lo incrementa
        System.out.println(x++); // Resultado = 10 (luego x = 11)




        // Expresión #2
        x = 10;
        b = 10;
        System.out.println("\nExpresión #2:");
        // ++x incrementa primero y luego imprime
        System.out.println(++x); // Resultado = 11




        // Expresión #3
        x = 10;
        b = 10;
        System.out.println("\nExpresión #3:");
        // Evaluación: (10 * -3) == (-3 % 10)
        boolean result3 = (b++ * -3) == (-3 % x++);
        System.out.println("Resultado: " + result3); // Resultado = false
        // Explicación:
        // b++ * -3 → 10 * -3 = -30, b ahora es 11
        // -3 % x++ → -3 % 10 = -3, x ahora es 11
        // -30 == -3 → false




        // Expresión #4 (Corregido)
        x = 10;
        b = 10;
        System.out.println("\nExpresión #4:");
        // Expresión original no es válida: 30 - 10 /= % ++b + 30 % 7 * 2
        // Analizar el resultado de una expresión aritmética compleja
        int resultado4 = 30 - 10 / ( ++b + 30 % 7 * 2 );
        System.out.println("Resultado: " + resultado4);
        // ++b → 11, 30 % 7 = 2, 2 * 2 = 4, 11 + 4 = 15
        // 10 / 15 = 0, 30 - 0 = 30




        // Expresión #5 (Corregido)
        x = 10;
        b = 10;
        System.out.println("\nExpresión #5:");
        // Expresión original: x =  -50 * x++ * 80 % b / 4 *=8 → inválida
        // Se corrige para obtener un valor
        int resultado5 = (-50 * x++ * 80) % b / 4 * 8;
        System.out.println("Resultado: " + resultado5);
        // x++ = 10 → luego x = 11
        // -50 * 10 * 80 = -40000, -40000 % 10 = 0
        // 0 / 4 * 8 = 0





        // Expresión #6
        x = 10;
        b = 10;
        System.out.println("\nExpresión #6:");
        b *= x++ - 8 + 3 - 5 / 4 % -3 + 8;
        System.out.println("Resultado: b = " + b);
        // x++ = 10 → x = 11
        // 10 - 8 + 3 = 5
        // 5 / 4 = 1; 1 % -3 = 1
        // 5 - 1 + 8 = 12
        // b = 10 * 12 = 120




        // Expresión #7 (Corregido)
        x = 10;
        b = 10;
        System.out.println("\nExpresión #7:");
        // Expresión original mal: x = b *= 50 / 30 * ++x + 80
        // Se corrige para entender la operación
        b *= (50 / 30 * ++x + 80);
        x = b;
        System.out.println("Resultado: x = " + x + ", b = " + b);
        // ++x = 11 → x = 11
        // 50 / 30 = 1 (int division), 1 * 11 = 11, + 80 = 91
        // b = 10 * 91 = 910; x = 910




        // Expresión #8 (Corregido)
        x = 10;
        b = 10;
        System.out.println("\nExpresión #8:");
        // Expresión original mal: ++x % 20.2 == -x /= b % = --x
        // Error por uso de double y operadores inválidos
        // Solución alternativa válida -solo para demostración
        boolean resultado8 = (++x % 20 == (-x / (b % --x)));
        System.out.println("Resultado: " + resultado8);
        // ++x = 11
        // --x = 10 → b % 10 = 0 → división por cero → error en la ejecución

        // Prevención del error:
        System.out.println("Evita división por cero (expresión mal formada)");




        // Expresión #9 (Corregido)
        x = 10;
        b = 10;
        System.out.println("\nExpresión #9:");
        // Expresión original inválida: 1 *= b++ * b-- / 3 % ++b *= 10 + 1
        // Variables no asignables a una constante (1)
        // Corregimos para simular la intención:
        int temp9 = b++ * b-- / 3 % ++b * (10 + 1);
        System.out.println("Resultado: " + temp9);




        // Expresión #10 (Corregido)
        x = 10;
        System.out.println("\nExpresión #10:");
        // Expresión inválida: -10 * -0 *= -10 *=x++ + x+=x*x
        // Corrigiendo por partes
        int temp10 = -10 * 0 * -10 * (x++ + (x += x * x));
        System.out.println("Resultado: " + temp10);
        // x++ = 10 (x ahora 11), x += 11*11 = 121 → x = 132
        // total: 10 + 132 = 142
        // -10 * 0 * -10 * 142 = 0




        // Expresión #11 (Corregido)
        x = 10;
        b = 10;
        int a = 5;
        System.out.println("\nExpresión #11:");
        boolean resultado11 = a * b == b++ + b-- + --b + x++ + x--;
        System.out.println("Resultado: " + resultado11);
        // a*b = 5*10 = 50
        // b++ = 10 (b=11), b-- = 11 (b=10), --b = 9
        // x++ = 10 (x=11), x-- = 11 (x=10)
        // 10 + 11 + 9 + 10 + 11 = 51 → 50 == 51 → false

    }
}
