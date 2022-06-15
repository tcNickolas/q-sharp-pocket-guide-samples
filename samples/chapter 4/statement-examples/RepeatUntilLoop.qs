namespace StatementsExamples {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;


    /// # Summary
    /// The collection of quantum conditional loop examples.
    operation RepeatUntilExamples() : Unit {
        Message("============================== Q# statements: quantum conditional loop ==============================");

        // Example: switch a qubit from the |0⟩ state to the |1⟩ state using H gate and measurements.
        Message("\nExample: Switch a qubit from the |0⟩ state to the |1⟩ state using H gate and measurements.");
        use q = Qubit();
        Message("Qubit state before the loop");
        DumpMachine();
        repeat {
            H(q);
            let res = M(q);
        } until res == One;
        Message("Qubit state after the loop");
        DumpMachine();
    }
}
