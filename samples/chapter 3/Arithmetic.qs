namespace ExpressionsExamples {
    open Microsoft.Quantum.Intrinsic;

    /// # Summary
    /// The collection of examples of arithmetic expressions.
    operation ArithmeticExamples() : Unit {
        Message("============================== Q# expressions: arithmetic expressions ==============================");

        // Arithmetic expressions are defined for Int, BigInt, and Double types.
        Message($"intAddition = {42 + 13}");
        Message($"bigIntSubtraction = {42L - 13L}");
        Message($"doubleMultiplication = {42. * 13.}");
        Message($"intDivision = {42 / 13}");
        Message($"bigIntNegation = {-42L}");
        Message($"doubleExponentiation = {42. ^ 13.}");
        Message($"intModulus = {42 % 13}");
    }
}
