namespace StatePreparation {
    open Microsoft.Quantum.Canon;       // ApplyToEach
    open Microsoft.Quantum.Diagnostics; // DumpRegister
    open Microsoft.Quantum.Intrinsic;   // Message
    open Microsoft.Quantum.Measurement; // MResetZ
    
    @EntryPoint()
    /// # Summary
    /// Prepares state 
    operation PrepareSuperpositionState() : Unit {
        // Use statement allocates the qubits.
        use (qs, aux) = (Qubit[2], Qubit());
        // Repeat-until loop runs until the loop body 
        // succeeds at preparing the right state.
        repeat {
            // Call statement applies H gates to qubits
            // to prep (|00⟩ + |01⟩ + |10⟩ + |11⟩) / 2.
            ApplyToEach(H, qs);
            // Conjugation statement marks the basis
            // state we need to discard (|10⟩) 
            // with |1⟩ in qubit aux.
            within {
                // Call statement applies X gate 
                // to the second qubit.
                X(qs[1]);
            } apply {
                // Call statement applies controlled
                // variant of X gate to the qubits.
                Controlled X(qs, aux);
            }
            // Variable assignment statement measures
            // qubit aux and stores the result.
            let res = MResetZ(aux);
        } until res == Zero
        fixup {
            // Call statement resets qubits to |0⟩.
            ResetAll(qs);
        }
        // Call statement prints the qubits state.
        DumpRegister((), qs);
        // Call statement resets qubits to |0⟩.
        ResetAll(qs);
    }
}
