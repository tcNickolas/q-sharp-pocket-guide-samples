namespace LibraryExamples {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Logical;
    open Microsoft.Quantum.Random;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Logical library.
    operation LogicalExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Logical ==============================");

        // Functions of the Microsoft.Quantum.Logical library implement equality, comparison, and logical operators.

        // Example 1: Functions implementing logical operators.
        Message("\nExample 1: Functions implementing logical operators.");
        let a = false;
        let b = true;
        Message($"not A = {Not(a)}");             // true
        Message($"A or B = {Or(a, b)}");          // true
        Message($"A and B = {And(a, b)}");        // false

        
        // Example 2: Functions implementing equality and inequality operators.
        Message("\nExample 2: Functions implementing equality and inequality operators.");
        Message($"intEquality = {EqualI(42, 10 * 4)}");                 // false
        Message($"bigIntEquality = {EqualL(13L, 0b1101L)}");            // true
        Message($"doubleInequality = {NotEqualD(1. / 0., 2. / 0.)}");   // false - both are Infinity
        Message($"boolEquality = {EqualB(true, false)}");               // false
        Message($"resultInequality = {NotEqualR(Zero, One)}");          // true

        // Example 3: Functions implementing comparison operators.
        Message("\nExample 3: Functions implementing comparison operators.");
        Message($"intGreaterThan = {GreaterThanI(42, 13)}");                 // true
        Message($"bigIntLessThan = {LessThanL(123L, 0o171L)}");              // false
        Message($"intGreaterThanOrEqual = {GreaterThanOrEqualI(12, 11)}");   // true
        Message($"doubleLessThanOrEqual = {LessThanOrEqualD(0.12, 0.11)}");  // false

        // Example 4: Functions implementing approximate floating point comparison.
        Message("\nExample 4: Functions implementing approximate floating point comparison.");
        Message($"NearlyEqual = {NearlyEqualD(0.12, 0.12+1E-13)}");  // true

        // Example 5: Lexographic comparison.
        Message("\nExample 5: Lexographic comparison.");
        let lessThanAI = LexographicComparison(LessThanOrEqualI);
        let a1 = [1, 2, 3];
        let a2 = [1, 2, 4];
        Message($"{lessThanAI(a1, a2)}");

        // Example 6: Function implementing conditional expression.
        Message("\nExample 6: Function implementing conditional expression.");
        let r1 = DrawRandomBool(0.5);
        let r2 = Conditioned(r1, 1, DrawRandomInt(2, 4));
        Message($"r1 = {r1}, r2 = {r2}");

    }
}
