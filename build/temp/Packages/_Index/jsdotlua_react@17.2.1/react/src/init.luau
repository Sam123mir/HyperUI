











local a = require(script.Parent:WaitForChild('luau-polyfill'))
export type Object = a.Object

local b = require(script:WaitForChild('React'))

export type Binding<T> = b.ReactBinding<T>
export type BindingUpdater<T> = b.ReactBindingUpdater<T>


local c = require(script:WaitForChild('ReactLazy'))
export type LazyComponent<T, P> = c.LazyComponent<T, P>

local d = require(script.Parent:WaitForChild('shared'))
export type StatelessFunctionalComponent<P> =
	d.React_StatelessFunctionalComponent<P>

export type ComponentType<P> = ComponentClass<P> | FC<P>

export type AbstractComponent<Config, Instance> = d.React_AbstractComponent<
	Config,
	Instance
>
export type ElementType = d.React_ElementType
export type Element<C> = d.React_Element<C>
export type Key = d.React_Key
export type Ref<ElementType> = d.React_Ref<ElementType>
export type Node = d.React_Node
export type Context<T> = d.ReactContext<T>

export type ElementProps<C> = d.React_ElementProps<C>
export type ElementConfig<T> = d.React_ElementConfig<T>
export type ElementRef<C> = d.React_ElementRef<C>




export type ComponentClass<P> = d.React_ComponentType<P>
export type PureComponent<Props, State = nil> = b.PureComponent<Props, State>



export type ReactElement<Props = Object, ElementType = any> = d.ReactElement<
	Props,
	ElementType
>

export type ReactChild = d.ReactElement<any, string> | string | number
export type FC<P> = d.React_StatelessFunctionalComponent<P>
export type ReactNode = d.React_Node



export type React_AbstractComponent<Props, Instance> = d.React_Component<
	Props,
	Instance
>
export type React_FowardRefComponent<Props, Instance> =
	d.React_ForwardRefComponent<Props, Instance>
export type React_MemoComponent<Config, T> = d.React_MemoComponent<Config, T>
export type React_Component<Props, State> = d.React_Component<Props, State>
export type React_ComponentType<P> = d.React_ComponentType<P>
export type React_Context<T> = d.React_Context<T>
export type React_Element<ElementType> = d.React_Element<ElementType>
export type React_ElementType = d.React_ElementType
export type React_Node = d.React_Node



return b
