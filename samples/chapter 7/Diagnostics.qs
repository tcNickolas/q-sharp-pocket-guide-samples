namespace LibraryExamples {
    open Microsoft.Quantum.Diagnostics;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Diagnostics library.
    @EntryPoint()
    operation DiagnosticsExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Diagnostics ==============================");

        // Functions of the Microsoft.Quantum.Diagnostics library allow you to inspect program elements and write tests.

        // Example 1: Inspecting quantum states: DumpMachine.
        Message("\nExample 1: Inspecting quantum states: DumpMachine.");
        {
            use qs = Qubit[2];
            Ry(1.0, qs[0]);
            Rx(2.0, qs[1]);
            DumpMachine();
            ResetAll(qs);
        }
        
        // Example 3: Classical condition checks: facts.
        Message("\nExample 3: Classical condition checks: facts.");
        Fact(1 > 0, "Unexpected result: 1 <= 0");

        // Example 4: Quantum state condition checks.
        Message("\nExample 4: Quantum state condition checks.");
        use q = Qubit() {
            Ry(2.0 , q);
            Reset(q);
            if not CheckAllZero([q]) {
                fail "Qubit expected to be in |0> state";
            }
        }
    }
}
