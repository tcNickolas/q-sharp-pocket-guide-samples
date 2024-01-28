namespace CallableExamples {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;

    // Add "is Adj + Ctl" suffix to generate specializations automatically.
    operation ApplyRyArrayCA(
        qs : Qubit[],
        angles : Double[]
    ) : Unit is Adj + Ctl {
        for (q, angle) in Zipped(qs, angles) {
            Ry(angle, q);
        }
    }


    // You can define specializations manually.
    operation ApplyRyArrayCAManual(
        qs : Qubit[],
        angles : Double[]
    ) : Unit is Adj + Ctl {
        body (...) {
            for (q, angle) in Zipped(qs, angles) {
                Ry(angle, q);
            }
        }
        adjoint (...) {
            // The gates applied to different qubits
            // commute, so no need to reverse loop.
            for (q, angle) in Zipped(qs, angles) {
                // Adjoint of a rotation gate is
                // the same gate with the opposite
                // rotation angle.
                Ry(-angle, q);
            }
        }
        controlled (cs, ...) {
            for (q, angle) in Zipped(qs, angles) {
                Controlled Ry(cs, (angle, q));
            }
        }
        controlled adjoint auto;
    }

    /// # Summary
    /// The collection of examples of working with adjoint and controlled specializations.
    @EntryPoint()
    operation AdjointControlledExamples() : Unit {
        Message("============================== Q# callables: adjoint and controlled ==============================");

        // Example 1: Calling adjoint specialization.
        Message("\nExample 1: Calling adjoint specialization.");
        use qs = Qubit[2] {
            let angles = [0.2, 0.4];
            Adjoint ApplyRyArrayCA(qs, angles);
            DumpMachine();
            ResetAll(qs);
        }

        // Example 2: Calling controlled specialization.
        Message("\nExample 1: Calling controlled specialization.");
        use (cs, qs) = (Qubit[1], Qubit[2]) {
            H(cs[0]);
            let angles = [0.2, 0.4];
            Controlled ApplyRyArrayCAManual(cs, (qs, angles));
            DumpMachine();
            ResetAll(cs + qs);
        }
    }
}
