















local a = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Error = a.Error
type Array<T> = a.Array<T>
type Object = { [string]: any }

type Source = {
	fileName: string,
	lineNumber: number
}


export type React_Node =
	nil
	| boolean
	| number
	| string
	| React_Element<any>
	
	
	| Array<React_Node?>
	
	| { [string]: React_Node?, UNIQUE_TAG: any? }

export type React_Element<ElementType> = {
	type: ElementType,
	props: React_ElementProps<ElementType>?,
	key: React_Key | nil,
	ref: any
}

export type React_PureComponent<Props, State = nil> = React_Component<Props, State>

export type React_AbstractComponent<Config, T> =
	React_ForwardRefComponent<Config, T>
	| React_MemoComponent<Config, T>

type React_BaseAbstractComponent<Config, T> = {
	["$$typeof"]: number,
	displayName: string?,
	defaultProps: Config?,
	
	name: string?
}


export type React_ForwardRefComponent<Config, Instance> = React_BaseAbstractComponent<
	Config,
	Instance
> & {
	render: (props: Config, ref: React_Ref<Instance>) -> React_Node,
	
	[string]: any
}

export type React_MemoComponent<Config, T> = React_BaseAbstractComponent<Config, T> & {
	type: React_StatelessFunctionalComponent<Config>,
	compare: ((oldProps: Config, newProps: Config) -> boolean)?
}


export type React_ElementConfig<C> = Object


export type React_Component<Props, State = nil> = {
	
	props: Props,
	state: State,

	

	setState: (
		self: React_Component<Props, State>,
		partialState: State | ((State, Props) -> State?),
		callback: (() -> ())?
	) -> (),

	forceUpdate: (self: React_Component<Props, State>, callback: (() -> ())?) -> (),

	

	init: ((
		self: React_Component<Props, State>,
		props: Props,
		context: any?
	) -> ())?,
	render: (self: React_Component<Props, State>) -> React_Node,
	componentWillMount: ((self: React_Component<Props, State>) -> ())?,
	UNSAFE_componentWillMount: ((self: React_Component<Props, State>) -> ())?,
	componentDidMount: ((self: React_Component<Props, State>) -> ())?,
	componentWillReceiveProps: ((
		self: React_Component<Props, State>,
		nextProps: Props,
		nextContext: any
	) -> ())?,
	UNSAFE_componentWillReceiveProps: ((
		self: React_Component<Props, State>,
		nextProps: Props,
		nextContext: any
	) -> ())?,
	shouldComponentUpdate: ((
		self: React_Component<Props, State>,
		nextProps: Props,
		nextState: State,
		nextContext: any
	) -> boolean)?,
	componentWillUpdate: ((
		self: React_Component<Props, State>,
		nextProps: Props,
		nextState: State,
		nextContext: any
	) -> ())?,
	UNSAFE_componentWillUpdate: ((
		self: React_Component<Props, State>,
		nextProps: Props,
		nextState: State,
		nextContext: any
	) -> ())?,
	componentDidUpdate: ((
		self: React_Component<Props, State>,
		prevProps: Props,
		prevState: State,
		prevContext: any
	) -> ())?,
	componentWillUnmount: ((self: React_Component<Props, State>) -> ())?,
	componentDidCatch: ((
		self: React_Component<Props, State>,
		error: Error,
		info: {
			componentStack: string		
}
	) -> ())?,
	getDerivedStateFromProps: ((props: Props, state: State) -> State?)?,
	getDerivedStateFromError: ((error: Error) -> State?)?,
	getSnapshotBeforeUpdate: ((props: Props, state: State) -> any)?,

	

	
	__refs: Object,
	__updater: any,
	

	
	
	context: any,
	getChildContext: (self: React_Component<Props, State>) -> any,
	
	__componentName: string,
	displayName: string?,
	
	name: string?,
	childContextTypes: any?,
	contextTypes: any?,
	propTypes: any?,

	
	validateProps: ((Props) -> (boolean, string?))?,

	
	
	
	
	
	defaultProps: Props?,
	
	[string]: any
}


export type React_StatelessFunctionalComponent<Props> = (
	props: Props,
	context: any
) -> React_Node
export type React_ComponentType<Config> = React_Component<Config, any>

export type React_ElementType = string | React_Component<any, any>


export type React_ElementProps<ElementType> = {
	ref: React_Ref<ElementType>?,
	key: React_Key?,
	__source: Source?,
	children: any?
}















export type React_ElementRef<C> = C

export type React_Ref<ElementType> =
	{ current: React_ElementRef<ElementType> | nil }
	| ((React_ElementRef<ElementType> | nil) -> ())



export type React_Context<T> = {
	Provider: React_ComponentType<{ value: T, children: React_Node? }>,
	Consumer: React_ComponentType<{ children: (value: T) -> React_Node? }>
}


export type React_Portal = any
export type React_Key = string | number

return {}
