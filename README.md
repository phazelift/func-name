# func-name

A dynamically type safe, robust and flexible function name retrieve.

---

###usage

```javascript
var funcname= require( 'func-name' );

var namedFunc	= function this_is_my_name(){};
var anonymusFunc	= () => {};

console.log( funcname(namedFunc) );
// this_is_my_name

console.log( funcname(anonymusFunc) );
// an empty string literal as a logical false


// you can change the name returned for an anonymus function
funcname.anonymusName= ':(';

// or call nameAnonymus on funcname to set it, restricted to string type
funcname= require( 'func-name' ).nameAnonymus( '?' );
console.log( funcname(anonymusFunc) );
// ?

// or without argument to default to 'anonymus'
funcname= require( 'func-name' ).nameAnonymus();
console.log( funcname(anonymusFunc) );
// anonymus


// for debugging you can enable error log on passing a non-function argument
funcname.debug()

// or pass your own debug helper/handler
funcname.debug( (err) => {
	// do something with err
});
```

---

###change log

0.2.0

-	added debug method to allow for showing log or use custom event handler in case of invalid input
-	now returning the return value of the error handler for invalid input
-	optimised the flow and added some more robustness
-	updates this readme

---

###license
MIT
