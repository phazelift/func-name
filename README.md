# func-name

A function name retrieve with added type safety and flow to avoid crash

--

###usage

```javascript
var funcname= require( 'func-name' );

var namedFunc		= function this_is_my_name(){}
var anonymusFunc	= () => {};

console.log( funcname(namedFunc) );
// this_is_my_name
console.log( funcname(anonymusFunc) );
// anonymus
```

--

###license
MIT
