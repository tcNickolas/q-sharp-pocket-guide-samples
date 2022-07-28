namespace LibraryExamples {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Bitwise;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Bitwise library.
    operation BitwiseExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Bitwise ==============================");

        // Functions of the Microsoft.Quantum.Bitwise library implement bitwise operators.

        // Example 1: Functions implementing bitwise operators.
        Message("\nExample 1: Functions implementing bitwise operators.");
        let a = 42;                                   //  42 = 0b101010
        let b = 13;                                   //  13 = 0b001101
        Message($"A and B = {And(a, b)}");            //   8 = 0b001000
        Message($"A or B = {Or(a, b)}");              //  47 = 0b101111
        Message($"A xor B = {Xor(a, b)}");            //  39 = 0b100111
        Message($"not A = {Not(a)}");                 // -43
        Message($"A >>> 2 = {RightShiftedI(a, 2)}");  //  10 = 0b001010
        Message($"A <<< 1 = {LeftShiftedI(a, 1)}");   // 84 = 0b1010100

        
        // Example 2: Parity function.
        Message("\nExample 2: Parity function.");
        Message($"Parity({a}) = {Parity(a)}");        // 1
    }
}
