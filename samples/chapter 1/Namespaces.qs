// Examples of using namespaces and open directives 
// to organize code and access callables.

namespace  A {
    operation F(a : Int) : Unit { }
}

namespace B {
    open A;

    operation F(a : Double) : Unit { }

    operation CallF() : Unit {
        // The current namespace has precedence over any open namespaces, 
        // so operation name F resolves to B.F.
        F(2.0);
        // You can still use a fully qualified name to access A.F.
        A.F(2);
    }
}

namespace C {
    open A;
    open B;

    operation CallF() : Unit {
        // Neither A.F nor B.F have precedence, so using unqualified name for F
        // would produce an error asking for a fully qualified name.
        // let res = F(2);
        // Using a fully qualified name allows to disambiguate.
        let resI = A.F(2); 
        let resD = B.F(2.0);
    }
}
