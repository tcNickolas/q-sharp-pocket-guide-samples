namespace CallableExamples {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;

    /// # Summary
    /// The collection of examples of representing gates and measurements in Q#.
    @EntryPoint()
    operation GatesMeasurementsExamples() : Unit {
        Message("============================== Q# callables: quantum gates and measurements ==============================");

        // Example 1: Non-parameterized quantum gates.
        Message("\nExample 1: Non-parameterized quantum gates.");
        // Allocate two qubits in the |00⟩ state.
        use qs = Qubit[2] {
            // Apply the Hadamard gate to the first qubit.
            H(qs[0]);
            // Apply the CNOT gate to the qubits.
            CNOT(qs[0], qs[1]);
            // The state is now (|00⟩ + |11⟩)/√2.
            DumpMachine();
            ResetAll(qs);
        }

        // Example 2: Quantum gates with additional non-qubit inputs.
        Message("\nExample 2: Quantum gates with additional non-qubit inputs.");
        // Allocate a qubit in the |0⟩ state.
        use q = Qubit() {
            // Apply Ry gate.
            Ry(0.5, q);
            // The state is now 0.97|0⟩ + 0.25|1⟩.
            DumpMachine();
            Reset(q);
        }

        // Example 3: Quantum measurement in computational basis.
        Message("\nExample 3: Quantum measurement in computational basis.");
        // Allocate a qubit in the |0⟩ state.
        use q = Qubit() {
            Ry(0.5, q);
            // Measure the qubit.
            let m = M(q);
            // Yields Zero with probability 94%
            // and One with probability 6%.
            Message($"{m}");
        }
        // Allocate two qubits in the |00⟩ state.
        use qs = Qubit[2] {
            H(qs[0]);
            CNOT(qs[0], qs[1]);
            let ms = MeasureEachZ(qs);
            // Yields [Zero, Zero] with probability 50%
            // and [One, One] with probability 50%.
            Message($"{ms}");
        }

        // Example 4: Joint measurement.
        Message("\nExample 4: Joint measurement.");
        // Allocate two qubits in the |00⟩ state.
        use qs = Qubit[2] {
            H(qs[0]);
            CNOT(qs[0], qs[1]);
            let parity = Measure([PauliZ, PauliZ], qs);
            // Yields Zero with probability 100%.
            Message($"{parity}");
            ResetAll(qs);
        }
    }
}
