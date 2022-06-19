namespace ExpressionsExamples {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Random;

    /// # Summary
    /// The collection of examples of call expressions.
    operation CallExamples() : Unit {
        Message("============================== Q# expressions: call ==============================");

        // Call a library operation.
        let a = DrawRandomBool(0.5);
        Message($"Random boolean {a}");

        // Call a function defined in the same project (see file Range.qs).
        Message($"Range of even decreasing numbers " + RangeAsString(10..-2..1));
    }
}
