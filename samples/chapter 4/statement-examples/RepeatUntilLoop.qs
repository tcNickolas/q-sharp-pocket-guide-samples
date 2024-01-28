namespace StatementsExamples {
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Diagnostics;

    /// # Summary
    /// The collection of quantum conditional loop examples.
    @EntryPoint()
    operation RepeatUntilExamples() : Unit {
        Message("============================== Q# statements: quantum conditional loop ==============================");

        // Example: switch a qubit from the |0⟩ state to the |1⟩ state using H gate and measurements.
        Message("\nExample: Switch a qubit from the |0⟩ state to the |1⟩ state using H gate and measurements.");
        use q = Qubit();
        Message("Qubit state before the loop");
        DumpMachine();
        mutable res = Zero;
        repeat {
            H(q);
            set res = MResetZ(q);
        } until res == One;
        Message("Qubit state after the loop");
        DumpMachine();
    }
}
