








local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Object = a.Object

local b = require(script.Parent:WaitForChild('flowtypes.roblox'))
type React_Element<ElementType> = b.React_Element<ElementType>
type React_StatelessFunctionalComponent<P> = b.React_StatelessFunctionalComponent<
	P
>
type React_ComponentType<P> = b.React_ComponentType<P>

export type Source = {
	fileName: string,
	lineNumber: number
}
type Key = string | number

export type ReactElement<P = Object, T = any> = {
	["$$typeof"]: number,

	
	type: React_StatelessFunctionalComponent<P> | React_ComponentType<P> | string,
	
	key: Key | nil,
	ref: any,
	props: P,

	
	
	_owner: any,

	
	_store: any?,
	_self: React_Element<any>?,
	_shadowChildren: any?,
	_source: Source?
}


return {}
