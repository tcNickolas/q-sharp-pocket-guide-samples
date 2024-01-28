namespace ExpressionsExamples {
    open Microsoft.Quantum.Random;
    /// # Summary
    /// The collection of examples of call expressions.
    @EntryPoint()
    operation CallExamples() : Unit {
        Message("============================== Q# expressions: call ==============================");

        // Call a library operation.
        let a = DrawRandomDouble(0.0, 0.5);
        Message($"Random floating-point {a}");

        // Call a function defined in the same project (see file Range.qs).
        Message($"Range of even decreasing numbers " + RangeAsString(10..-2..1));
    }

    function RangeAsString(r : Range) : String {
        mutable str = "";
        for i in r {
            set str += $"{i}" + " ";
        }
        return str;
    }
}
