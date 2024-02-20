namespace TestExamples {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;

    /// # Summary
    /// An operation that checks whether the two operations are equivalent
    /// using Choi–Jamiołkowski isomorphism.
    operation AssertOperationsEqual(n : Int, op1 : Qubit[] => Unit, op2 : Qubit[] => Unit is Adj) : Unit {
        use (reg1, reg2) = (Qubit[n], Qubit[n]);
        within {
            for ind in 0 .. n - 1 {
                H(reg1[ind]);
                CNOT(reg1[ind], reg2[ind]);
            }
        } apply {
            op1(reg1);
            Adjoint op2(reg1);
        }

        if not CheckAllZero(reg1 + reg2) {
            fail "Operations are not equivalent";
        }
    }


    /// # Summary
    /// A test that checks whether the Ry gate with the fixed argument 
    /// is equivalent to the identity gate.
    operation TestQuantumOperation() : Unit {
        let theta = 2.0 * PI();
        AssertOperationsEqual(1, (qs => Ry(theta, qs[0])), (qs => I(qs[0])));
    }
}
