﻿namespace TestExamples {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Preparation;

    /// # Summary
    /// A test that checks whether the Ry gate
    /// prepares the expected quantum state.
    @Test("QuantumSimulator")
    operation TestSingleQubitState() : Unit {
        use q = Qubit();
        Ry(2.0 * ArcTan2(0.6, 0.8), q);
        AssertQubitIsInStateWithinTolerance((Complex(.8, .0), Complex(.6, .0)), q, 1E-9);
        Reset(q);
    }


    /// # Summary
    /// A helper operation that checks whether the given qubits are in the given state.
    operation AssertQubitsAreInState(
        coefficients : ComplexPolar[],
        qubits : Qubit[]
    ) : Unit is Adj + Ctl {
        within {
            Adjoint PrepareArbitraryStateCP(coefficients, LittleEndian(qubits));
        } apply {
            AssertAllZero(qubits);
        }
    }


    /// # Summary
    /// A test that checks whether the pair of Ry gates
    /// prepares the expected quantum state.
    @Test("QuantumSimulator")
    operation TestMultiQubitState() : Unit {
        use qs = Qubit[2];
        for q in qs {
            Ry(2.0 * ArcTan2(0.6, 0.8), q);
        }
        AssertQubitsAreInState(
            [
                ComplexPolar(0.64, 0.),
                ComplexPolar(0.48, 0.),
                ComplexPolar(0.48, 0.),
                ComplexPolar(0.36, 0.)
            ], 
            qs);
        ResetAll(qs);
    }
}
