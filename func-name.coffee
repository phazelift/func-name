#
# easy and type save get function name
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

	name= types.forceString funcname.anonymusName
	if types.isFunction func
		return func.name if (types.isString func.name) and func.name.length
		extract= types.forceArray /^\s*function\s*([^\(]*)/im.exec func.toString()
		if extract.length and extract[1]
			return types.forceString extract[1], name
	return name



funcname.anonymusName= '';

funcname.nameAnonymus= ( name ) ->
	funcname.anonymusName= types.forceString name, 'anonymus'
	return funcname




module.exports= funcname