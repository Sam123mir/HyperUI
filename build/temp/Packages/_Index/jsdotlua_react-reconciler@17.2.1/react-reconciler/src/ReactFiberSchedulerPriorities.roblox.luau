















export type ReactPriorityLevel = number

local a: { [string]: ReactPriorityLevel } = {
	
	
	
	ImmediatePriority = 99,
	UserBlockingPriority = 98,
	NormalPriority = 97,
	LowPriority = 96,
	IdlePriority = 95,
	
	NoPriority = 90,
}

return a
