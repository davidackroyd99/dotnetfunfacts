### The Difference Between Readonly and Const

The difference between the `const` modifier and the `readonly` modifier is that a field declared `const` has to be fully evaluable at compile time, where as a field declared `readonly` is evaluated at runtime. In addition, a read-only field can be assigned in a constructor or in the initialiser of that field. Constants must be value types but read-only fields can be either value or reference types - declaring a read-only reference field does not make the object that the field refers to immutable, it only makes the reference itself immutable.
