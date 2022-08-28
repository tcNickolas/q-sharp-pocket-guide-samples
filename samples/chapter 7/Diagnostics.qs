namespace LibraryExamples {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Preparation;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Diagnostics library.
    operation DiagnosticsExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Diagnostics ==============================");

        // Functions of the Microsoft.Quantum.Diagnostics library allow you to inspect program elements and write tests.

        // Example 1: Inspecting quantum states: DumpMachine.
        Message("\nExample 1: Inspecting quantum states: DumpMachine.");
        use qs = Qubit[2] {
            PrepareArbitraryStateCP([
                    ComplexPolar(1., 0.),
                    ComplexPolar(0., 0.),
                    ComplexPolar(2., PI()/2.0),
                    ComplexPolar(-2., 0.)
                ],
                LittleEndian(qs));
            DumpMachine();
            ResetAll(qs);
        }
        
        // Example 2: Inspecting quantum operations: DumpOperation.
        Message("\nExample 2: Inspecting quantum operations: DumpOperation.");
        DumpOperation(2, qs => Controlled Rx(Most(qs), (PI() / 4.0, Tail(qs))));

        // Example 3: Classical condition checks: facts.
        Message("\nExample 3: Classical condition checks: facts.");
        Fact(1 > 0, "Unexpected result: 1 <= 0");
        Contradiction(1 < 0, "Unexpected result: 1 < 0");
        EqualityFactI(2 + 2, 4, "Unexpected result: 2 + 2 != 4");
        NearEqualityFactD(1.0, PI() / PI());

        // Example 4: Quantum state condition checks.
        Message("\nExample 4: Quantum state condition checks.");
        use q = Qubit() {
            Ry(2.0 * ArcTan2(0.6, 0.8), q);
            AssertQubitIsInStateWithinTolerance((Complex(.8, .0), Complex(.6, .0)), q, 1E-9);
            Reset(q);
            AssertAllZero([q]);
        }

        // Example 5: Quantum operation check: AssertOperationsEqualReferenced.
        Message("\nExample 5: Quantum operation check: AssertOperationsEqualReferenced.");
        let theta = 2.0 * PI();
        // Check that Ry(2π) is the same as the identity gate I.
        AssertOperationsEqualReferenced(1, qs => Ry(theta, qs[0]), qs => I(qs[0]));
    }
}
