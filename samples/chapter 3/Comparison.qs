namespace ExpressionsExamples {
    /// # Summary
    /// The collection of examples of comparison expressions.
    @EntryPoint()
    operation ComparisonExamples() : Unit {
        Message("============================== Q# expressions: comparison ==============================");

        // Comparison operators check which of their operands is greater or less.
        // They are defined for types Int, BigInt, and Double.
        Message($"intGreaterThan = {42 > 13}");              // true
        Message($"bigIntLessThan = {123L < 0o171L}");        // false
        Message($"intGreaterThanOrEqual = {12 >= 11}");      // true
        Message($"doubleLessThanOrEqual = {0.12 <= 0.11}");  // false
    }
}
