










export type Flags = number

local a = {}


a.NoFlags = 
	0b000000000000000000
a.PerformedWork = 
	0b000000000000000001


a.Placement = 
	0b000000000000000010
a.Update = 
	0b000000000000000100
a.PlacementAndUpdate = 
	0b000000000000000110
a.Deletion = 
	0b000000000000001000
a.ContentReset = 
	0b000000000000010000
a.Callback = 
	0b000000000000100000
a.DidCapture = 
	0b000000000001000000
a.Ref = 
	0b000000000010000000
a.Snapshot = 
	0b000000000100000000
a.Passive = 
	0b000000001000000000

a.PassiveUnmountPendingDev = 
	0b000010000000000000
a.Hydrating = 
	0b000000010000000000
a.HydratingAndUpdate = 
	0b000000010000000100


a.LifecycleEffectMask = 
	0b000000001110100100


a.HostEffectMask = 
	0b000000011111111111


a.Incomplete = 
	0b000000100000000000
a.ShouldCapture = 
	0b000001000000000000
a.ForceUpdateForLegacySuspense = 
	0b000100000000000000






a.PassiveStatic = 
	0b001000000000000000


a.BeforeMutationMask = 
	0b000000001100001010
a.MutationMask = 
	0b000000010010011110
a.LayoutMask = 
	0b000000000010100100
a.PassiveMask = 
	0b000000001000001000




a.StaticMask = 
	0b001000000000000000




a.MountLayoutDev = 
	0b010000000000000000
a.MountPassiveDev = 
	0b100000000000000000

return a
