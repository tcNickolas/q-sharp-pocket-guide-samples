namespace LibraryExamples {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Math library.
    @EntryPoint()
    operation MathExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Math ==============================");

        // Functions of the Microsoft.Quantum.Math library implement classical arithmetic operators and mathematical functions.

        // Example 1: Functions implementing arithmetic operators.
        Message("\nExample 1: Functions implementing arithmetic operators.");
        Message($"intModulus = {ModulusI(42, 13)}");

        
        // Example 2: Classical mathematical functions: integer.
        Message("\nExample 2: Classical mathematical functions: integer.");
        Message($"intMinimum = {MinI(42, 13)}");
        Message($"bigIntMaximum = {MaxL(42L, 13L)}");
        Message($"intFactorial = {FactorialI(13)}");
        Message($"bigIntGreatestCommonDivisor = {GreatestCommonDivisorL(42L, 12L)}");
        Message($"intBitSize = {BitSizeI(13)}");
        Message($"bigIntSign = {SignL(-42L)}");


        // Example 3: Classical mathematical functions: floating-point.
        Message("\nExample 3: Classical mathematical functions: floating-point.");
        Message($"Constant π = {PI()}");
        Message($"Constant e = {E()}");
        Message($"Floor = {Floor(42.13)}");
        Message($"Ceiling = {Ceiling(42.13)}");
        Message($"Truncate = {Truncate(-42.13)}");
        Message($"Exponent = {E()^2.0}");
        Message($"Logarithm = {Log(2.0)}");
        Message($"Square root = {Sqrt(2.0)}");


        // Example 4: Classical mathematical functions: trigonometric functions.
        Message("\nExample 4: Classical mathematical functions: trigonometric functions.");
        Message($"sin π = {Sin(PI())}");
        Message($"cos 0 = {Cos(0.0)}");
        Message($"tan π/4 = {Tan(PI() / 4.0)}");
        Message($"arcsin 0 = {ArcSin(0.0)}");
        Message($"arccos 0 = {ArcCos(0.0)}");
        Message($"arctan 1 = {ArcTan(1.0)}");


        // Example 5: Complex numbers.
        Message("\nExample 5: Complex numbers.");
        let c = Complex(0.0, 1.0);
        let cp = ComplexPolar(1.0, PI() / 4.0);
        Message($"Complex number = {c!}");
        Message($"Complex polar number = {cp!}");
        Message($"Convert complex to complex polar = {ComplexAsComplexPolar(c)!}");
        Message($"Convert complex polar to complex = {ComplexPolarAsComplex(cp)!}");
        Message($"Absolute value / polar = {AbsComplex(c)} / {AbsComplexPolar(cp)}");
        Message($"Argument / polar = {ArgComplex(c)} / {ArgComplexPolar(cp)}");
        Message($"Sum = {PlusC(c, ComplexPolarAsComplex(cp))!}");
        Message($"Product = {PlusCP(ComplexAsComplexPolar(c), cp)!}");
    }
}
