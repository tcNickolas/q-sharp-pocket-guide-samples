namespace MutableVariablesRefactoring {
    open Microsoft.Quantum.Arrays;      // Subarray
    open Microsoft.Quantum.Canon;       // ApplyToEach
    open Microsoft.Quantum.Diagnostics; // DumpRegister
    open Microsoft.Quantum.Intrinsic;   // Message
    open Microsoft.Quantum.Measurement; // MResetZ


    /// # Summary
    /// Applies a unitary operation on the target parameter 
    /// if the given subset of the qubits of the control register
    /// is in the |1...1⟩ state.
    /// # Notes
    /// This operation cannot have its adjoint and controlled 
    /// specializations generated automatically due to the use of 
    /// the mutable variable and the set statement.
    operation ApplyControlledOnSubarray<'T>(
        qubitIndices : Int[], 
        unitary : 'T => Unit is Adj + Ctl, 
        controlRegister : Qubit[], 
        targetParameter : 'T
    ) : Unit {
        // Construct the subarray of the qubits of the control register 
        // that will be used as the control for the unitary application.
        mutable controlSubarray = [];
        for ind in qubitIndices {
            set controlSubarray += [controlRegister[ind]];
        }
        // Apply the unitary operation with the subarray as control.
        Controlled unitary(controlSubarray, targetParameter);
    }


    /// # Summary
    /// Applies a unitary operation on the target parameter 
    /// if the given subset of the qubits of the control register
    /// is in the |1...1⟩ state.
    /// # Notes
    /// This operation has adjoint and controlled specializations
    /// generated automatically, since the use of mutable variable
    /// is replaced with a call to a library function Subarray.
    operation ApplyControlledOnSubarrayCA<'T>(
        qubitIndices : Int[], 
        unitary : 'T => Unit is Adj + Ctl, 
        controlRegister : Qubit[], 
        targetParameter : 'T
    ) : Unit is Adj + Ctl {
        // Construct the subarray of the qubits of the control register 
        // that will be used as the control for the unitary application.
        let controlSubarray = Subarray(qubitIndices, controlRegister);
        // Apply the unitary operation with the subarray as control.
        Controlled unitary(controlSubarray, targetParameter);
    }


    @EntryPoint()
    operation PrepareSuperpositionState() : Unit {
        // Use statement allocates the qubits.
        use (control, target) = (Qubit[2], Qubit());
        // Prepare control register in a superposition state.
        H(control[0]);
        // Apply controlled X with just the first qubit as control.
        ApplyControlledOnSubarray([0], X, control, target);
        // Return the qubits to the |0⟩ state before releasing them.
        // ApplyControlledOnSubarray does not have an adjoint specialization defined,
        // but ApplyControlledOnSubarrayCA has one.
        Adjoint ApplyControlledOnSubarrayCA([0], X, control, target);
        H(control[0]);
    }
}
