namespace ManualAdjointUnitary {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Synthesis;


    /// # Summary
    /// Applies a unitary operation V₃ = (I + 2iZ)/√5
    /// based on its unitary matrix representation.
    /// # Notes
    /// This operation uses the library operation ApplyUnitary
    /// which has adjoint variant, so its adjoint is generated automatically.
    operation V3Matrix(q : Qubit) : Unit is Adj {
        let s5 = Sqrt(5.0);
        let matrix = [[Complex(1./s5, 2./s5), Complex(0., 0.0)],
                      [Complex(0., 0.0), Complex(1./s5, -2./s5)]];
        ApplyUnitary(matrix, LittleEndian([q]));
    }


    /// # Summary
    /// Applies a unitary operation V₃ = (I + 2iZ)/√5.
    /// # Notes
    /// This operation cannot have its adjoint and controlled 
    /// specializations generated automatically due to the use of 
    /// the repeat-until-success loop and measurements.
    /// # References
    /// - [ *Adam Paetznick, Krysta M. Svore*,
    ///     Quantum Information & Computation 14(15 & 16): 1277-1301 (2014)
    ///   ](https://arxiv.org/abs/1311.1074), Figure 1a
    operation V3RUS(q : Qubit) : Unit is Adj {
        body (...) {
            use aux = Qubit[2];
            repeat {
                ApplyToEachA(H, aux);
                within {
                    Controlled X(aux, q);
                } apply {
                    S(q);
                }
                let m = [MResetX(aux[0]), MResetX(aux[1])];
                Z(q);
            } until m[0] == Zero and m[1] == Zero;
        }
        adjoint (...) {
            Adjoint V3Matrix(q);
        }
    }


    @EntryPoint()
    operation PrepareSuperpositionState() : Unit {
        Message("Matrix of the V₃ gate implemented via gate synthesis");
        DumpOperation(1, qs => V3Matrix(qs[0]));
        Message("Matrix of the V₃ gate implemented using repeat-until-success loop");
        DumpOperation(1, qs => V3RUS(qs[0]));

        // Check that the two unitaries are the same (up to a global phase).
        use q = Qubit();
        within { H(q); }
        apply {
            V3RUS(q);
            Adjoint V3Matrix(q);
        }
        AssertAllZero([q]);
    }
}
