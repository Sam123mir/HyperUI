











local a = {}



a.enableFilterEmptyStringAttributesDOM = true



a.enableDebugTracing = false



a.enableSchedulingProfiler = _G.__PROFILE__ and _G.__EXPERIMENTAL__




a.debugRenderPhaseSideEffectsForStrictMode = _G.__DEV__



a.replayFailedUnitOfWorkWithInvokeGuardedCallback = _G.__DEV__


a.warnAboutDeprecatedLifecycles = true


a.enableProfilerTimer = _G.__PROFILE__


a.enableProfilerCommitHooks = false


a.enableSchedulerTracing = _G.__PROFILE__


a.enableSuspenseServerRenderer = _G.__EXPERIMENTAL__
a.enableSelectiveHydration = _G.__EXPERIMENTAL__


a.enableBlocksAPI = _G.__EXPERIMENTAL__
a.enableLazyElements = _G.__EXPERIMENTAL__


a.enableSchedulerDebugging = false


a.disableJavaScriptURLs = false


a.enableFundamentalAPI = false


a.enableScopeAPI = false


a.enableCreateEventHandleAPI = false





a.warnAboutUnmockedScheduler = false






a.enableSuspenseCallback = false




a.warnAboutDefaultPropsOnFunctionComponents = false

a.disableSchedulerTimeoutBasedOnReactExpirationTime = false

a.enableTrustedTypesIntegration = false



a.warnAboutSpreadingKeyToJSX = true

a.enableComponentStackLocations = true

a.enableNewReconciler = true





a.skipUnmountedBoundaries = true







a.disableInputAttributeSyncing = true

a.warnAboutStringRefs = false

a.disableLegacyContext = false


a.disableTextareaChildren = false

a.disableModulePatternComponents = false


a.warnUnstableRenderSubtreeIntoContainer = false


a.enableLegacyFBSupport = true






a.deferRenderPhaseUpdateToNextBatch = false


a.decoupleUpdatePriorityFromScheduler = true

a.enableDiscreteEventFlushingChange = false

a.enableEagerRootListeners = false

a.enableDoubleInvokingEffects = false
return a
