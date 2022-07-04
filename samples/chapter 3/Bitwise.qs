namespace ExpressionsExamples {
    open Microsoft.Quantum.Intrinsic;

    /// # Summary
    /// The collection of examples of bitwise expressions.
    operation BitwiseExamples() : Unit {
        Message("============================== Q# expressions: bitwise expressions ==============================");

        // Bitwise expressions are defined for Int and BigInt types.
        let a = 42;                            //  42 = 0b101010
        let b = 13;                            //  13 = 0b001101
        Message($"A and B = {a &&& b}");       //   8 = 0b001000
        Message($"A or B = {a ||| b}");        //  47 = 0b101111
        Message($"A xor B = {a ^^^ b}");       //  39 = 0b100111
        Message($"not A = {~~~a}");            // -43
        Message($"A >>> 2 = {a >>> 2}");       //  10 = 0b001010
        Message($"A <<< 1 = {a <<< 1}");       // 84 = 0b1010100
    }
}
