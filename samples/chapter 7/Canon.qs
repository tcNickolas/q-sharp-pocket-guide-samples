namespace LibraryExamples {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Preparation;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Canon library.
    operation CanonExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Canon ==============================");

        // Example 1: Controlling operations.
        Message("\nExample 1: Controlling operations.");
        use qs = Qubit[3] {
            // Apply H gate to all elements of qs except the last one.
            ApplyToEach(H, Most(qs));
            // Flip the state of the last qubit for two control strings: 01 and 10.
            ControlledOnInt(2, X)(Most(qs), Tail(qs));
            ControlledOnBitString([true, false], X)(Most(qs), Tail(qs));
            DumpMachine();
            ResetAll(qs);
        }

        // Example 2: Special gates.
        Message("\nExample 2: Special gates.");
        Message("CZ gate");
        DumpOperation(2, qs => CZ(qs[0], qs[1]));
        Message("ApplyDiagonalUnitary");
        DumpOperation(2, qs => ApplyDiagonalUnitary([0.25 * PI(), 0.5 * PI(), 0.75 * PI(), PI()], LittleEndian(qs)));

        // Example 3: Composing callables.
        Message("\nExample 3: Composing callables.");
        Message("Bell state preparation unitary");
        DumpOperation(2, BoundCA([qs => H(qs[0]), qs => CNOT(qs[0], qs[1])]));
    }
}
