### No Need For `String.Format`

Formatting strings (ie substituting placeholders for expressions) in C# used to be inflexible and difficult to read because of `String.Format`. Luckily, in C# 6 and above you can use string interpolation.

With `String.Format`:

	String.Format("Hello, {0}!", expression);

With string interpolation:

	$"Hello, {expression}!";

Interpolated string literals are identified by the `$` token. Verbatim literals (literals that do not interpret escape sequences like `\t` for the tab character) can be also be interpolated.

	$@"C:\Users\{user.Name}";

*N.B. It's best practice to put the `$` token before the `@` token as this is required in C# 6 and 7.*