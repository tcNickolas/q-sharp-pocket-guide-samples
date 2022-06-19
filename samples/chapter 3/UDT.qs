namespace ExpressionsExamples {
    open Microsoft.Quantum.Intrinsic;

    newtype AnonymousPair = (Int, Bool);
    newtype NamedPair = (First : Int, Second : Bool);

    /// # Summary
    /// The collection of examples of user-defined type expressions.
    operation UDTExamples() : Unit {
        Message("============================== Q# expressions: user-defined type expressions ==============================");

        // Example 1: creating UDTs using constructor expressions.
        Message("\nExample 1: UDT constructor expressions.");
        let ap = AnonymousPair(1, false);
        let np = NamedPair(2, true);
        Message($"UDT with anonymous items = {ap}");
        Message($"UDT with named items = {np}");

        // Example 2: named items access operator.
        Message("\nExample 2: Accessing named UDT items.");
        Message($"First = {np::First}, Second = {np::Second}");

        // Example 3: unwrap operator.
        Message("\nExample 3: Accessing unnamed UDT items.");
        let nonUDTTuple = ap!;
        let (fst, snd) = np!;
        Message($"Unwrapped unnamed UDT = {nonUDTTuple}");
        Message($"First = {fst}, Second = {snd}");

        // Example 4: copy-and-update expression creates a copy of the UDT with some items replaced.
        Message("\nExample 4: Copy-and-update expression.");
        let updFirst = np w/ First <- 3;
        let updBoth = np w/ First <- 4 
                         w/ Second <- false;
        Message($"Updated UDT = {updBoth}");
    }
}
