namespace LibraryExamples {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Canon library.
    @EntryPoint()
    operation CanonExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Canon ==============================");

        // Example 1: Controlling operations.
        Message("\nExample 1: Controlling operations.");
        use qs = Qubit[3] {
            // Apply H gate to all elements of qs except the last one.
            ApplyToEach(H, Most(qs));
            // Flip the state of the last qubit for two control strings: 01 and 10.
            ApplyControlledOnInt(2, X, Most(qs), Tail(qs));
            ApplyControlledOnBitString([true, false], X, Most(qs), Tail(qs));
            DumpMachine();
            ResetAll(qs);
        }
    }
}
