namespace LibraryExamples {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Intrinsic library.
    operation IntrinsicExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Intrinsic ==============================");

        // Operations of the Microsoft.Quantum.Intrinsic library implement the standard quantum gates and measurements, and the logging function Message.

        // Example 1: Standard non-parameterized quantum gates: I, X, Y, Z, H, S, T, CNOT, SWAP, CCNOT.
        Message("\nExample 1: Standard non-parameterized quantum gates: I, X, Y, Z, H, S, T, CNOT, SWAP, CCNOT.");
        // Allocate three qubits in the |000⟩ state.
        use qs = Qubit[3] {
            // Apply H gate to the first qubit.
            H(qs[0]);
            // Apply CNOT gate to the first and second qubits.
            CNOT(qs[0], qs[1]);
            // Apply CCNOT gate to the qubits.
            CCNOT(qs[0], qs[1], qs[2]);
            // The state is now 1/sqrt(2)(|000⟩ + |111⟩).
            DumpMachine();
            ResetAll(qs);
        }

        // Example 2: Standard quantum gates with additional non-qubit inputs: R, RFrac, R1, R1Frac, Rx, Ry, Rz.
        Message("\nExample 2: Standard quantum gates with additional non-qubit inputs: R, RFrac, R1, R1Frac, Rx, Ry, Rz.");
        // Allocate a qubit in the |0⟩ state.
        use q = Qubit() {
            // Apply Ry gate.
            Ry(0.5, q);
            // The state is now 0.97|0⟩ + 0.25|1⟩.
            DumpMachine();
            Reset(q);
        }

        // Example 3: Quantum measurement in computational basis: M.
        Message("\nExample 3: Quantum measurement in computational basis: M.");
        // Allocate a qubit in the |0⟩ state.
        use q = Qubit() {
            Ry(0.5, q);
            // Measure the qubit.
            let m = M(q);
            // Yields Zero with probability 94%
            // and One with probability 6%.
            Message($"{m}");
        }

        // Example 4: Joint measurement: Measure.
        Message("\nExample 4: Joint measurement: Measure.");
        // Allocate two qubits in the |00⟩ state.
        use qs = Qubit[2] {
            H(qs[0]);
            CNOT(qs[0], qs[1]);
            let parity = Measure([PauliZ, PauliZ], qs);
            // Yields Zero with probability 100%.
            Message($"{parity}");
            ResetAll(qs);
        }

        // Example 5: Return the qubit(s) to the |0⟩ state: Reset and ResetAll.
        Message("\nExample 5: Return the qubit(s) to the |0⟩ state: Reset and ResetAll.");
        // Allocate two qubits in the |00⟩ state.
        use qs = Qubit[2] {
            H(qs[0]);
            CNOT(qs[0], qs[1]);
            // Q# requires that the qubits are measured or uncomputed before releasing them.
            // Reset/All/ performs a measurement and possibly applies a fixup X gate to return 
            // the qubit(s) to the |0⟩ state without returning the measurement result.
            Reset(qs[0]);
            ResetAll(qs);
            DumpMachine();
        }
    }
}
