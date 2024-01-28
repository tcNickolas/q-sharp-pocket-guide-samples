namespace ExpressionsExamples {
    /// # Summary
    /// The collection of examples of range expressions.
    @EntryPoint()
    operation RangeExamples() : Unit {
        Message("============================== Q# expressions: range ==============================");

        Message($"Range of consecutive increasing numbers " + RangeAsString(1 .. 10));
        Message($"Range of consecutive decreasing numbers " + RangeAsString(10 .. -1 .. 1));
        Message($"Range of odd increasing numbers " + RangeAsString(1 .. 2 .. 10));
        Message($"Range of even decreasing numbers " + RangeAsString(10 .. -2 .. 1));

        // For contextual range operator, see Array.qs, Example 4
    }

    function RangeAsString(r : Range) : String {
        mutable str = "";
        for i in r {
            set str += $"{i}" + " ";
        }
        return str;
    }
}
