#
# A rudimentary and type save function name retrieve
#
# MIT License
#
# Copyright (c) 2016 Dennis Raymondo van der Sluis
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

types= require 'types.js'



funcname= ( func ) ->

	if types.notFunction func
		return funcname.log 'func-name: error, cannot get function name from a non-function argument!'

	# might be present
	return func.name if (types.isString func.name) and func.name.length

	# extract from function with regexp
	extract= types.forceArray /^\s*function\s*([^\(]*)/im.exec func.toString()
	return extract[1] if (extract.length > 1) and (types.isString extract[1]) and extract[1].length

	# fallback to default
	return types.forceString funcname.anonymusName



# default anonymus name to be an empty string as logical false
funcname.anonymusName= '';

# allow for custom anonymus name, restricted to String type, fallback to 'anonymus'
funcname.nameAnonymus= ( name ) ->
	funcname.anonymusName= types.forceString name, 'anonymus'
	return funcname



# default no error log, run as empty function
funcname.log= types.forceFunction()

funcname.debug= ( handler ) ->
	funcname.log= types.forceFunction handler, console.log
	return funcname



module.exports= funcname