










local a = require(script.Parent.Parent.Parent:WaitForChild('react-reconciler'))
type FiberRoot = a.FiberRoot

local b = require(script.Parent.Parent.Parent:WaitForChild('shared'))
type MutableSource<T> = b.MutableSource<T>
type ReactNodeList = b.ReactNodeList

type Array<T> = { [number]: T }



export type Container = Instance





export type HostInstance = Instance

export type TextInstance = Instance



export type SuspenseInstance = any

export type Type = string
export type Props = {
	autoFocus: boolean?,
	children: any,
	disabled: boolean?,
	hidden: boolean?,
	suppressHydrationWarning: boolean?,
	dangerouslySetInnerHTML: any,
	style: { display: string, [any]: any }?,
	bottom: number?,
	left: number?,
	right: number?,
	top: number?,
	
	[any]: any
}



export type HydratableInstance = Instance | SuspenseInstance



export type PublicInstance = HostInstance


type HostContextDev = {
	namespace: string,
	ancestorInfo: any,
	
	[any]: any
}
type HostContextProd = string
export type HostContext = HostContextDev | HostContextProd

export type RootType = {
	render: (self: RootType, children: ReactNodeList) -> (),
	unmount: (self: RootType) -> (),
	_internalRoot: any,
	
	
	[any]: any
}

export type RootOptions = {
	hydrate: boolean?,
	hydrationOptions: {
		onHydrated: ((suspenseNode: any) -> ())?,
		onDeleted: ((suspenseNode: any) -> ())?,
		mutableSources: Array<MutableSource<any>>?,
		
		[any]: any	
}?,
	
	[any]: any
}

return {}
