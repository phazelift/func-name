# func-name

A function name retrieve with added type safety and flow to avoid crash

--

###usage

```javascript
var funcname= require( 'func-name' );

var namedFunc		= function this_is_my_name(){};
var anonymusFunc	= () => {};

console.log( funcname(namedFunc) );
// this_is_my_name

console.log( funcname(anonymusFunc) );
// an empty string literal as a logical false


// call nameAnonymus to show "anonymus" as name, or pass a custom name
funcname= require( 'func-name' ).nameAnonymus( '?' );
console.log( funcname(anonymusFunc) );
// ?
```

--

###license
MIT
