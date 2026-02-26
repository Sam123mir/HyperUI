--[[
     _      ___         ____  ______
    | | /| / (_)__  ___/ / / / /  _/
    | |/ |/ / / _ \/ _  / /_/ // /  
    |__/|__/_/_//_/\_,_/\____/___/
    
    v1.6.64  |  2026-02-26  |  Roblox UI Library for scripts
    
    To view the source code, see the `src/` folder on the official GitHub repository.
    
    Author: Footagesus (Footages, .ftgs, oftgs)
    Github: https://github.com/Sam123mir/HyperUI
    Discord: https://discord.gg/ftgs-development-hub-1300692552005189632
    License: MIT
]]


local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()local b=(cloneref or clonereference or function(b)return b end)

local d=b(game:GetService"ReplicatedStorage":WaitForChild("GetIcons",99999):InvokeServer())

local function parseIconString(e)
if type(e)=="string"then
local f=e:find":"
if f then
local g=e:sub(1,f-1)
local h=e:sub(f+1)
return g,h
end
end
return nil,e
end

function d.AddIcons(e,f)
if type(e)~="string"or type(f)~="table"then
error"AddIcons: packName must be string, iconsData must be table"
return
end

if not d.Icons[e]then
d.Icons[e]={
Icons={},
Spritesheets={}
}
end

for g,h in pairs(f)do
if type(h)=="number"or(type(h)=="string"and h:match"^rbxassetid://")then
local i=h
if type(h)=="number"then
i="rbxassetid://"..tostring(h)
end

d.Icons[e].Icons[g]={
Image=i,
ImageRectSize=Vector2.new(0,0),
ImageRectPosition=Vector2.new(0,0),
Parts=nil
}
d.Icons[e].Spritesheets[i]=i

elseif type(h)=="table"then
if h.Image and h.ImageRectSize and h.ImageRectPosition then
local i=h.Image
if type(i)=="number"then
i="rbxassetid://"..tostring(i)
end

d.Icons[e].Icons[g]={
Image=i,
ImageRectSize=h.ImageRectSize,
ImageRectPosition=h.ImageRectPosition,
Parts=h.Parts
}

if not d.Icons[e].Spritesheets[i]then
d.Icons[e].Spritesheets[i]=i
end
else
warn("AddIcons: Invalid spritesheet data format for icon '"..g.."'")
end
else
warn("AddIcons: Unsupported data type for icon '"..g.."': "..type(h))
end
end
end

function d.SetIconsType(e)
d.IconsType=e
end

local e
function d.Init(f,g)
d.New=f
d.IconThemeTag=g

e=f
return d
end

function d.Icon(f,g,h)
h=h~=false
local i,j=parseIconString(f)

local l=i or g or d.IconsType
local m=j

local p=d.Icons[l]

if p and p.Icons and p.Icons[m]then
return{
p.Spritesheets[tostring(p.Icons[m].Image)],
p.Icons[m],
}
elseif p and p[m]and string.find(p[m],"rbxassetid://")then
return h and{
p[m],
{ImageRectSize=Vector2.new(0,0),ImageRectPosition=Vector2.new(0,0)}
}or p[m]
end
return nil
end

function d.GetIcon(f,g)
return d.Icon(f,g,false)
end


function d.Icon2(f,g,h)
return d.Icon(f,g,true)
end

function d.Image(f)
local g={
Icon=f.Icon or nil,
Type=f.Type,
Colors=f.Colors or{(d.IconThemeTag or Color3.new(1,1,1)),Color3.new(1,1,1)},
Transparency=f.Transparency or{0,0},
Size=f.Size or UDim2.new(0,24,0,24),

IconFrame=nil,
}

local h={}
local i={}

for j,l in next,g.Colors do
h[j]={
ThemeTag=typeof(l)=="string"and l,
Color=typeof(l)=="Color3"and l,
}
end

for j,l in next,g.Transparency do
i[j]={
ThemeTag=typeof(l)=="string"and l,
Value=typeof(l)=="number"and l,
}
end


local j=d.Icon2(g.Icon,g.Type)
local l=typeof(j)=="string"and string.find(j,'rbxassetid://')

if d.New then
local m=e or d.New



local p=m("ImageLabel",{
Size=g.Size,
BackgroundTransparency=1,
ImageColor3=h[1].Color or nil,
ImageTransparency=i[1].Value or nil,
ThemeTag=h[1].ThemeTag and{
ImageColor3=h[1].ThemeTag,
ImageTransparency=i[1].ThemeTag,
},
Image=l and j or j[1],
ImageRectSize=l and nil or j[2].ImageRectSize,
ImageRectOffset=l and nil or j[2].ImageRectPosition,
})


if not l and j[2].Parts then
for r,u in next,j[2].Parts do
local v=d.Icon(u,g.Type)

m("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ImageColor3=h[1+r].Color or nil,
ImageTransparency=i[1+r].Value or nil,
ThemeTag=h[1+r].ThemeTag and{
ImageColor3=h[1+r].ThemeTag,
ImageTransparency=i[1+r].ThemeTag,
},
Image=v[1],
ImageRectSize=v[2].ImageRectSize,
ImageRectOffset=v[2].ImageRectPosition,
Parent=p,
})
end
end

g.IconFrame=p
else
local m=Instance.new"ImageLabel"
m.Size=g.Size
m.BackgroundTransparency=1
m.ImageColor3=h[1].Color
m.ImageTransparency=i[1].Value or nil
m.Image=l and j or j[1]
m.ImageRectSize=l and nil or j[2].ImageRectSize
m.ImageRectOffset=l and nil or j[2].ImageRectPosition


if not l and j[2].Parts then
for p,r in next,j[2].Parts do
local u=d.Icon(r,g.Type)

local v=Instance.New"ImageLabel"
v.Size=UDim2.new(1,0,1,0)
v.BackgroundTransparency=1
v.ImageColor3=h[1+p].Color
v.ImageTransparency=i[1+p].Value or nil
v.Image=u[1]
v.ImageRectSize=u[2].ImageRectSize
v.ImageRectOffset=u[2].ImageRectPosition
v.Parent=m
end
end

g.IconFrame=m
end


return g
end

return d end function a.b()


return{


Primary="Icon",

White=Color3.new(1,1,1),
Black=Color3.new(0,0,0),

Dialog="Accent",

Background="Accent",
BackgroundTransparency=0,
Hover="Text",

PanelBackground="White",
PanelBackgroundTransparency=.95,

WindowBackground="Background",

WindowShadow="Black",


WindowTopbarTitle="Text",
WindowTopbarAuthor="Text",
WindowTopbarIcon="Icon",
WindowTopbarButtonIcon="Icon",

WindowSearchBarBackground="Background",

TabBackground="Hover",
TabBackgroundHover="Hover",
TabBackgroundHoverTransparency=.97,
TabBackgroundActive="Hover",
TabBackgroundActiveTransparency=0.93,
TabText="Text",
TabTextTransparency=0.3,
TabTextTransparencyActive=0,
TabTitle="Text",
TabIcon="Icon",
TabIconTransparency=0.4,
TabIconTransparencyActive=0.1,
TabBorderTransparency=1,
TabBorderTransparencyActive=0.75,
TabBorder="White",


ElementBackground="Text",
ElementTitle="Text",
ElementDesc="Text",
ElementIcon="Icon",

PopupBackground="Background",
PopupBackgroundTransparency="BackgroundTransparency",
PopupTitle="Text",
PopupContent="Text",
PopupIcon="Icon",

DialogBackground="Background",
DialogBackgroundTransparency="BackgroundTransparency",
DialogTitle="Text",
DialogContent="Text",
DialogIcon="Icon",

Toggle="Button",
ToggleBar="White",

Checkbox="Primary",
CheckboxIcon="White",
CheckboxBorder="White",
CheckboxBorderTransparency=.75,

SliderIcon="Icon",

Slider="Primary",
SliderThumb="White",
SliderIconFrom="SliderIcon",
SliderIconTo="SliderIcon",

Tooltip=Color3.fromHex"4C4C4C",
TooltipText="White",
TooltipSecondary="Primary",
TooltipSecondaryText="White",

SectionExpandIcon="White",
SectionExpandIconTransparency=.4,
SectionBox="White",
SectionBoxTransparency=.95,
SectionBoxBorder="White",
SectionBoxBorderTransparency=.75,
SectionBoxBackground="White",
SectionBoxBackgroundTransparency=.95,

SearchBarBorder="White",
SearchBarBorderTransparency=.75,

Notification="Background",
NotificationTitle="Text",
NotificationTitleTransparency=0,
NotificationContent="Text",
NotificationContentTransparency=.4,
NotificationDuration="White",
NotificationDurationTransparency=.95,
NotificationBorder="White",
NotificationBorderTransparency=.75,

DropdownTabBorder="White",

LabelBackground="White",
LabelBackgroundTransparency=.95,
}end function a.c()


local b=(cloneref or clonereference or function(b)return b end)

local d=b(game:GetService"RunService")
local e=b(game:GetService"UserInputService")
local f=b(game:GetService"TweenService")
local g=b(game:GetService"LocalizationService")
local h=b(game:GetService"HttpService")local i=

d.Heartbeat

local j="https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"

local l
if d:IsStudio()or not writefile then
l=a.load'a'
else
l=loadstring(
game.HttpGetAsync and game:HttpGetAsync(j)
or h:GetAsync(j)
)()
end

l.SetIconsType"lucide"

local m

local p={
ZIndex={
Background=1,
Content=10,
Elements=100,
Topbar=1000,
Dropdown=5000,
Notification=10000,
Tooltip=20000,
Dialog=30000,
},
Font="rbxassetid://12187365364",
Localization=nil,
CanDraggable=true,
Theme=nil,
Themes=nil,
Icons=l,
Signals={},
Objects={},
LocalizationObjects={},
FontObjects={},
Language=string.match(g.SystemLocaleId,"^[a-z]+"),
Request=http_request or(syn and syn.request)or request,
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
},
ScrollingFrame={
ScrollBarImageTransparency=1,
BorderSizePixel=0,
},
VideoFrame={
BorderSizePixel=0,
}
},
Colors={
Red="#e53935",
Orange="#f57c00",
Green="#43a047",
Blue="#039be5",
White="#ffffff",
Grey="#484848",
},
ThemeFallbacks=a.load'b',
Shapes={Square=
"rbxassetid://82909646051652",
["Square-Outline"]="rbxassetid://72946211851948",Squircle=

"rbxassetid://80999662900595",SquircleOutline=
"rbxassetid://117788349049947",
["Squircle-Outline"]="rbxassetid://117817408534198",SquircleOutline2=

"rbxassetid://117817408534198",

["Shadow-sm"]="rbxassetid://84825982946844",

["Squircle-TL-TR"]="rbxassetid://73569156276236",
["Squircle-BL-BR"]="rbxassetid://93853842912264",
["Squircle-TL-TR-Outline"]="rbxassetid://136702870075563",
["Squircle-BL-BR-Outline"]="rbxassetid://75035847706564",

["Glass-0.7"]="rbxassetid://79047752995006",
["Glass-1"]="rbxassetid://97324581055162",
["Glass-1.4"]="rbxassetid://95071123641270",
}
}

function p.Init(r)
m=r
end

function p.AddSignal(r,u)
local v=r:Connect(u)
table.insert(p.Signals,v)
return v
end

function p.DisconnectAll()
for r,u in next,p.Signals do
local v=table.remove(p.Signals,r)
v:Disconnect()
end
end

function p.SafeCallback(r,...)
if not r then
return
end

local u,v=pcall(r,...)
if not u then
if m and m.Window and m.Window.Debug then local
x, z=v:find":%d+: "

warn("[ HyperUI: DEBUG Mode ] "..v)

return m:Notify{
Title="DEBUG Mode: Error",
Content=not z and v or v:sub(z+1),
Duration=8,
}
end
end
end

function p.Gradient(r,u)
if m and m.Gradient then
return m:Gradient(r,u)
end

local v={}
local x={}

for z,A in next,r do
local B=tonumber(z)
if B then
B=math.clamp(B/100,0,1)
table.insert(v,ColorSequenceKeypoint.new(B,A.Color))
table.insert(x,NumberSequenceKeypoint.new(B,A.Transparency or 0))
end
end

table.sort(v,function(z,A)return z.Time<A.Time end)
table.sort(x,function(z,A)return z.Time<A.Time end)

if#v<2 then
error"ColorSequence requires at least 2 keypoints"
end

local z={
Color=ColorSequence.new(v),
Transparency=NumberSequence.new(x),
}

if u then
for A,B in pairs(u)do
z[A]=B
end
end

return z
end

function p.SetTheme(r)
p.Theme=r
p.UpdateTheme(nil,false)
end

function p.AddFontObject(r)
table.insert(p.FontObjects,r)
p.UpdateFont(p.Font)
end

function p.UpdateFont(r)
p.Font=r
for u,v in next,p.FontObjects do
v.FontFace=Font.new(r,v.FontFace.Weight,v.FontFace.Style)
end
end

function p.GetThemeProperty(r,u)
local function getValue(v,x)
local z=x[v]

if z==nil then return nil end

if typeof(z)=="string"and string.sub(z,1,1)=="#"then
return Color3.fromHex(z)
end

if typeof(z)=="Color3"then
return z
end

if typeof(z)=="number"then
return z
end

if typeof(z)=="table"and z.Color and z.Transparency then
return z
end

if typeof(z)=="function"then
return z()
end

return z
end

local v=getValue(r,u)
if v~=nil then
if typeof(v)=="string"and string.sub(v,1,1)~="#"then
local x=p.GetThemeProperty(v,u)
if x~=nil then
return x
end
else
return v
end
end

local x=p.ThemeFallbacks[r]
if x~=nil then
if typeof(x)=="string"and string.sub(x,1,1)~="#"then
return p.GetThemeProperty(x,u)
else
return getValue(r,{[r]=x})
end
end

v=getValue(r,p.Themes.Dark)
if v~=nil then
if typeof(v)=="string"and string.sub(v,1,1)~="#"then
local z=p.GetThemeProperty(v,p.Themes.Dark)
if z~=nil then
return z
end
else
return v
end
end

if x~=nil then
if typeof(x)=="string"and string.sub(x,1,1)~="#"then
return p.GetThemeProperty(x,p.Themes.Dark)
else
return getValue(r,{[r]=x})
end
end

return nil
end

function p.AddThemeObject(r,u)
if p.Objects[r]then
for v,x in pairs(u)do
p.Objects[r].Properties[v]=x
end
else
p.Objects[r]={Object=r,Properties=u}
end

p.UpdateTheme(r,false)
return r
end

function p.AddLangObject(r)
local u=p.LocalizationObjects[r]
if not u then return end

local v=u.Object

p.SetLangForObject(r)

return v
end

function p.UpdateTheme(r,u,v,x,z,A)
local function ApplyTheme(B)
for C,F in pairs(B.Properties or{})do
local G=p.GetThemeProperty(F,p.Theme)
if G~=nil then
if typeof(G)=="Color3"then
local H=B.Object:FindFirstChild"LibraryGradient"
if H then
H:Destroy()
end

if v then
p.Tween(
B.Object,
x or 0.2,
{[C]=G},
z or Enum.EasingStyle.Quint,
A or Enum.EasingDirection.Out
):Play()
elseif u then
p.Tween(B.Object,0.08,{[C]=G}):Play()
else
B.Object[C]=G
end
elseif typeof(G)=="table"and G.Color and G.Transparency then
B.Object[C]=Color3.new(1,1,1)

local H=B.Object:FindFirstChild"LibraryGradient"
if not H then
H=Instance.new"UIGradient"
H.Name="LibraryGradient"
H.Parent=B.Object
end

H.Color=G.Color
H.Transparency=G.Transparency

for J,L in pairs(G)do
if J~="Color"and J~="Transparency"and H[J]~=nil then
H[J]=L
end
end
elseif typeof(G)=="number"then
if v then
p.Tween(
B.Object,
x or 0.2,
{[C]=G},
z or Enum.EasingStyle.Quint,
A or Enum.EasingDirection.Out
):Play()
elseif u then
p.Tween(B.Object,0.08,{[C]=G}):Play()
else
B.Object[C]=G
end
end
else

local H=B.Object:FindFirstChild"LibraryGradient"
if H then
H:Destroy()
end
end
end
end

if r then
local B=p.Objects[r]
if B then
ApplyTheme(B)
end
else
for B,C in pairs(p.Objects)do
ApplyTheme(C)
end
end
end


function p.SetThemeTag(r,u,v,x,z)
p.AddThemeObject(r,u)
p.UpdateTheme(r,false,true,v,x,z)
end

function p.SetLangForObject(r)
if p.Localization and p.Localization.Enabled then
local u=p.LocalizationObjects[r]
if not u then return end

local v=u.Object
local x=u.TranslationId

local z=p.Localization.Translations[p.Language]
if z and z[x]then
v.Text=z[x]
else
local A=p.Localization and p.Localization.Translations and p.Localization.Translations.en or nil
if A and A[x]then
v.Text=A[x]
else
v.Text="["..x.."]"
end
end
end
end

function p.ChangeTranslationKey(r,u,v)
if p.Localization and p.Localization.Enabled then
local x=string.match(v,"^"..p.Localization.Prefix.."(.+)")
if x then
for z,A in ipairs(p.LocalizationObjects)do
if A.Object==u then
A.TranslationId=x
p.SetLangForObject(z)
return
end
end

table.insert(p.LocalizationObjects,{
TranslationId=x,
Object=u
})
p.SetLangForObject(#p.LocalizationObjects)
end
end
end

function p.UpdateLang(r)
if r then
p.Language=r
end

for u=1,#p.LocalizationObjects do
local v=p.LocalizationObjects[u]
if v.Object and v.Object.Parent~=nil then
p.SetLangForObject(u)
else
p.LocalizationObjects[u]=nil
end
end
end

function p.SetLanguage(r)
p.Language=r
p.UpdateLang()
end

function p.Icon(r,u)
return l.Icon2(r,nil,u~=false)
end

function p.AddIcons(r,u)
return l.AddIcons(r,u)
end

function p.New(r,u,v)
local x=Instance.new(r)

for z,A in next,p.DefaultProperties[r]or{}do
x[z]=A
end

for z,A in next,u or{}do
if z~="ThemeTag"then
x[z]=A
end
if p.Localization and p.Localization.Enabled and z=="Text"then
local B=string.match(A,"^"..p.Localization.Prefix.."(.+)")
if B then
local C=#p.LocalizationObjects+1
p.LocalizationObjects[C]={TranslationId=B,Object=x}

p.SetLangForObject(C)
end
end
end

for z,A in next,v or{}do

if typeof(A)=="Instance"and not(A.Parent and A.Parent~=x)then
pcall(function()
A.Parent=x
end)
end
end

if u and u.ThemeTag then
p.AddThemeObject(x,u.ThemeTag)
end
if u and u.FontFace then
p.AddFontObject(x)
end
return x
end

function p.Tween(r,u,v,...)
return f:Create(r,TweenInfo.new(u,...),v)
end

function p.NewRoundFrame(r,u,v,x,z,A)
local function getImageForType(B)
return p.Shapes[B]
end

local function getSliceCenterForType(B)
return not table.find({"Shadow-sm","Glass-0.7","Glass-1","Glass-1.4"},B)and Rect.new(256
,256
,256
,256

)or Rect.new(512,512,512,512)
end

local B=p.New(z and"ImageButton"or"ImageLabel",{
Image=getImageForType(u),
ScaleType="Slice",
SliceCenter=getSliceCenterForType(u),
SliceScale=1,
BackgroundTransparency=1,
ThemeTag=v.ThemeTag and v.ThemeTag
},x)

for C,F in pairs(v or{})do
if C~="ThemeTag"then
B[C]=F
end
end

local function UpdateSliceScale(C)
local F=not table.find({"Shadow-sm","Glass-0.7","Glass-1","Glass-1.4"},u)and(C/(256))or(C/512)
B.SliceScale=math.max(F,0.0001)
end

local C={}

function C.SetRadius(F,G)
UpdateSliceScale(G)
end

function C.SetType(F,G)
u=G
B.Image=getImageForType(G)
B.SliceCenter=getSliceCenterForType(G)
UpdateSliceScale(r)
end

function C.UpdateShape(F,G,H)
if H then
u=H
B.Image=getImageForType(H)
B.SliceCenter=getSliceCenterForType(H)
end
if G then
r=G
end
UpdateSliceScale(r)
end

function C.GetRadius(F)
return r
end

function C.GetType(F)
return u
end

UpdateSliceScale(r)

return B,A and C or nil
end

local r=p.New local u=
p.Tween

function p.SetDraggable(v)
p.CanDraggable=v
end



function p.Drag(v,x,z)
local A
local B,C,F
local G={
CanDraggable=true
}

if not x or typeof(x)~="table"then
x={v}
end

local function update(H)
if not B or not G.CanDraggable then return end

local J=H.Position-C
p.Tween(v,0.02,{Position=UDim2.new(
F.X.Scale,F.X.Offset+J.X,
F.Y.Scale,F.Y.Offset+J.Y
)}):Play()
end

for H,J in pairs(x)do
J.InputBegan:Connect(function(L)
if(L.UserInputType==Enum.UserInputType.MouseButton1 or L.UserInputType==Enum.UserInputType.Touch)and G.CanDraggable then
if A==nil then
A=J
B=true
C=L.Position
F=v.Position

if z and typeof(z)=="function"then
z(true,A)
end

L.Changed:Connect(function()
if L.UserInputState==Enum.UserInputState.End then
B=false
A=nil

if z and typeof(z)=="function"then
z(false,nil)
end
end
end)
end
end
end)

J.InputChanged:Connect(function(L)
if B and A==J then
if L.UserInputType==Enum.UserInputType.MouseMovement or L.UserInputType==Enum.UserInputType.Touch then
update(L)
end
end
end)
end

e.InputChanged:Connect(function(H)
if B and A~=nil then
if H.UserInputType==Enum.UserInputType.MouseMovement or H.UserInputType==Enum.UserInputType.Touch then
update(H)
end
end
end)

function G.Set(H,J)
G.CanDraggable=J
end

return G
end


l.Init(r,"Icon")


function p.SanitizeFilename(v)
local x=v:match"([^/]+)$"or v

x=x:gsub("%.[^%.]+$","")

x=x:gsub("[^%w%-_]","_")

if#x>50 then
x=x:sub(1,50)
end

return x
end

function p.Image(v,x,z,A,B,C,F,G)
A=A or"Temp"
x=p.SanitizeFilename(x)

local H=r("Frame",{
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
},{
r("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScaleType="Crop",
ThemeTag=(p.Icon(v)or F)and{
ImageColor3=C and(G or"Icon")or nil
}or nil,
},{
r("UICorner",{
CornerRadius=UDim.new(0,z)
})
})
})
if p.Icon(v)then
H.ImageLabel:Destroy()

local J=l.Image{
Icon=v,
Size=UDim2.new(1,0,1,0),
Colors={
(C and(G or"Icon")or false),
"Button"
}
}.IconFrame
J.Parent=H
elseif string.find(v,"http")then
local J="HyperUI/"..A.."/assets/."..B.."-"..x..".png"
task.spawn(function()
local L=true
if isfile and isfile(J)then
L=false
end

if L then
local M,N=pcall(function()
return p.Request and p.Request{
Url=v,
Method="GET",
}
end)

if M and N and N.Body and N.Body~=""then
if not d:IsStudio()and writefile then
pcall(writefile,J,N.Body)
end
else
warn("[ HyperUI.Creator ] Failed to download asset: "..tostring(v))
return
end
end

if H and H:FindFirstChild"ImageLabel"then
local M,N=pcall(function()
return getcustomasset(J)
end)
if M then
H.ImageLabel.Image=N
else
warn(string.format("[ HyperUI.Creator ] Failed to load custom asset '%s': %s",J,tostring(N)))
end
end
end)
elseif v==""then
H.Visible=false
else
H.ImageLabel.Image=v
end

return H
end



function p.Color3ToHSB(v)
local x,z,A=v.R,v.G,v.B
local B=math.max(x,z,A)
local C=math.min(x,z,A)
local F=B-C

local G=0
if F~=0 then
if B==x then
G=(z-A)/F%6
elseif B==z then
G=(A-x)/F+2
else
G=(x-z)/F+4
end
G=G*60
else
G=0
end

local H=(B==0)and 0 or(F/B)
local J=B

return{
h=math.floor(G+0.5),
s=H,
b=J
}
end

function p.GetPerceivedBrightness(v)
local x=v.R
local z=v.G
local A=v.B
return 0.299*x+0.587*z+0.114*A
end

function p.GetTextColorForHSB(v,x)
local z=p.Color3ToHSB(v)local
A, B, C=z.h, z.s, z.b
if p.GetPerceivedBrightness(v)>(x or 0.5)then
return Color3.fromHSV(A/360,0,0.05)
else
return Color3.fromHSV(A/360,0,0.98)
end
end

function p.GetAverageColor(v)
local x,z,A=0,0,0
local B=v.Color.Keypoints
for C,F in ipairs(B)do

x=x+F.Value.R
z=z+F.Value.G
A=A+F.Value.B
end
local C=#B
return Color3.new(x/C,z/C,A/C)
end

function p.GenerateUniqueID(v)
return h:GenerateGUID(false)
end

return p end function a.d()

local b={}







function b.New(d,e,f)
local g={
Enabled=e.Enabled or false,
Translations=e.Translations or{},
Prefix=e.Prefix or"loc:",
DefaultLanguage=e.DefaultLanguage or"en"
}

f.Localization=g

return g
end



return b end function a.e()

local b=a.load'c'
local d=b.New
local e=b.Tween

local f={
Size=UDim2.new(0,300,1,-156),
SizeLower=UDim2.new(0,300,1,-56),
UICorner=18,
UIPadding=14,

Holder=nil,
NotificationIndex=0,
Notifications={}
}

function f.Init(g)
local h={
Lower=false
}

function h.SetLower(j)
h.Lower=j
h.Frame.Size=j and f.SizeLower or f.Size
end

h.Frame=d("Frame",{
Position=UDim2.new(1,-60,0,70),
AnchorPoint=Vector2.new(1,0),
Size=f.Size,
Parent=g,
BackgroundTransparency=1,




},{
d("UIListLayout",{
HorizontalAlignment="Center",
SortOrder="LayoutOrder",
VerticalAlignment="Bottom",
Padding=UDim.new(0,8),
}),
d("UIPadding",{
PaddingBottom=UDim.new(0,29)
})
})
return h
end

function f.New(g)
local h={
Title=g.Title or"Notification",
Content=g.Content or nil,
Icon=g.Icon or nil,
IconThemed=g.IconThemed,
Background=g.Background,
BackgroundImageTransparency=g.BackgroundImageTransparency,
Duration=g.Duration or 5,
Buttons=g.Buttons or{},
CanClose=g.CanClose~=false,
UIElements={},
Closed=false,
}



f.NotificationIndex=f.NotificationIndex+1
f.Notifications[f.NotificationIndex]=h









local j

if h.Icon then





















j=b.Image(
h.Icon,
h.Title..":"..h.Icon,
0,
g.Window,
"Notification",
h.IconThemed
)
j.Size=UDim2.new(0,26,0,26)
j.Position=UDim2.new(0,f.UIPadding,0,f.UIPadding)

end

local l
if h.CanClose then
l=d("ImageButton",{
Image=b.Icon"x"[1],
ImageRectSize=b.Icon"x"[2].ImageRectSize,
ImageRectOffset=b.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
Position=UDim2.new(1,-f.UIPadding,0,f.UIPadding),
AnchorPoint=Vector2.new(1,0),
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=.4,
},{
d("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})
end

local m=b.NewRoundFrame(f.UICorner,"Squircle",{
Size=UDim2.new(0,0,1,0),
ThemeTag={
ImageTransparency="NotificationDurationTransparency",
ImageColor3="NotificationDuration",
},

})

local p=d("Frame",{
Size=UDim2.new(1,
h.Icon and-28-f.UIPadding or 0,
1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
d("UIPadding",{
PaddingTop=UDim.new(0,f.UIPadding),
PaddingLeft=UDim.new(0,f.UIPadding),
PaddingRight=UDim.new(0,f.UIPadding),
PaddingBottom=UDim.new(0,f.UIPadding),
}),
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,-30-f.UIPadding,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=18,
ThemeTag={
TextColor3="NotificationTitle",
TextTransparency="NotificationTitleTransparency",
},
Text=h.Title,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold)
}),
d("UIListLayout",{
Padding=UDim.new(0,f.UIPadding/3)
})
})

if h.Content then
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,

TextSize=15,
ThemeTag={
TextColor3="NotificationContent",
TextTransparency="NotificationContentTransparency",
},
Text=h.Content,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
Parent=p
})
end


local r=b.NewRoundFrame(f.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(2,0,1,0),
AnchorPoint=Vector2.new(0,1),
AutomaticSize="Y",
ImageTransparency=.05,
ThemeTag={
ImageColor3="Notification"
},

},{
b.NewRoundFrame(f.UICorner,"Glass-1",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="NotificationBorder",
ImageTransparency="NotificationBorderTransparency",
},
}),
d("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="DurationFrame",
},{
d("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ClipsDescendants=true,
},{
m,
}),





}),
d("ImageLabel",{
Name="Background",
Image=h.Background,
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScaleType="Crop",
ImageTransparency=h.BackgroundImageTransparency

},{
d("UICorner",{
CornerRadius=UDim.new(0,f.UICorner),
})
}),

p,
j,l,
})

local u=d("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
Parent=g.Holder
},{
r
})

function h.Close(v)
if not h.Closed then
h.Closed=true
e(u,0.45,{Size=UDim2.new(1,0,0,-8)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(r,0.55,{Position=UDim2.new(2,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(.45)
u:Destroy()
end
end

task.spawn(function()
task.wait()
e(u,0.45,{Size=UDim2.new(
1,
0,
0,
r.AbsoluteSize.Y
)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(r,0.45,{Position=UDim2.new(0,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if h.Duration then
m.Size=UDim2.new(0,r.DurationFrame.AbsoluteSize.X,1,0)
e(r.DurationFrame.Frame,h.Duration,{Size=UDim2.new(0,0,1,0)},Enum.EasingStyle.Linear,Enum.EasingDirection.InOut):Play()
task.wait(h.Duration)
h:Close()
end
end)

if l then
b.AddSignal(l.TextButton.MouseButton1Click,function()
h:Close()
end)
end


return h
end

return f end function a.f()












local b=4294967296;local d=b-1;local function c(e,f)local g,h=0,1;while e~=0 or f~=0 do local j,l=e%2,f%2;local m=(j+l)%2;g=g+m*h;e=math.floor(e/2)f=math.floor(f/2)h=h*2 end;return g%b end;local function k(e,f,g,...)local h;if f then e=e%b;f=f%b;h=c(e,f)if g then h=k(h,g,...)end;return h elseif e then return e%b else return 0 end end;local function n(e,f,g,...)local h;if f then e=e%b;f=f%b;h=(e+f-c(e,f))/2;if g then h=n(h,g,...)end;return h elseif e then return e%b else return d end end;local function o(e)return d-e end;local function q(e,f)if f<0 then return lshift(e,-f)end;return math.floor(e%4294967296/2^f)end;local function s(e,f)if f>31 or f<-31 then return 0 end;return q(e%b,f)end;local function lshift(e,f)if f<0 then return s(e,-f)end;return e*2^f%4294967296 end;local function t(e,f)e=e%b;f=f%32;local g=n(e,2^f-1)return s(e,f)+lshift(g,32-f)end;local e={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(f)return string.gsub(f,".",function(g)return string.format("%02x",string.byte(g))end)end;local function y(f,g)local h=""for j=1,g do local l=f%256;h=string.char(l)..h;f=(f-l)/256 end;return h end;local function D(f,g)local h=0;for j=g,g+3 do h=h*256+string.byte(f,j)end;return h end;local function E(f,g)local h=64-(g+9)%64;g=y(8*g,8)f=f.."\128"..string.rep("\0",h)..g;assert(#f%64==0)return f end;local function I(f)f[1]=0x6a09e667;f[2]=0xbb67ae85;f[3]=0x3c6ef372;f[4]=0xa54ff53a;f[5]=0x510e527f;f[6]=0x9b05688c;f[7]=0x1f83d9ab;f[8]=0x5be0cd19;return f end;local function K(f,g,h)local j={}for l=1,16 do j[l]=D(f,g+(l-1)*4)end;for l=17,64 do local m=j[l-15]local p=k(t(m,7),t(m,18),s(m,3))m=j[l-2]j[l]=(j[l-16]+p+j[l-7]+k(t(m,17),t(m,19),s(m,10)))%b end;local l,m,p,r,u,v,x,z=h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8]for A=1,64 do local B=k(t(l,2),t(l,13),t(l,22))local C=k(n(l,m),n(l,p),n(m,p))local F=(B+C)%b;local G=k(t(u,6),t(u,11),t(u,25))local H=k(n(u,v),n(o(u),x))local J=(z+G+H+e[A]+j[A])%b;z=x;x=v;v=u;u=(r+J)%b;r=p;p=m;m=l;l=(J+F)%b end;h[1]=(h[1]+l)%b;h[2]=(h[2]+m)%b;h[3]=(h[3]+p)%b;h[4]=(h[4]+r)%b;h[5]=(h[5]+u)%b;h[6]=(h[6]+v)%b;h[7]=(h[7]+x)%b;h[8]=(h[8]+z)%b end;local function Z(f)f=E(f,#f)local g=I{}for h=1,#f,64 do K(f,h,g)end;return w(y(g[1],4)..y(g[2],4)..y(g[3],4)..y(g[4],4)..y(g[5],4)..y(g[6],4)..y(g[7],4)..y(g[8],4))end;local f;local g={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local h={["/"]="/"}for j,l in pairs(g)do h[l]=j end;local j=function(j)return"\\"..(g[j]or string.format("u%04x",j:byte()))end;local l=function(l)return"null"end;local m=function(m,p)local r={}p=p or{}if p[m]then error"circular reference"end;p[m]=true;if rawget(m,1)~=nil or next(m)==nil then local u=0;for v in pairs(m)do if type(v)~="number"then error"invalid table: mixed or invalid key types"end;u=u+1 end;if u~=#m then error"invalid table: sparse array"end;for v,x in ipairs(m)do table.insert(r,f(x,p))end;p[m]=nil;return"["..table.concat(r,",").."]"else for u,v in pairs(m)do if type(u)~="string"then error"invalid table: mixed or invalid key types"end;table.insert(r,f(u,p)..":"..f(v,p))end;p[m]=nil;return"{"..table.concat(r,",").."}"end end;local p=function(p)return'"'..p:gsub('[%z\1-\31\\"]',j)..'"'end;local r=function(r)if r~=r or r<=-math.huge or r>=math.huge then error("unexpected number value '"..tostring(r).."'")end;return string.format("%.14g",r)end;local u={["nil"]=l,table=m,string=p,number=r,boolean=tostring}f=function(v,x)local z=type(v)local A=u[z]if A then return A(v,x)end;error("unexpected type '"..z.."'")end;local v=function(v)return f(v)end;local x;local z=function(...)local z={}for A=1,select("#",...)do z[select(A,...)]=true end;return z end;local A=z(" ","\t","\r","\n")local B=z(" ","\t","\r","\n","]","}",",")local C=z("\\","/",'"',"b","f","n","r","t","u")local F=z("true","false","null")local G={["true"]=true,["false"]=false,null=nil}local H=function(H,J,L,M)for N=J,#H do if L[H:sub(N,N)]~=M then return N end end;return#H+1 end;local J=function(J,L,M)local N=1;local O=1;for P=1,L-1 do O=O+1;if J:sub(P,P)=="\n"then N=N+1;O=1 end end;error(string.format("%s at line %d col %d",M,N,O))end;local L=function(L)local M=math.floor;if L<=0x7f then return string.char(L)elseif L<=0x7ff then return string.char(M(L/64)+192,L%64+128)elseif L<=0xffff then return string.char(M(L/4096)+224,M(L%4096/64)+128,L%64+128)elseif L<=0x10ffff then return string.char(M(L/262144)+240,M(L%262144/4096)+128,M(L%4096/64)+128,L%64+128)end;error(string.format("invalid unicode codepoint '%x'",L))end;local M=function(M)local N=tonumber(M:sub(1,4),16)local O=tonumber(M:sub(7,10),16)if O then return L((N-0xd800)*0x400+O-0xdc00+0x10000)else return L(N)end end;local N=function(N,O)local P=""local Q=O+1;local R=Q;while Q<=#N do local S=N:byte(Q)if S<32 then J(N,Q,"control character in string")elseif S==92 then P=P..N:sub(R,Q-1)Q=Q+1;local T=N:sub(Q,Q)if T=="u"then local U=N:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",Q+1)or N:match("^%x%x%x%x",Q+1)or J(N,Q-1,"invalid unicode escape in string")P=P..M(U)Q=Q+#U else if not C[T]then J(N,Q-1,"invalid escape char '"..T.."' in string")end;P=P..h[T]end;R=Q+1 elseif S==34 then P=P..N:sub(R,Q-1)return P,Q+1 end;Q=Q+1 end;J(N,O,"expected closing quote for string")end;local O=function(O,P)local Q=H(O,P,B)local R=O:sub(P,Q-1)local S=tonumber(R)if not S then J(O,P,"invalid number '"..R.."'")end;return S,Q end;local P=function(P,Q)local R=H(P,Q,B)local S=P:sub(Q,R-1)if not F[S]then J(P,Q,"invalid literal '"..S.."'")end;return G[S],R end;local Q=function(Q,R)local S={}local T=1;R=R+1;while 1 do local U;R=H(Q,R,A,true)if Q:sub(R,R)=="]"then R=R+1;break end;U,R=x(Q,R)S[T]=U;T=T+1;R=H(Q,R,A,true)local V=Q:sub(R,R)R=R+1;if V=="]"then break end;if V~=","then J(Q,R,"expected ']' or ','")end end;return S,R end;local R=function(R,S)local T={}S=S+1;while 1 do local U,V;S=H(R,S,A,true)if R:sub(S,S)=="}"then S=S+1;break end;if R:sub(S,S)~='"'then J(R,S,"expected string for key")end;U,S=x(R,S)S=H(R,S,A,true)if R:sub(S,S)~=":"then J(R,S,"expected ':' after key")end;S=H(R,S+1,A,true)V,S=x(R,S)T[U]=V;S=H(R,S,A,true)local W=R:sub(S,S)S=S+1;if W=="}"then break end;if W~=","then J(R,S,"expected '}' or ','")end end;return T,S end;local S={['"']=N,["0"]=O,["1"]=O,["2"]=O,["3"]=O,["4"]=O,["5"]=O,["6"]=O,["7"]=O,["8"]=O,["9"]=O,["-"]=O,t=P,f=P,n=P,["["]=Q,["{"]=R}x=function(T,U)local V=T:sub(U,U)local W=S[V]if W then return W(T,U)end;J(T,U,"unexpected character '"..V.."'")end;local T=function(T)if type(T)~="string"then error("expected argument of type string, got "..type(T))end;local U,V=x(T,H(T,1,A,true))V=H(T,V,A,true)if V<=#T then J(T,V,"trailing garbage")end;return U end;
local U,V,W=v,T,Z;





local X={}

local Y=(cloneref or clonereference or function(Y)return Y end)


function X.New(_,aa)

local ab=_;
local ac=aa;
local ad=true;


local ae=function(ae)end;


repeat task.wait(1)until game:IsLoaded();


local af=false;
local ag,ah,ai,aj,ak,al,am,an,ao=setclipboard or toclipboard,request or http_request or syn_request,string.char,tostring,string.sub,os.time,math.random,math.floor,gethwid or function()return Y(game:GetService"Players").LocalPlayer.UserId end
local ap,aq="",0;


local ar="https://api.platoboost.app";
local as=ah{
Url=ar.."/public/connectivity",
Method="GET"
};
if as.StatusCode~=200 and as.StatusCode~=429 then
ar="https://api.platoboost.net";
end


function cacheLink()
if aq+(600)<al()then
local at=ah{
Url=ar.."/public/start",
Method="POST",
Body=U{
service=ab,
identifier=W(ao())
},
Headers={
["Content-Type"]="application/json",
["User-Agent"]="Roblox/Exploit"
}
};

if at.StatusCode==200 then
local au=V(at.Body);

if au.success==true then
ap=au.data.url;
aq=al();
return true,ap
else
ae(au.message);
return false,au.message
end
elseif at.StatusCode==429 then
local au="you are being rate limited, please wait 20 seconds and try again.";
ae(au);
return false,au
end

local au="Failed to cache link.";
ae(au);
return false,au
else
return true,ap
end
end

cacheLink();


local at=function()
local at=""
for au=1,16 do
at=at..ai(an(am()*(26))+97)
end
return at
end


for au=1,5 do
local av=at();
task.wait(0.2)
if at()==av then
local aw="platoboost nonce error.";
ae(aw);
error(aw);
end
end


local au=function()
local au,av=cacheLink();

if au then
ag(av);
end
end


local av=function(av)
local aw=at();
local ax=ar.."/public/redeem/"..aj(ab);

local ay={
identifier=W(ao()),
key=av
}

if ad then
ay.nonce=aw;
end

local az=ah{
Url=ax,
Method="POST",
Body=U(ay),
Headers={
["Content-Type"]="application/json"
}
};

if az.StatusCode==200 then
local aA=V(az.Body);

if aA.success==true then
if aA.data.valid==true then
if ad then
if aA.data.hash==W("true".."-"..aw.."-"..ac)then
return true
else
ae"failed to verify integrity.";
return false
end
else
return true
end
else
ae"key is invalid.";
return false
end
else
if ak(aA.message,1,27)=="unique constraint violation"then
ae"you already have an active key, please wait for it to expire before redeeming it.";
return false
else
ae(aA.message);
return false
end
end
elseif az.StatusCode==429 then
ae"you are being rate limited, please wait 20 seconds and try again.";
return false
else
ae"server returned an invalid status code, please try again later.";
return false
end
end


local aw=function(aw)
if af==true then
return false,("A request is already being sent, please slow down.")
else
af=true;
end

local ax=at();
local ay=ar.."/public/whitelist/"..aj(ab).."?identifier="..W(ao()).."&key="..aw;

if ad then
ay=ay.."&nonce="..ax;
end

local az=ah{
Url=ay,
Method="GET",
};

af=false;

if az.StatusCode==200 then
local aA=V(az.Body);

if aA.success==true then
if aA.data.valid==true then
if ad then
if aA.data.hash==W("true".."-"..ax.."-"..ac)then
return true,""
else
return false,("failed to verify integrity.")
end
else
return true
end
else
if ak(aw,1,4)=="KEY_"then
return true,av(aw)
else
return false,("Key is invalid.")
end
end
else
return false,(aA.message)
end
elseif az.StatusCode==429 then
return false,("You are being rate limited, please wait 20 seconds and try again.")
else
return false,("Server returned an invalid status code, please try again later.")
end
end


local ax=function(ax)
local ay=at();
local az=ar.."/public/flag/"..aj(ab).."?name="..ax;

if ad then
az=az.."&nonce="..ay;
end

local aA=ah{
Url=az,
Method="GET",
};

if aA.StatusCode==200 then
local aB=V(aA.Body);

if aB.success==true then
if ad then
if aB.data.hash==W(aj(aB.data.value).."-"..ay.."-"..ac)then
return aB.data.value
else
ae"failed to verify integrity.";
return nil
end
else
return aB.data.value
end
else
ae(aB.message);
return nil
end
else
return nil
end
end


return{
Verify=aw,
GetFlag=ax,
Copy=au,
}
end


return X end function a.g()










local aa=(cloneref or clonereference or function(aa)return aa end)

local ab=aa(game:GetService"HttpService")
local ac={}



function ac.New(ad)
local ae=gethwid or function()return aa(game:GetService"Players").LocalPlayer.UserId end
local af,ag=request or http_request or syn_request,setclipboard or toclipboard

function ValidateKey(ah)
local ai="https://pandadevelopment.net/v2_validation?key="..tostring(ah).."&service="..tostring(ad).."&hwid="..tostring(ae())


local aj,ak=pcall(function()
return af{
Url=ai,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"}
}
end)

if aj and ak then
if ak.Success then
local al,am=pcall(function()
return ab:JSONDecode(ak.Body)
end)

if al and am then
if am.V2_Authentication and am.V2_Authentication=="success"then

return true,"Authenticated"
else
local an=am.Key_Information.Notes or"Unknown reason"

return false,"Authentication failed: "..an
end
else

return false,"JSON decode error"
end
else
warn("[Pelinda Ov2.5] HTTP request was not successful. Code: "..tostring(ak.StatusCode).." Message: "..ak.StatusMessage)
return false,"HTTP request failed: "..ak.StatusMessage
end
else

return false,"Request pcall error"
end
end

function GetKeyLink()
return"https://pandadevelopment.net/getkey?service="..tostring(ad).."&hwid="..tostring(ae())
end

function CopyLink()
return ag(GetKeyLink())
end

return{
Verify=ValidateKey,
Copy=CopyLink
}
end

return ac end function a.h()









local aa={}


function aa.New(ab,ac)
local ad="https://sdkapi-public.luarmor.net/library.lua"

local ae=loadstring(
game.HttpGetAsync and game:HttpGetAsync(ad)
or HttpService:GetAsync(ad)
)()
local af=setclipboard or toclipboard

ae.script_id=ab

function ValidateKey(ag)
local ah=ae.check_key(ag);


if(ah.code=="KEY_VALID")then
return true,"Whitelisted!"

elseif(ah.code=="KEY_HWID_LOCKED")then
return false,"Key linked to a different HWID. Please reset it using our bot"

elseif(ah.code=="KEY_INCORRECT")then
return false,"Key is wrong or deleted!"
else
return false,"Key check failed:"..ah.message.." Code: "..ah.code
end
end

function CopyLink()
af(tostring(ac))
end

return{
Verify=ValidateKey,
Copy=CopyLink
}
end


return aa end function a.i()









local aa={}

function aa.New(ab,ac,ad)
JunkieProtected.API_KEY=ac
JunkieProtected.PROVIDER=ad
JunkieProtected.SERVICE_ID=ab

local function ValidateKey(ae)
if not ae or ae==""then
print"No key provided!"

return false,"No key provided. Please get a key."
end

local af=JunkieProtected.IsKeylessMode()
if af and af.keyless_mode then
print"Keyless mode enabled. Starting script..."
return true,"Keyless mode enabled. Starting script..."
end

local ag=JunkieProtected.ValidateKey{Key=ae}
if ag=="valid"then
print"Key is valid! Starting script..."
load()
if _G.JD_IsPremium then
print"Premium user detected!"
else
print"Standard user"
end

return true,"Key is valid!"
else
local ah=JunkieProtected.GetKeyLink()
print"Invalid key!"

return false,"Invalid key. Get one from:"..ah
end
end

local function copyLink()
local ae=JunkieProtected.GetKeyLink()

if setclipboard then
setclipboard(ae)
end
end
return{
Verify=ValidateKey,
Copy=copyLink
}
end

return aa end function a.j()



return{
platoboost={
Name="Platoboost",
Icon="rbxassetid://75920162824531",
Args={"ServiceId","Secret"},

New=a.load'f'.New
},
pandadevelopment={
Name="Panda Development",
Icon="panda",
Args={"ServiceId"},

New=a.load'g'.New
},
luarmor={
Name="Luarmor",
Icon="rbxassetid://130918283130165",
Args={"ScriptId","Discord"},

New=a.load'h'.New
},
junkiedevelopment={
Name="Junkie Development",
Icon="rbxassetid://106310347705078",
Args={"ServiceId","ApiKey","Provider"},

New=a.load'i'.New
},


}end function a.k()



return[[
{
    "name": "hyperui",
    "version": "1.6.64",
    "main": "./dist/main.lua",
    "repository": "https://github.com/Sam123mir/HyperUI",
    "discord": "https://discord.gg/ftgs-development-hub-1300692552005189632",
    "author": "Sam123mir",
    "description": "Roblox UI Library for scripts",
    "license": "MIT",
    "scripts": {
        "dev": "bash build/build.sh dev $INPUT_FILE",
        "build": "bash build/build.sh build $INPUT_FILE",
        "live": "python -m http.server 8642",
        "watch": "chokidar . -i 'node_modules' -i 'dist' -i 'build' -c 'npm run dev --'",
        "live-build": "concurrently \"npm run live\" \"npm run watch --\"",
        "example-live-build": "INPUT_FILE=main_example.lua npm run live-build",
        "updater": "python updater/main.py"
    },
    "keywords": [
        "ui-library",
        "ui-design",
        "script",
        "script-hub",
        "exploiting"
    ],
    "devDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}
]]end function a.l()local aa={}local ab=a.load'c'local ac=ab.New local ad=ab.Tween function aa.New(ae,af,ag,ah,ai,aj,ak,al)ah=ah or"Primary"local am=al or(not ak and 10 or 99)local an if af and af~=""then an=ac("ImageLabel",{Image=ab.Icon(af)[1],ImageRectSize=ab.Icon(af)[2].ImageRectSize,ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,Size=UDim2.new(0,21,0,21),BackgroundTransparency=1,ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,ImageTransparency=ah=="White"and.4 or 0,ThemeTag={ImageColor3=ah~="White"and"Icon"or nil,}})end local ao=ac("TextButton",{Size=UDim2.new(0,0,1,0),AutomaticSize="X",Parent=ai,BackgroundTransparency=1
},{
ab.NewRoundFrame(am,"Squircle",{
ThemeTag={
ImageColor3=ah~="White"and"Button"or nil,
},
ImageColor3=ah=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=ah=="Primary"and 0 or ah=="White"and 0 or 1
}),

ab.NewRoundFrame(am,"Squircle",{



ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=ah=="Secondary"and 0.95 or 1
}),

ab.NewRoundFrame(am,"Shadow-sm",{



ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,3,1,3),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Shadow",

ImageTransparency=1,
Visible=not ak
}),

ab.NewRoundFrame(am,not ak and"Glass-1"or"Glass-0.7",{
ThemeTag={
ImageColor3="White",
},
Size=UDim2.new(1,0,1,0),

ImageTransparency=0.6,
Name="Outline",
},{













}),

ab.NewRoundFrame(am,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3=ah~="White"and"Text"or nil
},
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=1
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
an,
ac("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ae or"Button",
ThemeTag={
TextColor3=(ah~="Primary"and ah~="White")and"Text",
},
TextColor3=ah=="Primary"and Color3.new(1,1,1)or ah=="White"and Color3.new(0,0,0)or nil,
AutomaticSize="XY",
TextSize=18,
})
})
})

ab.AddSignal(ao.MouseEnter,function()
ad(ao.Frame,.047,{ImageTransparency=.95}):Play()
end)
ab.AddSignal(ao.MouseLeave,function()
ad(ao.Frame,.047,{ImageTransparency=1}):Play()
end)
ab.AddSignal(ao.MouseButton1Up,function()
if aj then
aj:Close()()
end
if ag then
ab.SafeCallback(ag)
end
end)

return ao
end


return aa end function a.m()

local aa={}

local ab=a.load'c'
local ac=ab.New local ad=
ab.Tween


function aa.New(ae,af,ag,ah,ai,aj,ak,al)
ah=ah or"Input"
local am=ak or 10
local an
if af and af~=""then
an=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local ao=ah~="Input"

local ap=ac("TextBox",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,an and-29 or 0,1,0),
PlaceholderText=ae,
ClearTextOnFocus=al or false,
ClipsDescendants=true,
TextWrapped=ao,
MultiLine=ao,
TextXAlignment="Left",
TextYAlignment=ah=="Input"and"Center"or"Top",

ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
})

local aq=ac("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(am,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.97,
}),
ab.NewRoundFrame(am,"Glass-1",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.75,
},{













}),
ab.NewRoundFrame(am,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,ah=="Input"and 0 or 12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,ah=="Input"and 0 or 12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment=ah=="Input"and"Center"or"Top",
HorizontalAlignment="Left",
}),
an,
ap,
})
})
})










if aj then
ab.AddSignal(ap:GetPropertyChangedSignal"Text",function()
if ai then
ab.SafeCallback(ai,ap.Text)
end
end)
else
ab.AddSignal(ap.FocusLost,function()
if ai then
ab.SafeCallback(ai,ap.Text)
end
end)
end

return aq
end


return aa end function a.n()

local aa=a.load'c'
local ab=aa.New
local ac=aa.Tween

return{
Init=function(ad,ae)
local af={}
af.Parent=ae
local ag=ad

function af.Create(ah,ai)
local aj={
UICorner=28,
UIPadding=12,
UIElements={}
}

if ah then aj.UIPadding=0 end
if ah then aj.UICorner=26 end

ai=ai or"Dialog"

if not ah then
aj.UIElements.FullScreen=ab("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#000000",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=af.Parent or(ag and ag.UIElements and ag.UIElements.Main and ag.UIElements.Main.Main)
},{
ab("UICorner",{
CornerRadius=UDim.new(0,ag.UICorner)
})
})
end

aj.UIElements.Main=ab("Frame",{
Size=UDim2.new(0,280,0,0),
ThemeTag={
BackgroundColor3=ai.."Background",
},
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,aj.UIPadding),
PaddingLeft=UDim.new(0,aj.UIPadding),
PaddingRight=UDim.new(0,aj.UIPadding),
PaddingBottom=UDim.new(0,aj.UIPadding),
})
})

aj.UIElements.MainContainer=aa.NewRoundFrame(aj.UICorner,"Squircle",{
Visible=false,

ImageTransparency=ah and 0.15 or 0,
Parent=ah and af.Parent or aj.UIElements.FullScreen,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3=ai.."Background",
ImageTransparency=ai.."BackgroundTransparency",
},
ZIndex=9999,
},{





aj.UIElements.Main,



















})

function aj.Open(ak)
if not ah then
aj.UIElements.FullScreen.Visible=true
aj.UIElements.FullScreen.Active=true
end

task.spawn(function()
aj.UIElements.MainContainer.Visible=true

if not ah then
ac(aj.UIElements.FullScreen,0.1,{BackgroundTransparency=.3}):Play()
end
ac(aj.UIElements.MainContainer,0.1,{ImageTransparency=0}):Play()


task.spawn(function()
task.wait(0.05)
aj.UIElements.Main.Visible=true
end)
end)
end
function aj.Close(ak)
if not ah then
ac(aj.UIElements.FullScreen,0.1,{BackgroundTransparency=1}):Play()
aj.UIElements.FullScreen.Active=false
task.spawn(function()
task.wait(.1)
aj.UIElements.FullScreen.Visible=false
end)
end
aj.UIElements.Main.Visible=false

ac(aj.UIElements.MainContainer,0.1,{ImageTransparency=1}):Play()



task.spawn(function()
task.wait(.1)
if not ah then
aj.UIElements.FullScreen:Destroy()
else
aj.UIElements.MainContainer:Destroy()
end
end)

return function()end
end


return aj
end

return af
end
}end function a.o()

local aa={}


local ab=a.load'c'
local ac=ab.New
local ad=ab.Tween

local ae=a.load'l'.New
local af=a.load'm'.New

function aa.new(ag,ah,ai,aj)
local ak=a.load'n'
local al=ak.Init({UIElements={Main=ag.HyperUI.ScreenGui}},ag.HyperUI.ScreenGui)
local am=al.Create(true)

local an={}

local ao

local ap=(ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Width)or 200

local aq=540
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
aq=540+(ap/2)
end

am.UIElements.Main.AutomaticSize="Y"
am.UIElements.Main.Size=UDim2.new(0,aq,0,0)

local ar

if ag.Icon then

ar=ab.Image(
ag.Icon,
ag.Title..":"..ag.Icon,
0,
"Temp",
"KeySystem",
ag.IconThemed
)
ar.Size=UDim2.new(0,24,0,24)
ar.LayoutOrder=-1
end

local as=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=ag.KeySystem.Title or ag.Title,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20
})



local at=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
ar,as
})

local au=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{
at
})

local av=af("Enter Key","key",nil,"Input",function(av)
ao=av
end)

local aw
if ag.KeySystem.Note and ag.KeySystem.Note~=""then
aw=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ag.KeySystem.Note,
TextSize=18,
TextTransparency=.4,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local ax=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
})
})
})


local ay
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
local az
if ag.KeySystem.Thumbnail.Title then
az=ac("TextLabel",{
Text=ag.KeySystem.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
ay=ac("ImageLabel",{
Image=ag.KeySystem.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,ap,1,-12),
Position=UDim2.new(0,6,0,6),
Parent=am.UIElements.Main,
ScaleType="Crop"
},{
az,
ac("UICorner",{
CornerRadius=UDim.new(0,20),
})
})
end

ac("Frame",{

Size=UDim2.new(1,ay and-ap or 0,1,0),
Position=UDim2.new(0,ay and ap or 0,0,0),
BackgroundTransparency=1,
Parent=am.UIElements.Main
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
au,
aw,
av,
ax,
ac("UIPadding",{
PaddingTop=UDim.new(0,24),
PaddingLeft=UDim.new(0,24),
PaddingRight=UDim.new(0,24),
PaddingBottom=UDim.new(0,24),
})
}),
})





local az=ae("Exit","log-out",function()
am:Close()()
end,"Tertiary",ax.Frame)

if ay then
az.Parent=ay
az.Size=UDim2.new(0,0,0,42)
az.Position=UDim2.new(0,10,1,-10)
az.AnchorPoint=Vector2.new(0,1)
end

if ag.KeySystem.URL then
ae("Get Link Key","key",function()
setclipboard(ag.KeySystem.URL)
end,"Secondary",ax.Frame)
end

if ag.KeySystem.Discord or ag.Discord then
local aA=ag.KeySystem.Discord or ag.Discord
ae("Join Discord","tv",function()
setclipboard(aA)
ag.HyperUI:Notify{
Title="Discord",
Content="Discord server link copied to clipboard.",
Icon="check",
}
end,"Secondary",ax.Frame)
end

if ag.KeySystem.API then








local aA=240
local aB=false
local b=ae("Get key","key",nil,"Secondary",ax.Frame)

local d=ab.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,1,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.9,
})

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=b.Frame,
},{
d,
ac("UIPadding",{
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
})
})

local f=ab.Image(
"chevron-down",
"chevron-down",
0,
"Temp",
"KeySystem",
true
)

f.Size=UDim2.new(1,0,1,0)

ac("Frame",{
Size=UDim2.new(0,21,0,21),
Parent=b.Frame,
BackgroundTransparency=1,
},{
f
})

local g=ab.NewRoundFrame(15,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Background",
},
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,5),
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
PaddingBottom=UDim.new(0,5),
}),
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
})
})

local h=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,aA,0,0),
ClipsDescendants=true,
AnchorPoint=Vector2.new(1,0),
Parent=b,
Position=UDim2.new(1,0,1,15)
},{
g
})

ac("TextLabel",{
Text="Select Service",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
Parent=g,
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
})
})

for j,l in next,ag.KeySystem.API do
local m=ag.HyperUI.Services[l.Type]
if m then
local p={}
for r,u in next,m.Args do
table.insert(p,l[u])
end

local r=m.New(table.unpack(p))
r.Type=l.Type
table.insert(an,r)

local u=ab.Image(
l.Icon or m.Icon or Icons[l.Type]or"user",
l.Icon or m.Icon or Icons[l.Type]or"user",
0,
"Temp",
"KeySystem",
true
)
u.Size=UDim2.new(0,24,0,24)

local v=ab.NewRoundFrame(10,"Squircle",{
Size=UDim2.new(1,0,0,0),
ThemeTag={ImageColor3="Text"},
ImageTransparency=1,
Parent=g,
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,10),
VerticalAlignment="Center",
}),
u,
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,-34,0,0),
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
HorizontalAlignment="Center",
}),
ac("TextLabel",{
Text=l.Title or m.Name,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.05,
TextSize=18,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
}),
ac("TextLabel",{
Text=l.Desc or"",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
Visible=l.Desc and true or false,
TextXAlignment="Left",
})
})
},true)

ab.AddSignal(v.MouseEnter,function()
ad(v,0.08,{ImageTransparency=.95}):Play()
end)
ab.AddSignal(v.InputEnded,function()
ad(v,0.08,{ImageTransparency=1}):Play()
end)
ab.AddSignal(v.MouseButton1Click,function()
r.Copy()
ag.HyperUI:Notify{
Title="Key System",
Content="Key link copied to clipboard.",
Image="key",
}
end)
end
end

ab.AddSignal(b.MouseButton1Click,function()
if not aB then
ad(h,.3,{Size=UDim2.new(0,aA,0,g.AbsoluteSize.Y+1)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(f,.3,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
else
ad(h,.25,{Size=UDim2.new(0,aA,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(f,.25,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
aB=not aB
end)

end

local function handleSuccess(aA)
am:Close()()
writefile((ag.Folder or"Temp").."/"..ah..".key",tostring(aA))
task.wait(.4)
ai(true)
end

local function shakeUI()
local aA=am.UIElements.MainContainer.Position
local aB=0.05
local b=10

task.spawn(function()
for d=1,3 do
ad(am.UIElements.MainContainer,aB,{Position=aA+UDim2.fromOffset(b,0)}):Play()
task.wait(aB)
ad(am.UIElements.MainContainer,aB,{Position=aA-UDim2.fromOffset(b,0)}):Play()
task.wait(aB)
end
ad(am.UIElements.MainContainer,aB,{Position=aA}):Play()
end)
end

local aA=ae("Validate Key","check-circle",function()
local aA=tostring(ao or"empty")local aB=
ag.Folder or ag.Title

local function notifyError(b)
shakeUI()
ag.HyperUI:Notify{
Title="Key System Error",
Content=b or"Invalid key.",
Icon="triangle-alert",
}
end

if ag.KeySystem.KeyValidator then
local b=ag.KeySystem.KeyValidator(aA)

if b then
if ag.KeySystem.SaveKey then
handleSuccess(aA)
else
am:Close()()
task.wait(.4)
ai(true)
end
else
notifyError"Invalid key."
end
elseif not ag.KeySystem.API then
local b=ag.KeySystem.Key or ag.KeySystem.Password
local d=type(b)=="table"
and table.find(b,aA)
or tostring(b)==aA

if d then
if ag.KeySystem.SaveKey then
handleSuccess(aA)
else
am:Close()()
task.wait(.4)
ai(true)
end
else
notifyError"Invalid key entered. Please try again."
end
else
local b,d
for f,g in next,an do
local h,j=g.Verify(aA)
if h then
b,d=true,j
break
end
d=j
end

if b then
handleSuccess(aA)
else
notifyError(d)
end
end
end,"Primary",ax)

aA.AnchorPoint=Vector2.new(1,0.5)
aA.Position=UDim2.new(1,0,0.5,0)










am:Open()
end

return aa end function a.p()

local aa={}

local ab=a.load'c'
local ac=ab.New
local ad=ab.Tween

game:GetService"RunService"

function aa.new(ae)
local af={
Frame=nil,
FinishSignal=Instance.new"BindableEvent"
}

local ag=Vector2.new(450,300)

local ah=ac("Frame",{
Name="LoadingScreen",
Size=UDim2.fromOffset(ag.X,ag.Y),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3=Color3.fromRGB(15,15,15),
BackgroundTransparency=0.1,
Parent=ae.Parent,
Active=true,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,16),
}),
ac("UIStroke",{
Thickness=1,
Transparency=0.8,
Color=Color3.fromRGB(255,255,255),
})
})


local ai=ac("Frame",{
Size=UDim2.new(0,60,0,20),
Position=UDim2.new(0,15,0,15),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
Padding=UDim.new(0,6),
}),
ac("Frame",{Size=UDim2.fromOffset(10,10),BackgroundColor3=Color3.fromHex"#FF5F57"},{ac("UICorner",{CornerRadius=UDim.new(1,0)})}),
ac("Frame",{Size=UDim2.fromOffset(10,10),BackgroundColor3=Color3.fromHex"#FFBD2E"},{ac("UICorner",{CornerRadius=UDim.new(1,0)})}),
ac("Frame",{Size=UDim2.fromOffset(10,10),BackgroundColor3=Color3.fromHex"#28C840"},{ac("UICorner",{CornerRadius=UDim.new(1,0)})}),
})
ai.Parent=ah


ac("TextLabel",{
Text="HyperUI Secure Core",
TextSize=12,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextColor3=Color3.fromRGB(150,150,150),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0,20),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize=Enum.AutomaticSize.XY,
Parent=ah,
},{
ac("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(150,150,150)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(150,150,150)),
}
})
})


local aj=ac("Frame",{
Size=UDim2.fromOffset(120,120),
Position=UDim2.new(0.5,0,0.45,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Parent=ah,
})


task.spawn(function()
local ak=aj.Position
while ah.Parent do
ad(aj,1.5,{Position=ak+UDim2.fromOffset(0,10)},Enum.EasingStyle.Sine,Enum.EasingDirection.InOut):Play()
task.wait(1.5)
ad(aj,1.5,{Position=ak},Enum.EasingStyle.Sine,Enum.EasingDirection.InOut):Play()
task.wait(1.5)
end
end)

ac("Frame",{
Size=UDim2.fromOffset(50,50),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3=Color3.fromRGB(30,30,30),
Parent=aj,
},{
ac("UICorner",{CornerRadius=UDim.new(0,14)}),
ac("ImageLabel",{
Size=UDim2.fromOffset(24,24),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image=ab.Icon"bolt"[1],
ImageRectOffset=ab.Icon"bolt"[2].ImageRectPosition,
ImageRectSize=ab.Icon"bolt"[2].ImageRectSize,
ImageColor3=Color3.fromHex"#257AF7",
})
})


ac("Frame",{
Size=UDim2.fromOffset(80,80),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Parent=aj,
},{
ac("UIStroke",{Thickness=1,Transparency=0.9,Color=Color3.fromRGB(255,255,255)}),
ac("UICorner",{CornerRadius=UDim.new(1,0)}),
})

ac("Frame",{
Size=UDim2.fromOffset(110,110),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Parent=aj,
},{
ac("UIStroke",{Thickness=1,Transparency=0.9,Color=Color3.fromRGB(255,255,255)}),
ac("UICorner",{CornerRadius=UDim.new(1,0)}),
})


local ak=ac("ImageLabel",{
Size=UDim2.fromOffset(95,95),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image="rbxassetid://132454641619478",
ImageColor3=Color3.fromHex"#257AF7",
Parent=aj,
})

task.spawn(function()
while ah.Parent do
ad(ak,2,{Rotation=ak.Rotation+360},Enum.EasingStyle.Linear):Play()
task.wait(2)
end
end)


local al=ac("TextLabel",{
Text="Initializing Environment",
TextSize=20,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
TextColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.7,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize=Enum.AutomaticSize.XY,
Parent=ah,
})

ac("TextLabel",{
Text="Version "..(ae.Version or"1.0.0").."-stable",
TextSize=14,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextColor3=Color3.fromRGB(150,150,150),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.77,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize=Enum.AutomaticSize.XY,
Parent=ah,
})


local am=ac("Frame",{
Size=UDim2.new(0.8,0,0,4),
Position=UDim2.new(0.5,0,0.95,0),
AnchorPoint=Vector2.new(0.5,1),
BackgroundColor3=Color3.fromRGB(40,40,40),
BorderSizePixel=0,
Parent=ah,
},{
ac("UICorner",{CornerRadius=UDim.new(1,0)}),
})

local an=ac("Frame",{
Size=UDim2.new(0,0,1,0),
BackgroundColor3=Color3.fromHex"#257AF7",
BorderSizePixel=0,
Parent=am,
},{
ac("UICorner",{CornerRadius=UDim.new(1,0)}),
ac("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromHex"#257AF7"),
ColorSequenceKeypoint.new(0.45,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.55,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromHex"#257AF7"),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(0.4,0.4),
NumberSequenceKeypoint.new(0.5,0),
NumberSequenceKeypoint.new(0.6,0.4),
NumberSequenceKeypoint.new(1,0),
},
Offset=Vector2.new(-1.5,0),
})
})

task.spawn(function()
local ao=an:FindFirstChildWhichIsA"UIGradient"
while ah.Parent do
local ap=ad(ao,1.5,{Offset=Vector2.new(1.5,0)},Enum.EasingStyle.Linear)
ap:Play()
ap.Completed:Wait()
ao.Offset=Vector2.new(-1.5,0)
end
end)

ac("TextLabel",{
Text="LOADING ASSETS...",
TextSize=12,
FontFace=Font.new(ab.Font,Enum.FontWeight.Bold),
TextColor3=Color3.fromRGB(100,100,100),
Position=UDim2.new(0.5,0,0.88,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.XY,
Parent=ah,
})


function af.UpdateStatus(ao,ap,aq)
al.Text=ap
ad(an,0.3,{Size=UDim2.new(aq/100,0,1,0)}):Play()
end

function af.Finish(ao)
ad(ah,0.5,{BackgroundTransparency=1,Size=UDim2.fromOffset(ag.X+40,ag.Y+40)}):Play()
local ap=ah:FindFirstChildWhichIsA"UIStroke"
if ap then
ad(ap,0.5,{Transparency=1}):Play()
end

for aq,ar in next,ah:GetDescendants()do
if ar:IsA"TextLabel"then
ad(ar,0.5,{TextTransparency=1}):Play()
elseif ar:IsA"ImageLabel"then
ad(ar,0.5,{ImageTransparency=1}):Play()
elseif ar:IsA"Frame"then
ad(ar,0.5,{BackgroundTransparency=1}):Play()
local as=ar:FindFirstChildWhichIsA"UIStroke"
if as then ad(as,0.5,{Transparency=1}):Play()end
end
end

task.wait(0.6)
ah:Destroy()
af.FinishSignal:Fire()
end

return af
end

return aa end function a.q()




local aa=(cloneref or clonereference or function(aa)return aa end)


local function map(ab,ac,ad,ae,af)
return(ab-ac)*(af-ae)/(ad-ac)+ae
end

local function viewportPointToWorld(ab,ac)
local ad=aa(game:GetService"Workspace").CurrentCamera:ScreenPointToRay(ab.X,ab.Y)
return ad.Origin+ad.Direction*ac
end

local function getOffset()
local ab=aa(game:GetService"Workspace").CurrentCamera.ViewportSize.Y
return map(ab,0,2560,8,56)
end

return{viewportPointToWorld,getOffset}end function a.r()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=a.load'c'
local ac=ab.New


local ad,ae=unpack(a.load'q')
local af=Instance.new("Folder",aa(game:GetService"Workspace").CurrentCamera)


local function createAcrylic()
local ag=ac("Part",{
Name="Body",
Color=Color3.new(0,0,0),
Material=Enum.Material.Glass,
Size=Vector3.new(1,1,0),
Anchored=true,
CanCollide=false,
Locked=true,
CastShadow=false,
Transparency=0.98,
},{
ac("SpecialMesh",{
MeshType=Enum.MeshType.Brick,
Offset=Vector3.new(0,0,-1E-6),
}),
})

return ag
end


local function createAcrylicBlur(ag)
local ah={}

ag=ag or 0.001
local ai={
topLeft=Vector2.new(),
topRight=Vector2.new(),
bottomRight=Vector2.new(),
}
local aj=createAcrylic()
aj.Parent=af

local function updatePositions(ak,al)
ai.topLeft=al
ai.topRight=al+Vector2.new(ak.X,0)
ai.bottomRight=al+ak
end

local function render()
local ak=aa(game:GetService"Workspace").CurrentCamera
if ak then
ak=ak.CFrame
end
local al=ak
if not al then
al=CFrame.new()
end

local am=al
local an=ai.topLeft
local ao=ai.topRight
local ap=ai.bottomRight

local aq=ad(an,ag)
local ar=ad(ao,ag)
local as=ad(ap,ag)

local at=(ar-aq).Magnitude
local au=(ar-as).Magnitude

aj.CFrame=
CFrame.fromMatrix((aq+as)/2,am.XVector,am.YVector,am.ZVector)
aj.Mesh.Scale=Vector3.new(at,au,0)
end

local function onChange(ak)
local al=ae()
local am=ak.AbsoluteSize-Vector2.new(al,al)
local an=ak.AbsolutePosition+Vector2.new(al/2,al/2)

updatePositions(am,an)
task.spawn(render)
end

local function renderOnChange()
local ak=aa(game:GetService"Workspace").CurrentCamera
if not ak then
return
end

table.insert(ah,ak:GetPropertyChangedSignal"CFrame":Connect(render))
table.insert(ah,ak:GetPropertyChangedSignal"ViewportSize":Connect(render))
table.insert(ah,ak:GetPropertyChangedSignal"FieldOfView":Connect(render))
task.spawn(render)
end

aj.Destroying:Connect(function()
for ak,al in ah do
pcall(function()
al:Disconnect()
end)
end
end)

renderOnChange()

return onChange,aj
end

return function(ag)
local ah={}
local ai,aj=createAcrylicBlur(ag)

local ak=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
})

ab.AddSignal(ak:GetPropertyChangedSignal"AbsolutePosition",function()
ai(ak)
end)

ab.AddSignal(ak:GetPropertyChangedSignal"AbsoluteSize",function()
ai(ak)
end)

ah.AddParent=function(al)
ab.AddSignal(al:GetPropertyChangedSignal"Visible",function()
ah.SetVisibility(al.Visible)
end)
end

ah.SetVisibility=function(al)
aj.Transparency=al and 0.98 or 1
end

ah.Frame=ak
ah.Model=aj

return ah
end end function a.s()



local aa=a.load'c'
local ab=a.load'r'

local ac=aa.New

return function(ad)
local ae={}

ae.Frame=ac("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,
},{












ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Name="Background",
ThemeTag={
BackgroundColor3="AcrylicMain",
},
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("Frame",{
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{










}),

ac("ImageLabel",{
Image="rbxassetid://9968344105",
ImageTransparency=0.98,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("ImageLabel",{
Image="rbxassetid://9968344227",
ImageTransparency=0.9,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ThemeTag={
ImageTransparency="AcrylicNoise",
},
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
ZIndex=2,
},{










}),
})


local af

task.wait()
if ad.UseAcrylic then
af=ab()

af.Frame.Parent=ae.Frame
ae.Model=af.Model
ae.AddParent=af.AddParent
ae.SetVisibility=af.SetVisibility
end

return ae,af
end end function a.t()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab={
AcrylicBlur=a.load'r',

AcrylicPaint=a.load's',
}

function ab.init()
local ac=Instance.new"DepthOfFieldEffect"
ac.FarIntensity=0
ac.InFocusRadius=0.1
ac.NearIntensity=1

local ad={}

function ab.Enable()
for ae,af in pairs(ad)do
af.Enabled=false
end
ac.Parent=aa(game:GetService"Lighting")
end

function ab.Disable()
for ae,af in pairs(ad)do
af.Enabled=af.enabled
end
ac.Parent=nil
end

local function registerDefaults()
local function register(ae)
if ae:IsA"DepthOfFieldEffect"then
ad[ae]={enabled=ae.Enabled}
end
end

for ae,af in pairs(aa(game:GetService"Lighting"):GetChildren())do
register(af)
end

if aa(game:GetService"Workspace").CurrentCamera then
for ae,af in pairs(aa(game:GetService"Workspace").CurrentCamera:GetChildren())do
register(af)
end
end
end

registerDefaults()
ab.Enable()
end

return ab end function a.u()

local aa={}

local ab=a.load'c'
local ac=ab.New local ad=
ab.Tween


function aa.new(ae)
local af={
Title=ae.Title or"Dialog",
Content=ae.Content,
Icon=ae.Icon,
IconThemed=ae.IconThemed,
Thumbnail=ae.Thumbnail,
Buttons=ae.Buttons,

IconSize=22,
}

local ag=a.load'n'.Init(nil,ae.HyperUI.ScreenGui.Popups)
local ah=ag.Create(true,"Popup")

local ai=200

local aj=430
if af.Thumbnail and af.Thumbnail.Image then
aj=430+(ai/2)
end

ah.UIElements.Main.AutomaticSize="Y"
ah.UIElements.Main.Size=UDim2.new(0,aj,0,0)



local ak

if af.Icon then
ak=ab.Image(
af.Icon,
af.Title..":"..af.Icon,
0,
ae.HyperUI.Window,
"Popup",
true,
ae.IconThemed,
"PopupIcon"
)
ak.Size=UDim2.new(0,af.IconSize,0,af.IconSize)
ak.LayoutOrder=-1
end


local al=ac("TextLabel",{
AutomaticSize="Y",
BackgroundTransparency=1,
Text=af.Title,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="PopupTitle",
},
TextSize=20,
TextWrapped=true,
Size=UDim2.new(1,ak and-af.IconSize-14 or 0,0,0)
})

local am=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
ak,al
})

local an=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





am,
})

local ao
if af.Content and af.Content~=""then
ao=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=af.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="PopupContent",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local ap=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local aq
if af.Thumbnail and af.Thumbnail.Image then
local ar
if af.Thumbnail.Title then
ar=ac("TextLabel",{
Text=af.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
aq=ac("ImageLabel",{
Image=af.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,ai,1,0),
Parent=ah.UIElements.Main,
ScaleType="Crop"
},{
ar,
ac("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

ac("Frame",{

Size=UDim2.new(1,aq and-ai or 0,1,0),
Position=UDim2.new(0,aq and ai or 0,0,0),
BackgroundTransparency=1,
Parent=ah.UIElements.Main
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
an,
ao,
ap,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local ar=a.load'l'.New

for as,at in next,af.Buttons do
ar(at.Title,at.Icon,at.Callback,at.Variant,ap,ah)
end

ah:Open()


return af
end

return aa end function a.v()

return function(aa)
return{
Dark={
Name="Dark",

Accent=Color3.fromHex"#18181b",
Dialog=Color3.fromHex"#161616",
Outline=Color3.fromHex"#FFFFFF",
Text=Color3.fromHex"#FFFFFF",
Placeholder=Color3.fromHex"#7a7a7a",
Background=Color3.fromHex"#101010",
Button=Color3.fromHex"#52525b",
Icon=Color3.fromHex"#a1a1aa",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,

SliderIcon=Color3.fromHex"#908F95",
Primary=Color3.fromHex"#0091FF",
},

Light={
Name="Light",

Accent=Color3.fromHex"#FFFFFF",
Dialog=Color3.fromHex"#f4f4f5",
Outline=Color3.fromHex"#09090b",
Text=Color3.fromHex"#000000",
Placeholder=Color3.fromHex"#555555",
Background=Color3.fromHex"#e9e9e9",
Button=Color3.fromHex"#18181b",
Icon=Color3.fromHex"#52525b",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",

TabBackground=Color3.fromHex"#ffffff",
TabBackgroundHover=Color3.fromHex"#ffffff",
TabBackgroundHoverTransparency=0.5,
TabBackgroundActive=Color3.fromHex"#ffffff",
TabBackgroundActiveTransparency=0,

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0,

LabelBackground=Color3.fromHex"#ffffff",
LabelBackgroundTransparency=0,
},

Rose={
Name="Rose",

Accent=Color3.fromHex"#be185d",
Dialog=Color3.fromHex"#4c0519",
Outline=Color3.fromHex"#fecdd3",
Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#d67aa6",
Background=Color3.fromHex"#1f0308",
Button=Color3.fromHex"#e95f74",
Icon=Color3.fromHex"#fb7185",
},

Plant={
Name="Plant",

Accent=Color3.fromHex"#166534",
Dialog=Color3.fromHex"#052e16",
Outline=Color3.fromHex"#bbf7d0",
Text=Color3.fromHex"#f0fdf4",
Placeholder=Color3.fromHex"#4fbf7a",
Background=Color3.fromHex"#0a1b0f",
Button=Color3.fromHex"#16a34a",
Icon=Color3.fromHex"#4ade80",
},

Red={
Name="Red",

Accent=Color3.fromHex"#991b1b",
Dialog=Color3.fromHex"#450a0a",
Outline=Color3.fromHex"#fecaca",
Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#d95353",
Background=Color3.fromHex"#1c0606",
Button=Color3.fromHex"#dc2626",
Icon=Color3.fromHex"#ef4444",
},

Indigo={
Name="Indigo",

Accent=Color3.fromHex"#3730a3",
Dialog=Color3.fromHex"#1e1b4b",
Outline=Color3.fromHex"#c7d2fe",
Text=Color3.fromHex"#f1f5f9",
Placeholder=Color3.fromHex"#7078d9",
Background=Color3.fromHex"#0f0a2e",
Button=Color3.fromHex"#4f46e5",
Icon=Color3.fromHex"#6366f1",
},

Sky={
Name="Sky",

Accent=Color3.fromHex"#00d4ff",
Dialog=Color3.fromHex"#0a4d66",
Outline=Color3.fromHex"#4dd9ff",
Text=Color3.fromHex"#e6f7ff",
Placeholder=Color3.fromHex"#66b3cc",
Background=Color3.fromHex"#051a26",
Button=Color3.fromHex"#00a8cc",
Icon=Color3.fromHex"#2db8d9",

Toggle=Color3.fromHex"#00d9d9",
Slider=Color3.fromHex"#00d4ff",
Checkbox=Color3.fromHex"#00d4ff",

PanelBackground=Color3.fromHex"#0d3a47",
PanelBackgroundTransparency=0.8,
},

Violet={
Name="Violet",

Accent=Color3.fromHex"#6d28d9",
Dialog=Color3.fromHex"#3c1361",
Outline=Color3.fromHex"#ddd6fe",
Text=Color3.fromHex"#faf5ff",
Placeholder=Color3.fromHex"#8f7ee0",
Background=Color3.fromHex"#1e0a3e",
Button=Color3.fromHex"#7c3aed",
Icon=Color3.fromHex"#8b5cf6",
},

Amber={
Name="Amber",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#b45309",Transparency=0},
["100"]={Color=Color3.fromHex"#d97706",Transparency=0},
},{Rotation=45}),

Dialog=aa:Gradient({
["0"]={Color=Color3.fromHex"#451a03",Transparency=0},
["100"]={Color=Color3.fromHex"#6b2e05",Transparency=0},
},{Rotation=90}),

Outline=aa:Gradient({
["0"]={Color=Color3.fromHex"#fde68a",Transparency=0},
["100"]={Color=Color3.fromHex"#fcd34d",Transparency=0},
},{Rotation=45}),

Text=aa:Gradient({
["0"]={Color=Color3.fromHex"#fffbeb",Transparency=0},
["100"]={Color=Color3.fromHex"#fff7ed",Transparency=0},
},{Rotation=45}),

Placeholder=aa:Gradient({
["0"]={Color=Color3.fromHex"#d1a326",Transparency=0},
["100"]={Color=Color3.fromHex"#fbbf24",Transparency=0},
},{Rotation=45}),

Background=aa:Gradient({
["0"]={Color=Color3.fromHex"#1c1003",Transparency=0},
["100"]={Color=Color3.fromHex"#3f210d",Transparency=0},
},{Rotation=90}),

Button=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#f59e0b",Transparency=0},
},{Rotation=45}),

Icon=Color3.fromHex"#f59e0b",

Toggle=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#f59e0b",Transparency=0},
},{Rotation=45}),

Slider=Color3.fromHex"#d97706",

Checkbox=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#fbbf24",Transparency=0},
},{Rotation=45}),

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,
},

Emerald={
Name="Emerald",

Accent=Color3.fromHex"#047857",
Dialog=Color3.fromHex"#022c22",
Outline=Color3.fromHex"#a7f3d0",
Text=Color3.fromHex"#ecfdf5",
Placeholder=Color3.fromHex"#3fbf8f",
Background=Color3.fromHex"#011411",
Button=Color3.fromHex"#059669",
Icon=Color3.fromHex"#10b981",
},

Midnight={
Name="Midnight",

Accent=Color3.fromHex"#1e3a8a",
Dialog=Color3.fromHex"#0c1e42",
Outline=Color3.fromHex"#bfdbfe",
Text=Color3.fromHex"#dbeafe",
Placeholder=Color3.fromHex"#2f74d1",
Background=Color3.fromHex"#0a0f1e",
Button=Color3.fromHex"#2563eb",
Primary=Color3.fromHex"#2563eb",
Icon=Color3.fromHex"#5591f4",
},

Crimson={
Name="Crimson",

Accent=Color3.fromHex"#b91c1c",
Dialog=Color3.fromHex"#450a0a",
Outline=Color3.fromHex"#fca5a5",
Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#6f757b",
Background=Color3.fromHex"#0c0404",
Button=Color3.fromHex"#991b1b",
Icon=Color3.fromHex"#dc2626",
},

MonokaiPro={
Name="Monokai Pro",

Accent=Color3.fromHex"#fc9867",
Dialog=Color3.fromHex"#1e1e1e",
Outline=Color3.fromHex"#78dce8",
Text=Color3.fromHex"#fcfcfa",
Placeholder=Color3.fromHex"#6f6f6f",
Background=Color3.fromHex"#191622",
Button=Color3.fromHex"#ab9df2",
Icon=Color3.fromHex"#a9dc76",

Metadata={
PullRequest=23,
}
},

CottonCandy={
Name="Cotton Candy",

Accent=Color3.fromHex"#ec4899",
Dialog=Color3.fromHex"#2d1b3d",
Outline=Color3.fromHex"#f9a8d4",
Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#8a5fd3",
Background=Color3.fromHex"#1a0b2e",
Button=Color3.fromHex"#d946ef",
Slider=Color3.fromHex"#d946ef",
Icon=Color3.fromHex"#06b6d4",
},

Mellowsi={
Name="Mellowsi",

Accent=Color3.fromHex"#342A1E",
Dialog=Color3.fromHex"#291C13",
Outline=Color3.fromHex"#6B5A45",
Text=Color3.fromHex"#F5EBDD",
Placeholder=Color3.fromHex"#9C8A73",
Background=Color3.fromHex"#1C1002",
Button=Color3.fromHex"#342A1E",
Icon=Color3.fromHex"#C9B79C",

Toggle=Color3.fromHex"#a9873f",
Slider=Color3.fromHex"#C9A24D",
Checkbox=Color3.fromHex"#C9A24D",

Metadata={
PullRequest=52,
}
},

Rainbow={
Name="Rainbow",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#00ff41",Transparency=0},
["33"]={Color=Color3.fromHex"#00ffff",Transparency=0},
["66"]={Color=Color3.fromHex"#0080ff",Transparency=0},
["100"]={Color=Color3.fromHex"#8000ff",Transparency=0},
},{Rotation=45}),

Dialog=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0080",Transparency=0},
["25"]={Color=Color3.fromHex"#8000ff",Transparency=0},
["50"]={Color=Color3.fromHex"#0080ff",Transparency=0},
["75"]={Color=Color3.fromHex"#00ff80",Transparency=0},
["100"]={Color=Color3.fromHex"#ff8000",Transparency=0},
},{Rotation=135}),

Outline=Color3.fromHex"#ffffff",
Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#00ff80",

Background=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0040",Transparency=0},
["20"]={Color=Color3.fromHex"#ff4000",Transparency=0},
["40"]={Color=Color3.fromHex"#ffff00",Transparency=0},
["60"]={Color=Color3.fromHex"#00ff40",Transparency=0},
["80"]={Color=Color3.fromHex"#0040ff",Transparency=0},
["100"]={Color=Color3.fromHex"#4000ff",Transparency=0},
},{Rotation=90}),

Button=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0080",Transparency=0},
["25"]={Color=Color3.fromHex"#ff8000",Transparency=0},
["50"]={Color=Color3.fromHex"#ffff00",Transparency=0},
["75"]={Color=Color3.fromHex"#80ff00",Transparency=0},
["100"]={Color=Color3.fromHex"#00ffff",Transparency=0},
},{Rotation=60}),

Icon=Color3.fromHex"#ffffff",
},

DarkStealth={
Name="Dark Stealth",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#1a1a1a",Transparency=0},
["100"]={Color=Color3.fromHex"#4a4a4a",Transparency=0},
},{Rotation=45}),

Dialog=Color3.fromHex"#0a0a0a",
Outline=Color3.fromHex"#3a3a3a",
Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#7a7a7a",
Background=Color3.fromHex"#050505",
Button=Color3.fromHex"#2a2a2a",
Icon=Color3.fromHex"#8a8a8a",

PanelBackground=Color3.fromHex"#1a1a1a",
PanelBackgroundTransparency=0.5,
},

CrimsonFrost={
Name="Crimson Frost",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0000",Transparency=0},
["100"]={Color=Color3.fromHex"#ffffff",Transparency=0},
},{Rotation=45}),

Dialog=Color3.fromHex"#1a0000",
Outline=Color3.fromHex"#ffffff",
Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#ffaaaa",
Background=Color3.fromHex"#0a0000",
Button=Color3.fromHex"#4a0000",
Icon=Color3.fromHex"#ff4a4a",

PanelBackground=Color3.fromHex"#3a0000",
PanelBackgroundTransparency=0.5,
},
}
end end function a.w()

local aa={}

local ab=a.load'c'
local ac=ab.New local ad=
ab.Tween


function aa.New(ae,af,ag,ah,ai)
local aj=ai or 10
local ak
if af and af~=""then
ak=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local al=ac("TextLabel",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,ak and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3=ah and"Placeholder"or"Text",
},
Text=ae,
})

local am=ac("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1,
Text="",
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(aj,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.97,
}),
ab.NewRoundFrame(aj,"Glass-1.4",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.75,
},{













}),
ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},


},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ak,
al,
})
})
})

return am
end


return aa end function a.x()

local aa={}

local ab=(cloneref or clonereference or function(ab)return ab end)


local ac=ab(game:GetService"UserInputService")

local ad=a.load'c'
local ae=ad.New local af=
ad.Tween


function aa.New(ag,ah,ai,aj)
local ak=ae("Frame",{
Size=UDim2.new(0,aj,1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
Parent=ah,
ZIndex=999,
Active=true,
})

local al=ad.NewRoundFrame(aj/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=ak,
})

local am=ae("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=al,
})

local an=false
local ao=0

local function updateSliderSize()
local ap=ag
local aq=ap.AbsoluteCanvasSize.Y
local ar=ap.AbsoluteWindowSize.Y

if aq<=ar then
al.Visible=false
return
end

local as=math.clamp(ar/aq,0.1,1)
al.Size=UDim2.new(1,0,as,0)
al.Visible=true
end

local function updateScrollingFramePosition()
local ap=al.Position.Y.Scale
local aq=ag.AbsoluteCanvasSize.Y
local ar=ag.AbsoluteWindowSize.Y
local as=math.max(aq-ar,0)

if as<=0 then return end

local at=math.max(1-al.Size.Y.Scale,0)
if at<=0 then return end

local au=ap/at

ag.CanvasPosition=Vector2.new(
ag.CanvasPosition.X,
au*as
)
end

local function updateThumbPosition()
if an then return end

local ap=ag.CanvasPosition.Y
local aq=ag.AbsoluteCanvasSize.Y
local ar=ag.AbsoluteWindowSize.Y
local as=math.max(aq-ar,0)

if as<=0 then
al.Position=UDim2.new(0,0,0,0)
return
end

local at=ap/as
local au=math.max(1-al.Size.Y.Scale,0)
local av=math.clamp(at*au,0,au)

al.Position=UDim2.new(0,0,av,0)
end

ad.AddSignal(ak.InputBegan,function(ap)
if(ap.UserInputType==Enum.UserInputType.MouseButton1 or ap.UserInputType==Enum.UserInputType.Touch)then
local aq=al.AbsolutePosition.Y
local ar=aq+al.AbsoluteSize.Y

if not(ap.Position.Y>=aq and ap.Position.Y<=ar)then
local as=ak.AbsolutePosition.Y
local at=ak.AbsoluteSize.Y
local au=al.AbsoluteSize.Y

local av=ap.Position.Y-as-au/2
local aw=at-au

local ax=math.clamp(av/aw,0,1-al.Size.Y.Scale)

al.Position=UDim2.new(0,0,ax,0)
updateScrollingFramePosition()
end
end
end)

ad.AddSignal(am.InputBegan,function(ap)
if ap.UserInputType==Enum.UserInputType.MouseButton1 or ap.UserInputType==Enum.UserInputType.Touch then
an=true
ao=ap.Position.Y-al.AbsolutePosition.Y

local aq
local ar

aq=ac.InputChanged:Connect(function(as)
if as.UserInputType==Enum.UserInputType.MouseMovement or as.UserInputType==Enum.UserInputType.Touch then
local at=ak.AbsolutePosition.Y
local au=ak.AbsoluteSize.Y
local av=al.AbsoluteSize.Y

local aw=as.Position.Y-at-ao
local ax=au-av

local ay=math.clamp(aw/ax,0,1-al.Size.Y.Scale)

al.Position=UDim2.new(0,0,ay,0)
updateScrollingFramePosition()
end
end)

ar=ac.InputEnded:Connect(function(as)
if as.UserInputType==Enum.UserInputType.MouseButton1 or as.UserInputType==Enum.UserInputType.Touch then
an=false
if aq then aq:Disconnect()end
if ar then ar:Disconnect()end
end
end)
end
end)

ad.AddSignal(ag:GetPropertyChangedSignal"AbsoluteWindowSize",function()
updateSliderSize()
updateThumbPosition()
end)

ad.AddSignal(ag:GetPropertyChangedSignal"AbsoluteCanvasSize",function()
updateSliderSize()
updateThumbPosition()
end)

ad.AddSignal(ag:GetPropertyChangedSignal"CanvasPosition",function()
if not an then
updateThumbPosition()
end
end)

updateSliderSize()
updateThumbPosition()

return ak
end


return aa end function a.y()

local aa={}


local ab=a.load'c'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag)
local ah={
Title=af.Title or"Tag",
Icon=af.Icon,
Color=af.Color or Color3.fromHex"#315dff",
Radius=af.Radius or 999,
Border=af.Border or false,

TagFrame=nil,
Height=26,
Padding=10,
TextSize=14,
IconSize=16,
}

local ai
if ah.Icon then
ai=ab.Image(
ah.Icon,
ah.Icon,
0,
af.Window,
"Tag",
false
)

ai.Size=UDim2.new(0,ah.IconSize,0,ah.IconSize)
ai.ImageLabel.ImageColor3=typeof(ah.Color)=="Color3"and ab.GetTextColorForHSB(ah.Color)or nil
end

local aj=ac("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="XY",
TextSize=ah.TextSize,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ah.Title,
TextColor3=typeof(ah.Color)=="Color3"and ab.GetTextColorForHSB(ah.Color)or nil,
})

local ak

if typeof(ah.Color)=="table"then

ak=ac"UIGradient"
for al,am in next,ah.Color do
ak[al]=am
end

aj.TextColor3=ab.GetTextColorForHSB(ab.GetAverageColor(ak))
if ai then
ai.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ab.GetAverageColor(ak))
end
end



local al=ab.NewRoundFrame(ah.Radius,"Squircle",{
AutomaticSize="X",
Size=UDim2.new(0,0,0,ah.Height),
Parent=ag,
ImageColor3=typeof(ah.Color)=="Color3"and ah.Color or Color3.new(1,1,1),
},{
ak,
ab.NewRoundFrame(ah.Radius,"Glass-1",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=.75
}),
ac("Frame",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Name="Content",
BackgroundTransparency=1,
},{
ai,
aj,
ac("UIPadding",{
PaddingLeft=UDim.new(0,ah.Padding),
PaddingRight=UDim.new(0,ah.Padding),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,ah.Padding/1.5)
})
}),
})


function ah.SetTitle(am,an)
ah.Title=an
aj.Text=an

return ah
end

function ah.SetColor(am,an)
ah.Color=an
if typeof(an)=="table"then
local ao=ab.GetAverageColor(an)
ad(aj,.06,{TextColor3=ab.GetTextColorForHSB(ao)}):Play()
local ap=al:FindFirstChildOfClass"UIGradient"or ac("UIGradient",{Parent=al})
for aq,ar in next,an do ap[aq]=ar end
ad(al,.06,{ImageColor3=Color3.new(1,1,1)}):Play()
else
if ak then
ak:Destroy()
end
ad(aj,.06,{TextColor3=ab.GetTextColorForHSB(an)}):Play()
if ai then
ad(ai.ImageLabel,.06,{ImageColor3=ab.GetTextColorForHSB(an)}):Play()
end
ad(al,.06,{ImageColor3=an}):Play()
end

return ah
end

function ah.SetIcon(am,an)
ah.Icon=an

if an then
ai=ab.Image(
an,
an,
0,
af.Window,
"Tag",
false
)

ai.Size=UDim2.new(0,ah.IconSize,0,ah.IconSize)
ai.Parent=al

if typeof(ah.Color)=="Color3"then
ai.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ah.Color)
elseif typeof(ah.Color)=="table"then
ai.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ab.GetAverageColor(ak))
end
else
if ai then
ai:Destroy()
ai=nil
end
end
return ah
end

function ah.Destroy(am)
al:Destroy()
return ah
end

return ah
end


return aa end function a.z()

local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=aa(game:GetService"RunService")
local ac=aa(game:GetService"HttpService")

local ad

local ae
ae={
Folder=nil,
Path=nil,
Configs={},
Parser={
Colorpicker={
Save=function(af)
return{
__type=af.__type,
value=af.Default:ToHex(),
transparency=af.Transparency or nil,
}
end,
Load=function(af,ag)
if af and af.Update then
af:Update(Color3.fromHex(ag.value),ag.transparency or nil)
end
end
},
Dropdown={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Select then
af:Select(ag.value)
end
end
},
Input={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(ag.value)
end
end
},
Keybind={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(ag.value)
end
end
},
Slider={
Save=function(af)
return{
__type=af.__type,
value=af.Value.Default,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(tonumber(ag.value))
end
end
},
Toggle={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(ag.value)
end
end
},
}
}

function ae.Init(af,ag)
if not ag.Folder then
warn"[ HyperUI.ConfigManager ] Window.Folder is not specified."
return false
end
if ab:IsStudio()or not writefile then
warn"[ HyperUI.ConfigManager ] The config system doesn't work in the studio."
return false
end

ad=ag
ae.Folder=ad.Folder
ae.Path="HyperUI/"..tostring(ae.Folder).."/config/"

if not isfolder(ae.Path)then
makefolder(ae.Path)
end

local ah=ae:AllConfigs()

for ai,aj in next,ah do
if isfile and readfile and isfile(aj..".json")then
ae.Configs[aj]=readfile(aj..".json")
end
end

return ae
end

function ae.SetPath(af,ag)
if not ag then
warn"[ HyperUI.ConfigManager ] Custom path is not specified."
return false
end

ae.Path=ag
if not ag:match"/$"then
ae.Path=ag.."/"
end

if not isfolder(ae.Path)then
makefolder(ae.Path)
end

return true
end

function ae.CreateConfig(af,ag,ah)
local ai={
Path=ae.Path..ag..".json",
Elements={},
CustomData={},
AutoLoad=ah or false,
Version=1.2,
}

if not ag then
return false,"No config file is selected"
end

function ai.SetAsCurrent(aj)
ad:SetCurrentConfig(ai)
end

function ai.Register(aj,ak,al)
ai.Elements[ak]=al
end

function ai.Set(aj,ak,al)
ai.CustomData[ak]=al
end

function ai.Get(aj,ak)
return ai.CustomData[ak]
end

function ai.SetAutoLoad(aj,ak)
ai.AutoLoad=ak
end

function ai.Save(aj)
if ad.PendingFlags then
for ak,al in next,ad.PendingFlags do
ai:Register(ak,al)
end
end

local ak={
__version=ai.Version,
__elements={},
__autoload=ai.AutoLoad,
__custom=ai.CustomData
}

for al,am in next,ai.Elements do
if ae.Parser[am.__type]then
ak.__elements[tostring(al)]=ae.Parser[am.__type].Save(am)
end
end

local al=ac:JSONEncode(ak)
if writefile then
writefile(ai.Path,al)
end

return ak
end

function ai.Load(aj)
if isfile and not isfile(ai.Path)then
return false,"Config file does not exist"
end

local ak,al=pcall(function()
local ak=readfile or function()
warn"[ HyperUI.ConfigManager ] The config system doesn't work in the studio."
return nil
end
return ac:JSONDecode(ak(ai.Path))
end)

if not ak then
return false,"Failed to parse config file"
end

if not al.__version then
local am={
__version=ai.Version,
__elements=al,
__custom={}
}
al=am
end

if ad.PendingFlags then
for am,an in next,ad.PendingFlags do
ai:Register(am,an)
end
end

for am,an in next,(al.__elements or{})do
if ai.Elements[am]and ae.Parser[an.__type]then
task.spawn(function()
ae.Parser[an.__type].Load(ai.Elements[am],an)
end)
end
end

ai.CustomData=al.__custom or{}

return ai.CustomData
end

function ai.Delete(aj)
if not delfile then
return false,"delfile function is not available"
end

if not isfile(ai.Path)then
return false,"Config file does not exist"
end

local ak,al=pcall(function()
delfile(ai.Path)
end)

if not ak then
return false,"Failed to delete config file: "..tostring(al)
end

ae.Configs[ag]=nil

if ad.CurrentConfig==ai then
ad.CurrentConfig=nil
end

return true,"Config deleted successfully"
end

function ai.GetData(aj)
return{
elements=ai.Elements,
custom=ai.CustomData,
autoload=ai.AutoLoad
}
end


if isfile(ai.Path)then
local aj,ak=pcall(function()
return ac:JSONDecode(readfile(ai.Path))
end)

if aj and ak and ak.__autoload then
ai.AutoLoad=true

task.spawn(function()
task.wait(0.5)
local al,am=pcall(function()
return ai:Load()
end)
if al then
if ad.Debug then print("[ HyperUI.ConfigManager ] AutoLoaded config: "..ag)end
else
warn("[ HyperUI.ConfigManager ] Failed to AutoLoad config: "..ag.." - "..tostring(am))
end
end)
end
end


ai:SetAsCurrent()
ae.Configs[ag]=ai
return ai
end

function ae.Config(af,ag,ah)
return ae:CreateConfig(ag,ah)
end

function ae.GetAutoLoadConfigs(af)
local ag={}

for ah,ai in pairs(ae.Configs)do
if ai.AutoLoad then
table.insert(ag,ah)
end
end

return ag
end

function ae.DeleteConfig(af,ag)
if not delfile then
return false,"delfile function is not available"
end

local ah=ae.Path..ag..".json"

if not isfile(ah)then
return false,"Config file does not exist"
end

local ai,aj=pcall(function()
delfile(ah)
end)

if not ai then
return false,"Failed to delete config file: "..tostring(aj)
end

ae.Configs[ag]=nil

if ad.CurrentConfig and ad.CurrentConfig.Path==ah then
ad.CurrentConfig=nil
end

return true,"Config deleted successfully"
end

function ae.AllConfigs(af)
if not listfiles then return{}end

local ag={}
if not isfolder(ae.Path)then
makefolder(ae.Path)
return ag
end

for ah,ai in next,listfiles(ae.Path)do
local aj=ai:match"([^\\/]+)%.json$"
if aj then
table.insert(ag,aj)
end
end

return ag
end

function ae.GetConfig(af,ag)
return ae.Configs[ag]
end

return ae end function a.A()

local aa=a.load'c'local ab=
aa.New
local ac=aa.Tween
local ad=game:GetService"UserInputService"

local ae={}

function ae.Init(af,ag,ah)
local ai=false
local aj
local ak

local function startResizing(al)
if af.CanResize then
ai=true
ah.Active=true
aj=af.UIElements.Main.Size
ak=al.Position
ac(ag.ImageLabel,0.1,{ImageTransparency=.35}):Play()

aa.AddSignal(al.Changed,function()
if al.UserInputState==Enum.UserInputState.End then
ai=false
ah.Active=false
ac(ag.ImageLabel,0.17,{ImageTransparency=.8}):Play()
end
end)
end
end

aa.AddSignal(ag.InputBegan,function(al)
if al.UserInputType==Enum.UserInputType.MouseButton1 or al.UserInputType==Enum.UserInputType.Touch then
if af.CanResize then
startResizing(al)
end
end
end)

aa.AddSignal(ad.InputChanged,function(al)
if al.UserInputType==Enum.UserInputType.MouseMovement or al.UserInputType==Enum.UserInputType.Touch then
if ai and af.CanResize then
local am=al.Position-ak
local an=UDim2.new(0,aj.X.Offset+am.X*2,0,aj.Y.Offset+am.Y*2)

an=UDim2.new(
an.X.Scale,
math.clamp(an.X.Offset,af.MinSize.X,af.MaxSize.X),
an.Y.Scale,
math.clamp(an.Y.Offset,af.MinSize.Y,af.MaxSize.Y)
)

ac(af.UIElements.Main,0,{
Size=an
}):Play()

af.Size=an
end
end
end)
end

return ae end function a.B()

local aa=a.load'c'
local ab=aa.New local ac=
aa.Tween

local ad={}

function ad.Init(ae,af)
local ag=af.HyperUI

aa.AddSignal(ae.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize",function()
local ah=ae.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X/ag.UIScale
local ai=ae.UIElements.Main.Main.Topbar.Left.AbsoluteSize.X/ag.UIScale

if ae.Topbar.ButtonsType~="Default"then
ai=ai+ah+ae.UIPadding-4
end

ae.UIElements.Main.Main.Topbar.Center.Position=UDim2.new(
0,
ai+(ae.UIPadding/ag.UIScale),
0.5,
0
)
ae.UIElements.Main.Main.Topbar.Center.Size=UDim2.new(
1,
-ai-ah-((ae.UIPadding*2)/ag.UIScale),
1,
0
)
end)

if ae.Topbar.ButtonsType~="Default"then
aa.AddSignal(ae.UIElements.Main.Main.Topbar.Right:GetPropertyChangedSignal"AbsoluteSize",function()
ae.UIElements.Main.Main.Topbar.Left.Position=UDim2.new(0,(ae.UIElements.Main.Main.Topbar.Right.AbsoluteSize.X/ag.UIScale)+ae.UIPadding-4,0,0)
end)
end

function ae.CreateTopbarButton(ah,ai,aj,ak,al,am,an,ao)
local ap=aa.Image(
aj,
aj,
0,
ae.Folder,
"WindowTopbarIcon",
ae.Topbar.ButtonsType=="Default"and true or false,
am,
"WindowTopbarButtonIcon"
)
ap.Size=ae.Topbar.ButtonsType=="Default"and UDim2.new(0,ao or ae.TopBarButtonIconSize,0,ao or ae.TopBarButtonIconSize)or UDim2.new(0,0,0,0)
ap.AnchorPoint=Vector2.new(0.5,0.5)
ap.Position=UDim2.new(0.5,0,0.5,0)
ap.ImageLabel.ImageTransparency=ae.Topbar.ButtonsType=="Default"and 0 or 1
if ae.Topbar.ButtonsType~="Default"then
ap.ImageLabel.ImageColor3=aa.GetTextColorForHSB(an)
end

local aq=aa.NewRoundFrame(ae.Topbar.ButtonsType=="Default"and ae.UICorner-(ae.UIPadding/2)or 999,"Squircle",{
Size=ae.Topbar.ButtonsType=="Default"and UDim2.new(0,ae.Topbar.Height-16,0,ae.Topbar.Height-16)or UDim2.new(0,14,0,14),
LayoutOrder=al or 999,
Parent=ae.Topbar.ButtonsType=="Default"and ae.UIElements.Main.Main.Topbar.Right or nil,
ZIndex=aa.ZIndex.Topbar,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=ae.Topbar.ButtonsType~="Default"and(an or Color3.fromHex"#ff3030")or nil,
ThemeTag=ae.Topbar.ButtonsType=="Default"and{
ImageColor3="Text"
}or nil,
ImageTransparency=ae.Topbar.ButtonsType=="Default"and 1 or 0
},{
aa.NewRoundFrame(ae.Topbar.ButtonsType=="Default"and ae.UICorner-(ae.UIPadding/2)or 999,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Black",
},
ImageTransparency=ae.Topbar.ButtonsType=="Default"and 1 or.8,
Name="Outline"
},{
ae.Topbar.ButtonsType=="Default"and ab("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})or nil,
}),
ap
},true)

ab("Frame",{
Size=UDim2.new(0,28,0,28),
BackgroundTransparency=1,
Parent=ae.Topbar.ButtonsType~="Default"and ae.UIElements.Main.Main.Topbar.Right or nil,
LayoutOrder=al or 999
},{
ae.Topbar.ButtonsType~="Default"and aq or nil,
})

ae.TopBarButtons[100-al]={
Name=ai,
Object=aq
}

aa.AddSignal(aq.MouseButton1Click,function()
ak()
end)
aa.AddSignal(aq.MouseEnter,function()
if ae.Topbar.ButtonsType=="Default"then
aa.Tween(aq,.15,{ImageTransparency=.93}):Play()
aa.Tween(aq.Outline,.15,{ImageTransparency=.75}):Play()
else
aa.Tween(ap.ImageLabel,.1,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
aa.Tween(ap,.1,{Size=UDim2.new(0,ao or ae.TopBarButtonIconSize,0,ao or ae.TopBarButtonIconSize)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end)
aa.AddSignal(aq.InputEnded,function()
if ae.Topbar.ButtonsType=="Default"then
aa.Tween(aq,.1,{ImageTransparency=1}):Play()
aa.Tween(aq.Outline,.1,{ImageTransparency=1}):Play()
else
aa.Tween(ap.ImageLabel,.1,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
aa.Tween(ap,.1,{Size=UDim2.new(0,0,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end)

return aq
end
end

return ad end function a.C()

local aa=game:GetService"Players"
local ab=a.load'c'
local ac=ab.New
local ad=ab.Tween

local ae={}

function ae.Init(af,ag)
if not af.User then return end

local function GetUserThumb()local
ah=aa:GetUserThumbnailAsync(
af.User.Anonymous and 1 or aa.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)
return ah
end

local ah=ac("TextButton",{
Size=UDim2.new(0,
(af.UIElements.SideBarContainer.AbsoluteSize.X)-(af.UIPadding/2),
0,
42+(af.UIPadding)
),
Position=UDim2.new(0,af.UIPadding/2,1,-(af.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
Visible=af.User.Enabled or false,
},{
ab.NewRoundFrame(af.UICorner-(af.UIPadding/2),"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
ac("UIGradient",{
Rotation=78,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
ab.NewRoundFrame(af.UICorner-(af.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
ac("ImageLabel",{
Image=GetUserThumb(),
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=.93,
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0)
})
}),
ac("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
ac("TextLabel",{
Text=af.User.Anonymous and"Anonymous"or aa.LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="DisplayName"
}),
ac("TextLabel",{
Text=af.User.Anonymous and"anonymous"or aa.LocalPlayer.Name,
TextSize=15,
TextTransparency=.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="UserName"
}),
ac("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
})
}),
ac("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,af.UIPadding/2),
PaddingRight=UDim.new(0,af.UIPadding/2),
})
})
})

af.UIElements.UserIcon=ah

function af.User.Enable(ai)
af.User.Enabled=true
ad(af.UIElements.SideBarContainer,.25,{Size=UDim2.new(0,af.SideBarWidth,1,-af.Topbar.Height-42-(af.UIPadding*2))},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ah.Visible=true
end
function af.User.Disable(ai)
af.User.Enabled=false
ad(af.UIElements.SideBarContainer,.25,{Size=UDim2.new(0,af.SideBarWidth,1,-af.Topbar.Height)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ah.Visible=false
end
function af.User.SetAnonymous(ai,aj)
if aj~=false then aj=true end
af.User.Anonymous=aj
ah.UserIcon.ImageLabel.Image=GetUserThumb()
ah.UserIcon.Frame.DisplayName.Text=aj and"Anonymous"or aa.LocalPlayer.DisplayName
ah.UserIcon.Frame.UserName.Text=aj and"anonymous"or aa.LocalPlayer.Name
end

if af.User.Enabled then
af.User:Enable()
else
af.User:Disable()
end

if af.User.Callback then
ab.AddSignal(ah.MouseButton1Click,function()
af.User.Callback()
end)
ab.AddSignal(ah.MouseEnter,function()
ad(ah.UserIcon,0.04,{ImageTransparency=.95}):Play()
ad(ah.Outline,0.04,{ImageTransparency=.85}):Play()
end)
ab.AddSignal(ah.InputEnded,function()
ad(ah.UserIcon,0.04,{ImageTransparency=1}):Play()
ad(ah.Outline,0.04,{ImageTransparency=1}):Play()
end)
end

return ah
end

return ae end function a.D()

local aa={}

local ab=a.load'c'
local ac=ab.New local ad=
ab.Tween

local ae=(cloneref or clonereference or function(ae)return ae end)
ae(game:GetService"UserInputService")

function aa.New(af)
local ag={Button=nil}

local ah local ai=
af.Version or"v1.0"


local aj=ac("TextLabel",{
Text=af.Title,
TextSize=17,
RichText=true,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
TextColor3=Color3.fromRGB(240,240,240),
BackgroundTransparency=1,
AutomaticSize="X",
})


local ak=ac("Frame",{
Size=UDim2.new(0,38,0,38),
BackgroundTransparency=0.85,
BackgroundColor3=Color3.fromRGB(15,15,20),
Name="LogoContainer",
},{
ac("UICorner",{CornerRadius=UDim.new(0,9)})
})


local al=ac("Frame",{
Size=UDim2.new(0,34,0,34),
BackgroundTransparency=1,
Name="Drag",
},{
ac("ImageLabel",{
Image=ab.Icon"move"[1],
ImageRectOffset=ab.Icon"move"[2].ImageRectPosition,
ImageRectSize=ab.Icon"move"[2].ImageRectSize,
Size=UDim2.new(0,20,0,20),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={ImageColor3="Icon"},
ImageTransparency=0.3,
})
})

local am=ac("Frame",{
Size=UDim2.new(0,1,0,28),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=0.75,
Name="Divider"
})

local an=ac("UIScale",{Scale=1})


local ao=40

local ap=ac("Frame",{
Size=UDim2.new(0,0,0,0),

Position=af.MinibarPosition or UDim2.new(1,-120,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
Parent=af.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
ClipsDescendants=true,
})

local aq=ac("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
BackgroundTransparency=1,
Text="",
Name="OpenZone",
},{
ac("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
SortOrder=Enum.SortOrder.LayoutOrder,
}),
ak,
aj,
})

local ar=ac("Frame",{
Size=UDim2.new(0,0,0,ao),
AutomaticSize="X",
Parent=ap,
Active=false,

BackgroundTransparency=0.2,
BackgroundColor3=Color3.fromRGB(0,0,0),
ZIndex=99,
},{
an,
ac("UICorner",{CornerRadius=UDim.new(0,10)}),

ac("UIStroke",{
Thickness=1,
ApplyStrokeMode="Border",
Transparency=0.5,
ThemeTag={Color="Accent"}
}),

ac("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center",
SortOrder=Enum.SortOrder.LayoutOrder,
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),

aq,
am,
al,
})

ag.Button=ar


ab.AddSignal(ar:GetPropertyChangedSignal"AbsoluteSize",function()
local as=ar.AbsoluteSize
ap.Size=UDim2.new(0,as.X,0,as.Y)
end)


ab.AddSignal(aq.MouseButton1Click,function()
af:Open()
end)


local as=ab.Drag(ap,{al},function(as)
if not as then
af.MinibarPosition=ap.Position
end
end)

function ag.SetIcon(at,au)
if ah then ah:Destroy()end
if au then
ah=ab.Image(au,af.Title,0,af.Folder,"OpenButton",true,af.IconThemed)

ah.Size=UDim2.new(0,16,0,16)
ah.Position=UDim2.new(0.5,0,0.5,0)
ah.AnchorPoint=Vector2.new(0.5,0.5)
ah.Parent=ak
end
end

if af.Icon then ag:SetIcon(af.Icon)end

function ag.Visible(at,au,av)

ap.Visible=au
end

function ag.SetScale(at,au)
an.Scale=au
end

function ag.Edit(at,au)
local av={
Title=au.Title,
Icon=au.Icon,
Enabled=au.Enabled,
Position=au.Position,
OnlyIcon=au.OnlyIcon or false,
Draggable=au.Draggable~=false,
OnlyMobile=au.OnlyMobile,
CornerRadius=au.CornerRadius or UDim.new(0,10),
StrokeThickness=au.StrokeThickness or 1,
Scale=au.Scale or 1,
Color=au.Color
}

if av.Enabled==false then
af.IsOpenButtonEnabled=false
end

if not av.Draggable then
al.Visible=false
am.Visible=false
if as then as:Set(false)end
else
al.Visible=true
am.Visible=true
if as then as:Set(true)end
end

if av.Position then ap.Position=av.Position end
aj.Visible=not av.OnlyIcon

if av.Title then
aj.Text=av.Title
if ab.ChangeTranslationKey then
ab:ChangeTranslationKey(aj,av.Title)
end
end

if av.Icon then ag:SetIcon(av.Icon)end

local aw=ar:FindFirstChildWhichIsA"UIStroke"
if aw then
aw.Thickness=av.StrokeThickness
end

local ax=ar:FindFirstChildWhichIsA"UICorner"
if ax then ax.CornerRadius=av.CornerRadius end

ag:SetScale(av.Scale)
end

return ag
end

return aa end function a.E()

local aa={}

local ab=a.load'c'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah,ai,aj)
local ak={
Container=nil,
TooltipSize=16,

TooltipArrowSizeX=ai=="Small"and 16 or 24,
TooltipArrowSizeY=ai=="Small"and 6 or 9,

PaddingX=ai=="Small"and 12 or 14,
PaddingY=ai=="Small"and 7 or 9,

Radius=999,

TitleFrame=nil,
}

ah=ah or""
aj=aj~=false

local al=ac("TextLabel",{
AutomaticSize="XY",
TextWrapped=aj,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Text=ae,
TextSize=ai=="Small"and 15 or 17,
TextTransparency=1,
ThemeTag={
TextColor3="Tooltip"..ah.."Text",
}
})

ak.TitleFrame=al

local am=ac("UIScale",{
Scale=.9
})

local an=ac("Frame",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=af,

Visible=false
},{
ac("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
ac("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=ag,
Name="Arrow",
},{
ac("ImageLabel",{
Size=UDim2.new(0,ak.TooltipArrowSizeX,0,ak.TooltipArrowSizeY),
BackgroundTransparency=1,

Image="rbxassetid://105854070513330",
ThemeTag={
ImageColor3="Tooltip"..ah,
},
},{










}),
}),
ab.NewRoundFrame(ak.Radius,"Squircle",{
AutomaticSize="XY",
ThemeTag={
ImageColor3="Tooltip"..ah,
},
ImageTransparency=1,
Name="Background",
},{



ac("Frame",{



AutomaticSize="XY",
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,16),
}),
ac("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

al,
ac("UIPadding",{
PaddingTop=UDim.new(0,ak.PaddingY),
PaddingLeft=UDim.new(0,ak.PaddingX),
PaddingRight=UDim.new(0,ak.PaddingX),
PaddingBottom=UDim.new(0,ak.PaddingY),
}),
})
}),
am,
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
ak.Container=an

function ak.Open(ao)
an.Visible=true


ad(an.Background,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(an.Arrow.ImageLabel,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al,.2,{TextTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(am,.22,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function ak.Close(ao,ap)

ad(an.Background,.3,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(an.Arrow.ImageLabel,.2,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al,.3,{TextTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(am,.35,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.In):Play()

ap=ap~=false
if ap then
task.wait(.35)

an.Visible=false
an:Destroy()
end
end

return ak
end



return aa end function a.F()

local aa=a.load'c'
local ab=aa.New
local ac=aa.NewRoundFrame
local ad=aa.Tween

local ae=(cloneref or clonereference or function(ae)return ae end)


ae(game:GetService"UserInputService")


local function getElementPosition(af,ag)
if type(ag)~="number"or ag~=math.floor(ag)then
return nil,1
end






local ah=#af


if ah==0 or ag<1 or ag>ah then
return nil,2
end

local function isDelimiter(ai)
if ai==nil then return true end
local aj=ai.__type
return aj=="Divider"or aj=="Space"or aj=="Section"or aj=="Code"
end

if isDelimiter(af[ag])then
return nil,3
end

local function calculate(ai,aj)
if aj==1 then return"Squircle"end
if ai==1 then return"Squircle-TL-TR"end
if ai==aj then return"Squircle-BL-BR"end
return"Square"
end

local ai=1
local aj=0

for ak=1,ah do
local al=af[ak]
if isDelimiter(al)then
if ag>=ai and ag<=ak-1 then
local am=ag-ai+1
return calculate(am,aj)
end
ai=ak+1
aj=0
else
aj=aj+1
end
end


if ag>=ai and ag<=ah then
local ak=ag-ai+1
return calculate(ak,aj)
end

return nil,4
end


return function(af)
local ag={
Title=af.Title,
Desc=af.Desc or nil,
Hover=af.Hover,
Thumbnail=af.Thumbnail,
ThumbnailSize=af.ThumbnailSize or 80,
Image=af.Image,
IconThemed=af.IconThemed or false,
ImageSize=af.ImageSize or 30,
Color=af.Color,
Scalable=af.Scalable,
Parent=af.Parent,
Justify=af.Justify or"Between",
UIPadding=af.Window.ElementConfig.UIPadding,
UICorner=af.Window.ElementConfig.UICorner,
Size=af.Size or"Default",
UIElements={},

Index=af.Index
}

local ah=ag.Size=="Small"and-4 or ag.Size=="Large"and 4 or 0
local ai=ag.Size=="Small"and-4 or ag.Size=="Large"and 4 or 0

local aj=ag.ImageSize
local ak=ag.ThumbnailSize
local al=true


local am=0

local an
local ao
if ag.Thumbnail then
an=aa.Image(
ag.Thumbnail,
ag.Title,
af.Window.NewElements and ag.UICorner-11 or(ag.UICorner-4),
af.Window.Folder,
"Thumbnail",
false,
ag.IconThemed
)
an.Size=UDim2.new(1,0,0,ak)
end
if ag.Image then
ao=aa.Image(
ag.Image,
ag.Title,
af.Window.NewElements and ag.UICorner-11 or(ag.UICorner-4),
af.Window.Folder,
"Image",
ag.IconThemed,
not ag.Color and true or false,
"ElementIcon"
)
if typeof(ag.Color)=="string"then
ao.ImageLabel.ImageColor3=aa.GetTextColorForHSB(Color3.fromHex(aa.Colors[ag.Color]))
elseif typeof(ag.Color)=="Color3"then
ao.ImageLabel.ImageColor3=aa.GetTextColorForHSB(ag.Color)
end

ao.Size=UDim2.new(0,aj,0,aj)

am=aj
end

local function CreateText(ap,aq)
local ar=typeof(ag.Color)=="string"
and aa.GetTextColorForHSB(Color3.fromHex(aa.Colors[ag.Color]))
or typeof(ag.Color)=="Color3"
and aa.GetTextColorForHSB(ag.Color)

return ab("TextLabel",{
BackgroundTransparency=1,
Text=ap or"",
TextSize=aq=="Desc"and 15 or 17,
TextXAlignment="Left",
ThemeTag={
TextColor3=not ag.Color and("Element"..aq)or nil,
},
TextColor3=ag.Color and ar or nil,
TextTransparency=aq=="Desc"and.3 or 0,
TextWrapped=true,
Size=UDim2.new(ag.Justify=="Between"and 1 or 0,0,0,0),
AutomaticSize=ag.Justify=="Between"and"Y"or"XY",
FontFace=Font.new(aa.Font,aq=="Desc"and Enum.FontWeight.Medium or Enum.FontWeight.SemiBold)
})
end

local ap=CreateText(ag.Title,"Title")
local aq=CreateText(ag.Desc,"Desc")
if not ag.Title or ag.Title==""then
aq.Visible=false
end
if not ag.Desc or ag.Desc==""then
aq.Visible=false
end

ag.UIElements.Title=ap
ag.UIElements.Desc=aq

ag.UIElements.Container=ab("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ab("UIListLayout",{
Padding=UDim.new(0,ag.UIPadding),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment=ag.Justify=="Between"and"Left"or"Center",
}),
an,
ab("Frame",{
Size=UDim2.new(
ag.Justify=="Between"and 1 or 0,
ag.Justify=="Between"and-af.TextOffset or 0,
0,
0
),
AutomaticSize=ag.Justify=="Between"and"Y"or"XY",
BackgroundTransparency=1,
Name="TitleFrame",
},{
ab("UIListLayout",{
Padding=UDim.new(0,ag.UIPadding),
FillDirection="Horizontal",
VerticalAlignment=af.Window.NewElements and(ag.Justify=="Between"and"Top"or"Center")or"Center",
HorizontalAlignment=ag.Justify~="Between"and ag.Justify or"Center",
}),
ao,
ab("Frame",{
BackgroundTransparency=1,
AutomaticSize=ag.Justify=="Between"and"Y"or"XY",
Size=UDim2.new(
ag.Justify=="Between"and 1 or 0,
ag.Justify=="Between"and(ao and-am-ag.UIPadding or-am)or 0,
1,
0
),
Name="TitleFrame",
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,(af.Window.NewElements and ag.UIPadding/2 or 0)+ai),
PaddingLeft=UDim.new(0,(af.Window.NewElements and ag.UIPadding/2 or 0)+ah),
PaddingRight=UDim.new(0,(af.Window.NewElements and ag.UIPadding/2 or 0)+ah),
PaddingBottom=UDim.new(0,(af.Window.NewElements and ag.UIPadding/2 or 0)+ai),
}),
ab("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ap,
aq
}),
})
})






local ar=aa.Image(
"lock",
"lock",
0,
af.Window.Folder,
"Lock",
false
)
ar.Size=UDim2.new(0,20,0,20)
ar.ImageLabel.ImageColor3=Color3.new(1,1,1)
ar.ImageLabel.ImageTransparency=.4

local as=ab("TextLabel",{
Text="Locked",
TextSize=18,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
AutomaticSize="XY",
BackgroundTransparency=1,
TextColor3=Color3.new(1,1,1),
TextTransparency=.05,
})

local at=ab("Frame",{
Size=UDim2.new(1,ag.UIPadding*2,1,ag.UIPadding*2),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ZIndex=aa.ZIndex.Elements,
})

local au,av=ac(ag.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=.25,
ImageColor3=Color3.new(0,0,0),
Visible=false,
Active=false,
Parent=at,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8)
}),
ar,as
},nil,true)

local aw,ax=ac(ag.UICorner,"Squircle-Outline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=at,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8)
}),
},nil,true)

local ay,az=ac(ag.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=at,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8)
}),
},nil,true)


local aA,aB=ac(ag.UICorner,"Squircle-Outline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=at,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8)
}),
ab("UIGradient",{
Name="HoverGradient",
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1))
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.25,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.75,0.9),
NumberSequenceKeypoint.new(1,1)
},
}),
},nil,true)

local b,d=ac(ag.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=at,
},{
ab("UIGradient",{
Name="HoverGradient",
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1))
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.25,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.75,0.9),
NumberSequenceKeypoint.new(1,1)
},
}),
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8)
}),
},nil,true)

local f,g=ac(ag.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ImageTransparency=ag.Color and.05 or.93,



Parent=af.Parent,
ThemeTag={
ImageColor3=not ag.Color and"ElementBackground"or nil
},
ImageColor3=ag.Color and
(
typeof(ag.Color)=="string"
and Color3.fromHex(aa.Colors[ag.Color])
or typeof(ag.Color)=="Color3"
and ag.Color
)or nil
},{
ag.UIElements.Container,
at,
ab("UIPadding",{
PaddingTop=UDim.new(0,ag.UIPadding),
PaddingLeft=UDim.new(0,ag.UIPadding),
PaddingRight=UDim.new(0,ag.UIPadding),
PaddingBottom=UDim.new(0,ag.UIPadding),
}),
},true,true)

ag.UIElements.Main=f
ag.UIElements.Locked=au

if ag.Hover then
aa.AddSignal(f.MouseEnter,function()
if al then
ad(f,.15,{ImageTransparency=ag.Color and.15 or.9}):Play()
ad(b,.15,{ImageTransparency=.92}):Play()
ad(aA,.15,{ImageTransparency=.85}):Play()
aa.AddSignal(f.MouseMoved,function(h,j)
local l=((h-f.AbsolutePosition.X)/f.AbsoluteSize.X)-0.5
b.HoverGradient.Offset=Vector2.new(l,0)
aA.HoverGradient.Offset=Vector2.new(l,0)
end)
end
end)
aa.AddSignal(f.InputEnded,function()
if al then
ad(f,.15,{ImageTransparency=ag.Color and.05 or.93}):Play()
ad(b,.15,{ImageTransparency=1}):Play()
ad(aA,.15,{ImageTransparency=1}):Play()
end
end)
end

function ag.SetTitle(h,j)
ag.Title=j
ap.Text=j
end

function ag.SetDesc(h,j)
ag.Desc=j
aq.Text=j or""
if not j then
aq.Visible=false
elseif not aq.Visible then
aq.Visible=true
end
end


function ag.Colorize(h,j,l)
if ag.Color then
j[l]=typeof(ag.Color)=="string"
and aa.GetTextColorForHSB(Color3.fromHex(aa.Colors[ag.Color]))
or typeof(ag.Color)=="Color3"
and aa.GetTextColorForHSB(ag.Color)
or nil
end
end

if af.ElementTable then
aa.AddSignal(ap:GetPropertyChangedSignal"Text",function()
if ag.Title~=ap.Text then
ag:SetTitle(ap.Text)
af.ElementTable.Title=ap.Text
end
end)
aa.AddSignal(aq:GetPropertyChangedSignal"Text",function()
if ag.Desc~=aq.Text then
ag:SetDesc(aq.Text)
af.ElementTable.Desc=aq.Text
end
end)
end





function ag.SetThumbnail(h,j,l)
ag.Thumbnail=j
if l then
ag.ThumbnailSize=l
ak=l
end

if an then
if j then
an:Destroy()
an=aa.Image(
j,
ag.Title,
ag.UICorner-3,
af.Window.Folder,
"Thumbnail",
false,
ag.IconThemed
)
an.Size=UDim2.new(1,0,0,ak)
an.Parent=ag.UIElements.Container
local m=ag.UIElements.Container:FindFirstChild"UIListLayout"
if m then
an.LayoutOrder=-1
end
else
an.Visible=false
end
else
if j then
an=aa.Image(
j,
ag.Title,
ag.UICorner-3,
af.Window.Folder,
"Thumbnail",
false,
ag.IconThemed
)
an.Size=UDim2.new(1,0,0,ak)
an.Parent=ag.UIElements.Container
local m=ag.UIElements.Container:FindFirstChild"UIListLayout"
if m then
an.LayoutOrder=-1
end
end
end
end

function ag.SetImage(h,j,l)
ag.Image=j
if l then
ag.ImageSize=l
aj=l
end

if j then
ao=aa.Image(
j,
ag.Title,
ag.UICorner-3,
af.Window.Folder,
"Image",
not ag.Color and true or false
)

if typeof(ag.Color)=="string"then
ao.ImageLabel.ImageColor3=aa.GetTextColorForHSB(Color3.fromHex(aa.Colors[ag.Color]))
elseif typeof(ag.Color)=="Color3"then
ao.ImageLabel.ImageColor3=aa.GetTextColorForHSB(ag.Color)
end

ao.Visible=true

ao.Size=UDim2.new(0,aj,0,aj)
am=aj

else
if ao then
ao.Visible=true
end
am=0
end

ag.UIElements.Container.TitleFrame.TitleFrame.Size=UDim2.new(1,-am,1,0)
end

function ag.Destroy(h)
f:Destroy()
end


function ag.Lock(h,j)
al=false
au.Active=true
au.Visible=true
as.Text=j or"Locked"
end

function ag.Unlock(h)
al=true
au.Active=false
au.Visible=false
end

function ag.Highlight(h)
local j=ab("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1))
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.1,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.9,0.9),
NumberSequenceKeypoint.new(1,1)
},
Rotation=0,
Offset=Vector2.new(-1,0),
Parent=aw
})

local l=ab("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1))
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.15,0.8),
NumberSequenceKeypoint.new(0.5,0.1),
NumberSequenceKeypoint.new(0.85,0.8),
NumberSequenceKeypoint.new(1,1)
},
Rotation=0,
Offset=Vector2.new(-1,0),
Parent=ay
})

aw.ImageTransparency=0.65
ay.ImageTransparency=0.88

ad(j,0.75,{
Offset=Vector2.new(1,0)
}):Play()

ad(l,0.75,{
Offset=Vector2.new(1,0)
}):Play()


task.spawn(function()
task.wait(.75)
aw.ImageTransparency=1
ay.ImageTransparency=1
j:Destroy()
l:Destroy()
end)
end


function ag.UpdateShape(h)
if af.Window.NewElements then
local j
if af.ParentConfig.ParentType=="Group"then
j="Squircle"
else
j=getElementPosition(h.Elements,ag.Index)
end

if j and f then
g:SetType(j)
av:SetType(j)
az:SetType(j)
ax:SetType(j.."-Outline")
d:SetType(j)
aB:SetType(j.."-Outline")
end
end
end





return ag
end end function a.G()

local aa=a.load'c'
local ab=aa.New

local ac={}

local ad=a.load'l'.New

function ac.New(ae,af)
af.Hover=false
af.TextOffset=0
af.ParentConfig=af
af.IsButtons=af.Buttons and#af.Buttons>0 and true or false

local ag={
__type="Paragraph",
Title=af.Title or"Paragraph",
Desc=af.Desc or nil,

Locked=af.Locked or false,
}
local ah=a.load'F'(af)

ag.ParagraphFrame=ah
if af.Buttons and#af.Buttons>0 then
local ai=ab("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=ah.UIElements.Container
},{
ab("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
})
})


for aj,ak in next,af.Buttons do
local al=ad(ak.Title,ak.Icon,ak.Callback,"White",ai,nil,nil,af.Window.NewElements and 999 or 10)
al.Size=UDim2.new(1,0,0,38)

end
end

return ag.__type,ag

end

return ac end function a.H()

local aa=a.load'c'local ab=
aa.New

local ac={}

function ac.New(ad,ae)
local af={
__type="Button",
Title=ae.Title or"Button",
Desc=ae.Desc or nil,
Icon=ae.Icon or"mouse-pointer-click",
IconThemed=ae.IconThemed or false,
Color=ae.Color,
Justify=ae.Justify or"Between",
IconAlign=ae.IconAlign or"Right",
Locked=ae.Locked or false,
LockedTitle=ae.LockedTitle,
Callback=ae.Callback or function()end,
UIElements={}
}

local ag=true

af.ButtonFrame=a.load'F'{
Title=af.Title,
Desc=af.Desc,
Parent=ae.Parent,




Window=ae.Window,
Color=af.Color,
Justify=af.Justify,
TextOffset=20,
Hover=true,
Scalable=true,
Tab=ae.Tab,
Index=ae.Index,
ElementTable=af,
ParentConfig=ae,
Size=ae.Size,
}














af.UIElements.ButtonIcon=aa.Image(
af.Icon,
af.Icon,
0,
ae.Window.Folder,
"Button",
not af.Color and true or nil,
af.IconThemed
)

af.UIElements.ButtonIcon.Size=UDim2.new(0,20,0,20)
af.UIElements.ButtonIcon.Parent=af.Justify=="Between"and af.ButtonFrame.UIElements.Main or af.ButtonFrame.UIElements.Container.TitleFrame
af.UIElements.ButtonIcon.LayoutOrder=af.IconAlign=="Left"and-99999 or 99999
af.UIElements.ButtonIcon.AnchorPoint=Vector2.new(1,0.5)
af.UIElements.ButtonIcon.Position=UDim2.new(1,0,0.5,0)

af.ButtonFrame:Colorize(af.UIElements.ButtonIcon.ImageLabel,"ImageColor3")

function af.Lock(ah)
af.Locked=true
ag=false
return af.ButtonFrame:Lock(af.LockedTitle)
end
function af.Unlock(ah)
af.Locked=false
ag=true
return af.ButtonFrame:Unlock()
end

if af.Locked then
af:Lock()
end

local function ClickAnim(ah)
if not ag then return end
aa.Tween(af.ButtonFrame.UIElements.Container,.1,{
Size=ah and UDim2.new(1,-6,1,-2)or UDim2.new(1,0,1,0)
}):Play()
end

aa.AddSignal(af.ButtonFrame.UIElements.Main.MouseButton1Down,function()
ClickAnim(true)
end)
aa.AddSignal(af.ButtonFrame.UIElements.Main.MouseButton1Up,function()
ClickAnim(false)
end)
aa.AddSignal(af.ButtonFrame.UIElements.Main.MouseLeave,function()
ClickAnim(false)
end)

aa.AddSignal(af.ButtonFrame.UIElements.Main.MouseButton1Click,function()
if ag then
task.spawn(function()
aa.SafeCallback(af.Callback)
end)
end
end)
return af.__type,af
end

return ac end function a.I()

local aa={}

local ab=a.load'c'
local ac=ab.New
local ad=ab.Tween

local ae=game:GetService"UserInputService"

function aa.New(af,ag,ah,ai,aj,ak,al)
local am={}

local an=12
local ao
if ag and ag~=""then
ao=ac("ImageLabel",{
Size=UDim2.new(0,13,0,13),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(ag)[1],
ImageRectOffset=ab.Icon(ag)[2].ImageRectPosition,
ImageRectSize=ab.Icon(ag)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local ap=ac("Frame",{
Size=UDim2.new(0,2,0,26),
BackgroundTransparency=1,
Parent=ai,
})

local aq=ab.NewRoundFrame(an,"Squircle",{
ImageTransparency=.85,
ThemeTag={
ImageColor3="Text"
},
Parent=ap,
Size=UDim2.new(0,ak and(52)or(40.8),0,24),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(0,0,0.5,0),
},{
ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Toggle",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(an,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ac("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),


ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(0,ak and 30 or 20,0,20),
Position=UDim2.new(0,2,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=1,
Name="Frame",
},{
ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0,
ThemeTag={
ImageColor3="ToggleBar",
},
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Bar"
},{
ab.NewRoundFrame(an,"Glass-1",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
Name="Highlight",
ImageTransparency=0.4,
},{













}),
ao,
ac("UIScale",{
Scale=1,
})
}),
})
})

local ar
local as

local at=ak and 30 or 20
local au=aq.Size.X.Offset

function am.Set(av,aw,ax,ay)
if not ay then
if aw then
ad(aq.Frame,0.25,{
Position=UDim2.new(0,au-at-2,0.5,0),
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
else
ad(aq.Frame,0.25,{
Position=UDim2.new(0,2,0.5,0),
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
end
else
if aw then
aq.Frame.Position=UDim2.new(0,au-at-2,0.5,0)
else
aq.Frame.Position=UDim2.new(0,2,0.5,0)
end
end

if aw then
ad(aq.Layer,0.1,{
ImageTransparency=0,
}):Play()

if ao then
ad(ao,0.1,{
ImageTransparency=0,
}):Play()
end
else
ad(aq.Layer,0.1,{
ImageTransparency=1,
}):Play()

if ao then
ad(ao,0.1,{
ImageTransparency=1,
}):Play()
end
end

ax=ax~=false

task.spawn(function()
if aj and ax then
ab.SafeCallback(aj,aw)
end
end)
end


function am.Animate(av,aw,ax)
if not al.Window.IsToggleDragging then
al.Window.IsToggleDragging=true

local ay=aw.Position.X
local az=aw.Position.Y
local aA=aq.Frame.Position.X.Offset
local aB=false

ad(aq.Frame.Bar.UIScale,0.28,{Scale=1.5},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(aq.Frame.Bar,0.28,{ImageTransparency=.85},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

if ar then
ar:Disconnect()
end

ar=ae.InputChanged:Connect(function(b)
if al.Window.IsToggleDragging and(b.UserInputType==Enum.UserInputType.MouseMovement or b.UserInputType==Enum.UserInputType.Touch)then
if aB then
return
end

local d=math.abs(b.Position.X-ay)
local f=math.abs(b.Position.Y-az)

if f>d and f>10 then
aB=true
al.Window.IsToggleDragging=false

if ar then
ar:Disconnect()
ar=nil
end
if as then
as:Disconnect()
as=nil
end

ad(aq.Frame,0.15,{
Position=UDim2.new(0,aA,0.5,0)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ad(aq.Frame.Bar.UIScale,0.23,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(aq.Frame.Bar,0.23,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
return
end

local g=b.Position.X-ay
local h=math.max(2,math.min(aA+g,au-at-2))local j=

(aq.Frame.Position.X.Offset-2)/(au-at-4)

ad(aq.Frame,0.05,{
Position=UDim2.new(0,h,0.5,0)
},Enum.EasingStyle.Linear,Enum.EasingDirection.Out):Play()





end
end)

if as then
as:Disconnect()
end

as=ae.InputEnded:Connect(function(b)
if al.Window.IsToggleDragging and(b.UserInputType==Enum.UserInputType.MouseButton1 or b.UserInputType==Enum.UserInputType.Touch)then
al.Window.IsToggleDragging=false

if ar then
ar:Disconnect()
ar=nil
end

if as then
as:Disconnect()
as=nil
end

if aB then
return
end

local d=aq.Frame.Position.X.Offset
local f=math.abs(b.Position.X-ay)

if f<10 then
local g=not ax.Value
ax:Set(g,true,false)
else
local g=d+at/2
local h=au/2
local j=g>h
ax:Set(j,true,false)
end

ad(aq.Frame.Bar.UIScale,0.23,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(aq.Frame.Bar,0.23,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end)
end
end

return ap,am
end

return aa end function a.J()

local aa={}

local ab=a.load'c'local ac=
ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah,ai,aj)
local ak={}

af=af or"sfsymbols:checkmark"

local al=9

local am=ab.Image(
af,
af,
0,
(aj and aj.Window.Folder or"Temp"),
"Checkbox",
true,
false,
"CheckboxIcon"
)
am.Size=UDim2.new(1,-26+ag,1,-26+ag)
am.AnchorPoint=Vector2.new(0.5,0.5)
am.Position=UDim2.new(0.5,0,0.5,0)


local an=ab.NewRoundFrame(al,"Squircle",{
ImageTransparency=.85,
ThemeTag={
ImageColor3="Text"
},
Parent=ah,
Size=UDim2.new(0,26,0,26),
},{
ab.NewRoundFrame(al,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Checkbox",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(al,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ThemeTag={
ImageColor3="CheckboxBorder",
ImageTransparency="CheckboxBorderTransparency",
},
},{







}),

am,
})

function ak.Set(ao,ap)
if ap then
ad(an.Layer,0.06,{
ImageTransparency=0,
}):Play()



ad(am.ImageLabel,0.06,{
ImageTransparency=0,
}):Play()
else
ad(an.Layer,0.05,{
ImageTransparency=1,
}):Play()



ad(am.ImageLabel,0.06,{
ImageTransparency=1,
}):Play()
end

task.spawn(function()
if ai then
ab.SafeCallback(ai,ap)
end
end)
end

return an,ak
end


return aa end function a.K()

local aa=a.load'c'local ab=
aa.New local ac=
aa.Tween

local ad=a.load'I'.New
local ae=a.load'J'.New

local af={}

function af.New(ag,ah)
local ai={
__type="Toggle",
Title=ah.Title or"Toggle",
Desc=ah.Desc or nil,
Locked=ah.Locked or false,
LockedTitle=ah.LockedTitle,
Value=ah.Value,
Icon=ah.Icon or nil,
IconSize=ah.IconSize or 23,
Type=ah.Type or"Toggle",
Callback=ah.Callback or function()end,
UIElements={}
}
ai.ToggleFrame=a.load'F'{
Title=ai.Title,
Desc=ai.Desc,




Window=ah.Window,
Parent=ah.Parent,
TextOffset=(52),
Hover=true,
Tab=ah.Tab,
Index=ah.Index,
ElementTable=ai,
ParentConfig=ah,
}

local aj=true

if ai.Value==nil then
ai.Value=false
end



function ai.Lock(ak)
ai.Locked=true
aj=false
return ai.ToggleFrame:Lock(ai.LockedTitle)
end
function ai.Unlock(ak)
ai.Locked=false
aj=true
return ai.ToggleFrame:Unlock()
end

if ai.Locked then
ai:Lock()
end

local ak=ai.Value

local al,am
if ai.Type=="Toggle"then
al,am=ad(ak,ai.Icon,ai.IconSize,ai.ToggleFrame.UIElements.Main,ai.Callback,ah.Window.NewElements,ah)
elseif ai.Type=="Checkbox"then
al,am=ae(ak,ai.Icon,ai.IconSize,ai.ToggleFrame.UIElements.Main,ai.Callback,ah)
else
error("Unknown Toggle Type: "..tostring(ai.Type))
end

al.AnchorPoint=Vector2.new(1,ah.Window.NewElements and 0 or 0.5)
al.Position=UDim2.new(1,0,ah.Window.NewElements and 0 or 0.5,0)

function ai.Set(an,ao,ap,aq)
if aj then
am:Set(ao,ap,aq or false)
ak=ao
ai.Value=ao
end
end

ai:Set(ak,false,ah.Window.NewElements)


if ah.Window.NewElements and am.Animate then
aa.AddSignal(ai.ToggleFrame.UIElements.Main.InputBegan,function(an)
if not ah.Window.IsToggleDragging and an.UserInputType==Enum.UserInputType.MouseButton1 or an.UserInputType==Enum.UserInputType.Touch then
am:Animate(an,ai)
end
end)






else
aa.AddSignal(ai.ToggleFrame.UIElements.Main.MouseButton1Click,function()
ai:Set(not ai.Value,nil,ah.Window.NewElements)
end)
end

return ai.__type,ai
end

return af end function a.L()

local aa=(cloneref or clonereference or function(aa)return aa end)


local ac=aa(game:GetService"UserInputService")
local ad=aa(game:GetService"RunService")

local ae=a.load'c'
local af=ae.New
local ag=ae.Tween


local ah={}

local ai=false

function ah.New(aj,ak)
local al={
__type="Slider",
Title=ak.Title or nil,
Desc=ak.Desc or nil,
Locked=ak.Locked or nil,
LockedTitle=ak.LockedTitle,
Value=ak.Value or{},
Icons=ak.Icons or nil,
IsTooltip=ak.IsTooltip or false,
IsTextbox=ak.IsTextbox,
Step=ak.Step or 1,
Callback=ak.Callback or function()end,
UIElements={},
IsFocusing=false,

Width=ak.Width or 130,
TextBoxWidth=ak.Window.NewElements and 40 or 30,
ThumbSize=13,
IconSize=26,
}
if al.Icons=={}then
al.Icons={
From="sfsymbols:sunMinFill",
To="sfsymbols:sunMaxFill",
}
end
if al.IsTextbox==nil and al.Title==nil then al.IsTextbox=false else al.IsTextbox=al.IsTextbox~=false end

local am
local an
local ao
local ap=al.Value.Default or al.Value.Min or 0

local aq=ap
local ar=(ap-(al.Value.Min or 0))/((al.Value.Max or 100)-(al.Value.Min or 0))

local as=true
local at=al.Step%1~=0

local function FormatValue(au)
if at then
return tonumber(string.format("%.2f",au))
end
return math.floor(au+0.5)
end

local function CalculateValue(au)
if at then
return math.floor(au/al.Step+0.5)*al.Step
else
return math.floor(au/al.Step+0.5)*al.Step
end
end

local au,av
local aw=32
if al.Icons then
if al.Icons.From then
au=ae.Image(
al.Icons.From,
al.Icons.From,
0,
ak.Window.Folder,
"SliderIconFrom",
true,
true,
"SliderIconFrom"
)
au.Size=UDim2.new(0,al.IconSize,0,al.IconSize)
aw=aw+al.IconSize-2
end
if al.Icons.To then
av=ae.Image(
al.Icons.To,
al.Icons.To,
0,
ak.Window.Folder,
"SliderIconTo",
true,
true,
"SliderIconTo"
)
av.Size=UDim2.new(0,al.IconSize,0,al.IconSize)
aw=aw+al.IconSize-2
end
end
al.SliderFrame=a.load'F'{
Title=al.Title,
Desc=al.Desc,
Parent=ak.Parent,
TextOffset=al.Width,
Hover=true,
Tab=ak.Tab,
Index=ak.Index,
Window=ak.Window,
ElementTable=al,
ParentConfig=ak,
}


al.UIElements.SliderIcon=ae.NewRoundFrame(99,"Squircle",{
ImageTransparency=.95,
Size=UDim2.new(1,not al.IsTextbox and-aw or(-al.TextBoxWidth-8),0,4),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Frame",
ThemeTag={
ImageColor3="Text",
},
},{
ae.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(ar,0,1,0),
ImageTransparency=.1,
ThemeTag={
ImageColor3="Slider",
},
},{
ae.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,ak.Window.NewElements and(al.ThumbSize*2)or(al.ThumbSize+2),0,ak.Window.NewElements and(al.ThumbSize+4)or(al.ThumbSize+2)),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="SliderThumb",
},
Name="Thumb",
},{
ae.NewRoundFrame(99,"Glass-1",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
Name="Highlight",
ImageTransparency=.6,
},{













}),
})
})
})

al.UIElements.SliderContainer=af("Frame",{
Size=UDim2.new(al.Title==nil and 1 or 0,al.Title==nil and 0 or al.Width,0,0),
AutomaticSize="Y",
Position=UDim2.new(1,al.IsTextbox and(ak.Window.NewElements and-16 or 0)or 0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Parent=al.SliderFrame.UIElements.Main,
},{
af("UIListLayout",{
Padding=UDim.new(0,al.Title~=nil and 8 or 12),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=al.Icons and(al.Icons.From and(al.Icons.To and"Center"or"Left")or al.Icons.To and"Right")or"Center",
}),
au,
al.UIElements.SliderIcon,
av,
af("TextBox",{
Size=UDim2.new(0,al.TextBoxWidth,0,0),
TextXAlignment="Left",
Text=FormatValue(ap),
ThemeTag={
TextColor3="Text"
},
TextTransparency=.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
Visible=al.IsTextbox,
})
})

local ax
if al.IsTooltip then
ax=a.load'E'.New(ap,al.UIElements.SliderIcon.Frame.Thumb,true,"Secondary","Small",false)
ax.Container.AnchorPoint=Vector2.new(0.5,1)
ax.Container.Position=UDim2.new(0.5,0,0,-8)
end

function al.Lock(ay)
al.Locked=true
as=false
return al.SliderFrame:Lock(al.LockedTitle)
end
function al.Unlock(ay)
al.Locked=false
as=true
return al.SliderFrame:Unlock()
end

if al.Locked then
al:Lock()
end


local ay=ak.Tab.UIElements.ContainerFrame

function al.Set(az,aA,aB)
if as then
if not al.IsFocusing and not ai and(not aB or(aB.UserInputType==Enum.UserInputType.MouseButton1 or aB.UserInputType==Enum.UserInputType.Touch))then
if aB then
am=(aB.UserInputType==Enum.UserInputType.Touch)
ay.ScrollingEnabled=false
ai=true

local b=am and aB.Position.X or ac:GetMouseLocation().X
local d=math.clamp((b-al.UIElements.SliderIcon.AbsolutePosition.X)/al.UIElements.SliderIcon.AbsoluteSize.X,0,1)
aA=CalculateValue(al.Value.Min+d*(al.Value.Max-al.Value.Min))
aA=math.clamp(aA,al.Value.Min or 0,al.Value.Max or 100)

if aA~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(d,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aA)
if ax then ax.TitleFrame.Text=FormatValue(aA)end
al.Value.Default=FormatValue(aA)
aq=aA
ae.SafeCallback(al.Callback,FormatValue(aA))
end

an=ad.RenderStepped:Connect(function()
local f=am and aB.Position.X or ac:GetMouseLocation().X
local g=math.clamp((f-al.UIElements.SliderIcon.AbsolutePosition.X)/al.UIElements.SliderIcon.AbsoluteSize.X,0,1)
aA=CalculateValue(al.Value.Min+g*(al.Value.Max-al.Value.Min))

if aA~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(g,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aA)
if ax then ax.TitleFrame.Text=FormatValue(aA)end
al.Value.Default=FormatValue(aA)
aq=aA
ae.SafeCallback(al.Callback,FormatValue(aA))
end
end)


ao=ac.InputEnded:Connect(function(f)
if(f.UserInputType==Enum.UserInputType.MouseButton1 or f.UserInputType==Enum.UserInputType.Touch)and aB==f then
an:Disconnect()
ao:Disconnect()
ai=false
ay.ScrollingEnabled=true

if ak.Window.NewElements then
ag(al.UIElements.SliderIcon.Frame.Thumb,.2,{ImageTransparency=0,Size=UDim2.new(0,ak.Window.NewElements and(al.ThumbSize*2)or(al.ThumbSize+2),0,ak.Window.NewElements and(al.ThumbSize+4)or(al.ThumbSize+2))},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end
if ax then ax:Close(false)end
end
end)
else
aA=math.clamp(aA,al.Value.Min or 0,al.Value.Max or 100)

local b=math.clamp((aA-(al.Value.Min or 0))/((al.Value.Max or 100)-(al.Value.Min or 0)),0,1)
aA=CalculateValue(al.Value.Min+b*(al.Value.Max-al.Value.Min))

if aA~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(b,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aA)
if ax then ax.TitleFrame.Text=FormatValue(aA)end
al.Value.Default=FormatValue(aA)
aq=aA
ae.SafeCallback(al.Callback,FormatValue(aA))
end
end
end
end
end

function al.SetMax(az,aA)
al.Value.Max=aA

local aB=tonumber(al.Value.Default)or aq
if aB>aA then
al:Set(aA)
else
local b=math.clamp((aB-(al.Value.Min or 0))/(aA-(al.Value.Min or 0)),0,1)
ag(al.UIElements.SliderIcon.Frame,0.1,{Size=UDim2.new(b,0,1,0)}):Play()
end
end

function al.SetMin(az,aA)
al.Value.Min=aA

local aB=tonumber(al.Value.Default)or aq
if aB<aA then
al:Set(aA)
else
local b=math.clamp((aB-aA)/((al.Value.Max or 100)-aA),0,1)
ag(al.UIElements.SliderIcon.Frame,0.1,{Size=UDim2.new(b,0,1,0)}):Play()
end
end

ae.AddSignal(al.UIElements.SliderContainer.TextBox.FocusLost,function(az)
if az then
local aA=tonumber(al.UIElements.SliderContainer.TextBox.Text)
if aA then
al:Set(aA)
else
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aq)
if ax then ax.TitleFrame.Text=FormatValue(aq)end
end
end
end)

ae.AddSignal(al.UIElements.SliderContainer.InputBegan,function(az)
if al.Locked or ai then
return
end

al:Set(ap,az)

if az.UserInputType==Enum.UserInputType.MouseButton1 or az.UserInputType==Enum.UserInputType.Touch then

if ak.Window.NewElements then
ag(al.UIElements.SliderIcon.Frame.Thumb,.24,{ImageTransparency=.85,Size=UDim2.new(0,(ak.Window.NewElements and(al.ThumbSize*2)or(al.ThumbSize))+8,0,al.ThumbSize+8)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
if ax then ax:Open()end

end
end)

return al.__type,al
end

return ah end function a.M()

local aa=(cloneref or clonereference or function(aa)return aa end)

local ac=aa(game:GetService"UserInputService")

local ad=a.load'c'
local ae=ad.New local af=
ad.Tween

local ag={
UICorner=6,
UIPadding=8,
}

local ah=a.load'w'.New

function ag.New(ai,aj)
local function NormalizeKeyCode(ak)
if typeof(ak)=="EnumItem"then
return ak.Name
elseif type(ak)=="string"then
return ak
else
return"F"
end
end

local ak={
__type="Keybind",
Title=aj.Title or"Keybind",
Desc=aj.Desc or nil,
Locked=aj.Locked or false,
LockedTitle=aj.LockedTitle,
Value=NormalizeKeyCode(aj.Value)or"F",
Callback=aj.Callback or function()end,
CanChange=aj.CanChange or true,
Picking=false,
UIElements={},
}

local al=true

ak.KeybindFrame=a.load'F'{
Title=ak.Title,
Desc=ak.Desc,
Parent=aj.Parent,
TextOffset=85,
Hover=ak.CanChange,
Tab=aj.Tab,
Index=aj.Index,
Window=aj.Window,
ElementTable=ak,
ParentConfig=aj,
}

ak.UIElements.Keybind=ah(ak.Value,nil,ak.KeybindFrame.UIElements.Main,nil,aj.Window.NewElements and 12 or 10)

ak.UIElements.Keybind.Size=UDim2.new(
0,24
+ak.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
ak.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
ak.UIElements.Keybind.Position=UDim2.new(1,0,0.5,0)

ae("UIScale",{
Parent=ak.UIElements.Keybind,
Scale=.85,
})

ad.AddSignal(ak.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds",function()
ak.UIElements.Keybind.Size=UDim2.new(
0,24
+ak.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
end)

function ak.Lock(am)
ak.Locked=true
al=false
return ak.KeybindFrame:Lock(ak.LockedTitle)
end
function ak.Unlock(am)
ak.Locked=false
al=true
return ak.KeybindFrame:Unlock()
end

function ak.Set(am,an)
local ao=NormalizeKeyCode(an)
ak.Value=ao
ak.UIElements.Keybind.Frame.Frame.TextLabel.Text=ao
end

if ak.Locked then
ak:Lock()
end

ad.AddSignal(ak.KeybindFrame.UIElements.Main.MouseButton1Click,function()
if al then
if ak.CanChange then
ak.Picking=true
ak.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."

task.wait(0.2)

local am
am=ac.InputBegan:Connect(function(an)
local ao

if an.UserInputType==Enum.UserInputType.Keyboard then
ao=an.KeyCode.Name
elseif an.UserInputType==Enum.UserInputType.MouseButton1 then
ao="MouseLeft"
elseif an.UserInputType==Enum.UserInputType.MouseButton2 then
ao="MouseRight"
end

local ap
ap=ac.InputEnded:Connect(function(aq)
if aq.KeyCode.Name==ao or ao=="MouseLeft"and aq.UserInputType==Enum.UserInputType.MouseButton1 or ao=="MouseRight"and aq.UserInputType==Enum.UserInputType.MouseButton2 then
ak.Picking=false

ak.UIElements.Keybind.Frame.Frame.TextLabel.Text=ao
ak.Value=ao

am:Disconnect()
ap:Disconnect()
end
end)
end)
end
end
end)

ad.AddSignal(ac.InputBegan,function(am,an)
if ac:GetFocusedTextBox()then
return
end

if not al then
return
end

if am.UserInputType==Enum.UserInputType.Keyboard then
if am.KeyCode.Name==ak.Value then
ad.SafeCallback(ak.Callback,am.KeyCode.Name)
end
elseif am.UserInputType==Enum.UserInputType.MouseButton1 and ak.Value=="MouseLeft"then
ad.SafeCallback(ak.Callback,"MouseLeft")
elseif am.UserInputType==Enum.UserInputType.MouseButton2 and ak.Value=="MouseRight"then
ad.SafeCallback(ak.Callback,"MouseRight")
end
end)

return ak.__type,ak
end

return ag end function a.N()

local aa=a.load'c'
local ac=aa.New local ad=
aa.Tween

local ae={
UICorner=8,
UIPadding=8,
}local af=a.load'l'


.New
local ag=a.load'm'.New

function ae.New(ah,ai)
local aj={
__type="Input",
Title=ai.Title or"Input",
Desc=ai.Desc or nil,
Type=ai.Type or"Input",
Locked=ai.Locked or false,
LockedTitle=ai.LockedTitle,
InputIcon=ai.InputIcon or false,
Placeholder=ai.Placeholder or"Enter Text...",
Value=ai.Value or"",
Callback=ai.Callback or function()end,
ClearTextOnFocus=ai.ClearTextOnFocus or false,
UIElements={},

Width=150,
}

local ak=true

aj.InputFrame=a.load'F'{
Title=aj.Title,
Desc=aj.Desc,
Parent=ai.Parent,
TextOffset=aj.Width,
Hover=false,
Tab=ai.Tab,
Index=ai.Index,
Window=ai.Window,
ElementTable=aj,
ParentConfig=ai,
}

local al=ag(
aj.Placeholder,
aj.InputIcon,
aj.Type=="Textarea"and aj.InputFrame.UIElements.Container or aj.InputFrame.UIElements.Main,
aj.Type,
function(al)
aj:Set(al,true)
end,
nil,
ai.Window.NewElements and 12 or 10,
aj.ClearTextOnFocus
)

if aj.Type=="Input"then
al.Size=UDim2.new(0,aj.Width,0,36)
al.Position=UDim2.new(1,0,ai.Window.NewElements and 0 or 0.5,0)
al.AnchorPoint=Vector2.new(1,ai.Window.NewElements and 0 or 0.5)
else
al.Size=UDim2.new(1,0,0,148)
end

ac("UIScale",{
Parent=al,
Scale=1,
})

function aj.Lock(am)
aj.Locked=true
ak=false
return aj.InputFrame:Lock(aj.LockedTitle)
end
function aj.Unlock(am)
aj.Locked=false
ak=true
return aj.InputFrame:Unlock()
end


function aj.Set(am,an,ao)
if ak then
aj.Value=an
aa.SafeCallback(aj.Callback,an)

if not ao then
al.Frame.Frame.TextBox.Text=an
end
end
end

function aj.SetPlaceholder(am,an)
al.Frame.Frame.TextBox.PlaceholderText=an
aj.Placeholder=an
end

function aj.Get(am)
return aj.Value
end

aj:Set(aj.Value)

if aj.Locked then
aj:Lock()
end

return aj.__type,aj
end

return ae end function a.O()

local aa=a.load'c'
local ac=aa.New

local ae={}

function ae.New(af,ag)
local ah=ac("Frame",{
Size=ag.ParentType~="Group"and UDim2.new(1,0,0,1)or UDim2.new(0,1,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local ai=ac("Frame",{
Parent=ag.Parent,
Size=ag.ParentType~="Group"and UDim2.new(1,-7,0,7)or UDim2.new(0,7,1,-7),
BackgroundTransparency=1,
},{
ah
})

return"Divider",{__type="Divider",ElementFrame=ai}
end

return ae end function a.P()

local aa={}

local ac=(cloneref or clonereference or function(ac)return ac end)

local ae=ac(game:GetService"UserInputService")
local af=ac(game:GetService"Players").LocalPlayer:GetMouse()
local ag=ac(game:GetService"Workspace").CurrentCamera

local ah=workspace.CurrentCamera

local ai=a.load'm'.New

local aj=a.load'c'
local ak=aj.New
local al=aj.Tween

function aa.New(am,an,ao,ap,aq)
local ar={}

if not an.Callback then
aq="Menu"
end

an.UIElements.UIListLayout=ak("UIListLayout",{
Padding=UDim.new(0,ao.MenuPadding/1.5),
FillDirection="Vertical",
HorizontalAlignment="Center",
})

an.UIElements.Menu=aj.NewRoundFrame(ao.MenuCorner,"Squircle",{
ThemeTag={
ImageColor3="Background",
},
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
},{
ak("UIPadding",{
PaddingTop=UDim.new(0,ao.MenuPadding),
PaddingLeft=UDim.new(0,ao.MenuPadding),
PaddingRight=UDim.new(0,ao.MenuPadding),
PaddingBottom=UDim.new(0,ao.MenuPadding),
}),
ak("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,ao.MenuPadding)
}),
ak("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,an.SearchBarEnabled and-ao.MenuPadding-ao.SearchBarHeight),

ClipsDescendants=true,
LayoutOrder=999,
},{
ak("UICorner",{
CornerRadius=UDim.new(0,ao.MenuCorner-ao.MenuPadding),
}),
ak("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
},{
an.UIElements.UIListLayout,
})
})
})

an.UIElements.MenuCanvas=ak("Frame",{
Size=UDim2.new(0,an.MenuWidth,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,

Parent=am.HyperUI.DropdownGui,
AnchorPoint=Vector2.new(1,0),
},{
an.UIElements.Menu,
ak("UISizeConstraint",{
MinSize=Vector2.new(170,0),
MaxSize=Vector2.new(300,400),
})
})

local function RecalculateCanvasSize()
an.UIElements.Menu.Frame.ScrollingFrame.CanvasSize=UDim2.fromOffset(0,an.UIElements.UIListLayout.AbsoluteContentSize.Y)
end

local function RecalculateListSize()
local as=ah.ViewportSize.Y*0.6

local at=an.UIElements.UIListLayout.AbsoluteContentSize.Y
local au=an.SearchBarEnabled and(ao.SearchBarHeight+(ao.MenuPadding*3))or(ao.MenuPadding*2)
local av=(at)+au

if av>as then
an.UIElements.MenuCanvas.Size=UDim2.fromOffset(
an.UIElements.MenuCanvas.AbsoluteSize.X,
as
)
else
an.UIElements.MenuCanvas.Size=UDim2.fromOffset(
an.UIElements.MenuCanvas.AbsoluteSize.X,
av
)
end
end

function UpdatePosition()
local as=an.UIElements.Dropdown or an.DropdownFrame.UIElements.Main
local at=an.UIElements.MenuCanvas

local au=as.AbsolutePosition.Y+as.AbsoluteSize.Y
local av=as.AbsolutePosition.X+as.AbsoluteSize.X
local aw=at.AbsoluteSize.Y
local ax=ag.ViewportSize.Y

local ay=ax-au-10
local az=as.AbsolutePosition.Y-10

if ay>=aw or ay>=az then

at.AnchorPoint=Vector2.new(1,0)
at.Position=UDim2.new(
0,av,
0,au+ao.MenuPadding
)
else

at.AnchorPoint=Vector2.new(1,1)
at.Position=UDim2.new(
0,av,
0,as.AbsolutePosition.Y-ao.MenuPadding
)
end
end

local as

function ar.Display(at)
local au=an.Values
local av=""

if an.Multi then
local aw={}
if typeof(an.Value)=="table"then
for ax,ay in ipairs(an.Value)do
local az=typeof(ay)=="table"and ay.Title or ay
aw[az]=true
end
end

for ax,ay in ipairs(au)do
local az=typeof(ay)=="table"and ay.Title or ay
if aw[az]then
av=av..az..", "
end
end

if#av>0 then
av=av:sub(1,#av-2)
end
else
av=typeof(an.Value)=="table"and an.Value.Title or an.Value or""
end

if an.UIElements.Dropdown then
an.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(av==""and"--"or av)
end
end

local function Callback(at)
ar:Display()
if an.Callback then
task.spawn(function()
aj.SafeCallback(an.Callback,an.Value)
end)
else
task.spawn(function()
aj.SafeCallback(at)
end)
end
end

function ar.LockValues(at,au)
if not au then return end

for av,aw in next,an.Tabs do
if aw and aw.UIElements and aw.UIElements.TabItem then
local ax=aw.Name
local ay=false

for az,aA in next,au do
if ax==aA then
ay=true
break
end
end

if ay then
al(aw.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
al(aw.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()
al(aw.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0.6}):Play()
if aw.UIElements.TabIcon then
al(aw.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.6}):Play()
end

aw.UIElements.TabItem.Active=false
aw.Locked=true
else
if aw.Selected then
al(aw.UIElements.TabItem,0.1,{ImageTransparency=0.95}):Play()
al(aw.UIElements.TabItem.Highlight,0.1,{ImageTransparency=0.75}):Play()
al(aw.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if aw.UIElements.TabIcon then
al(aw.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
else
al(aw.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
al(aw.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()
al(aw.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=aq=="Dropdown"and 0.4 or 0.05}):Play()
if aw.UIElements.TabIcon then
al(aw.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=aq=="Dropdown"and 0.2 or 0}):Play()
end
end

aw.UIElements.TabItem.Active=true
aw.Locked=false
end
end
end
end

function ar.Refresh(at,au)
for av,aw in next,an.UIElements.Menu.Frame.ScrollingFrame:GetChildren()do
if not aw:IsA"UIListLayout"then
aw:Destroy()
end
end

an.Tabs={}

if an.SearchBarEnabled then
if not as then
as=ai("Search...","search",an.UIElements.Menu,nil,function(av)
for aw,ax in next,an.Tabs do
if string.find(string.lower(ax.Name),string.lower(av),1,true)then
ax.UIElements.TabItem.Visible=true
else
ax.UIElements.TabItem.Visible=false
end
RecalculateListSize()
RecalculateCanvasSize()
end
end,true)
as.Size=UDim2.new(1,0,0,ao.SearchBarHeight)
as.Position=UDim2.new(0,0,0,0)
as.Name="SearchBar"
end
end

for av,aw in next,au do
if(aw.Type~="Divider")then
local ax={
Name=typeof(aw)=="table"and aw.Title or aw,
Desc=typeof(aw)=="table"and aw.Desc or nil,
Icon=typeof(aw)=="table"and aw.Icon or nil,
IconSize=typeof(aw)=="table"and aw.IconSize or nil,
Original=aw,
Selected=false,
Locked=typeof(aw)=="table"and aw.Locked or false,
UIElements={},
}
local ay
if ax.Icon then
ay=aj.Image(
ax.Icon,
ax.Icon,
0,
am.Window.Folder,
"Dropdown",
true
)
ay.Size=UDim2.new(0,ax.IconSize or ao.TabIcon,0,ax.IconSize or ao.TabIcon)
ay.ImageLabel.ImageTransparency=aq=="Dropdown"and.2 or 0
ax.UIElements.TabIcon=ay
end
ax.UIElements.TabItem=aj.NewRoundFrame(ao.MenuCorner-ao.MenuPadding,"Squircle",{
Size=UDim2.new(1,0,0,36),
AutomaticSize=ax.Desc and"Y",
ImageTransparency=1,
Parent=an.UIElements.Menu.Frame.ScrollingFrame,
ImageColor3=Color3.new(1,1,1),
Active=not ax.Locked,
},{
aj.NewRoundFrame(ao.MenuCorner-ao.MenuPadding,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="DropdownTabBorder",
},
ImageTransparency=1,
Name="Highlight",
},{













}),
ak("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ak("UIListLayout",{
Padding=UDim.new(0,ao.TabPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ak("UIPadding",{
PaddingTop=UDim.new(0,ao.TabPadding),
PaddingLeft=UDim.new(0,ao.TabPadding),
PaddingRight=UDim.new(0,ao.TabPadding),
PaddingBottom=UDim.new(0,ao.TabPadding),
}),
ak("UICorner",{
CornerRadius=UDim.new(0,ao.MenuCorner-ao.MenuPadding)
}),
ay,
ak("Frame",{
Size=UDim2.new(1,ay and-ao.TabPadding-ao.TabIcon or 0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Name="Title",
},{
ak("TextLabel",{
Text=ax.Name,
TextXAlignment="Left",
FontFace=Font.new(aj.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text"
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=aq=="Dropdown"and.4 or.05,
LayoutOrder=999,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
}),
ak("TextLabel",{
Text=ax.Desc or"",
TextXAlignment="Left",
FontFace=Font.new(aj.Font,Enum.FontWeight.Regular),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text"
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=aq=="Dropdown"and.6 or.35,
LayoutOrder=999,
AutomaticSize="Y",
TextWrapped=true,
Size=UDim2.new(1,0,0,0),
Visible=ax.Desc and true or false,
Name="Desc",
}),
ak("UIListLayout",{
Padding=UDim.new(0,ao.TabPadding/3),
FillDirection="Vertical",
}),
})
})
},true)

if ax.Locked then
ax.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency=0.6
if ax.UIElements.TabIcon then
ax.UIElements.TabIcon.ImageLabel.ImageTransparency=0.6
end
end

if an.Multi and typeof(an.Value)=="string"then
for az,aA in next,an.Values do
if typeof(aA)=="table"then
if aA.Title==an.Value then an.Value={aA}end
else
if aA==an.Value then an.Value={an.Value}end
end
end
end

if an.Multi then
local az=false
if typeof(an.Value)=="table"then
for aA,aB in ipairs(an.Value)do
local b=typeof(aB)=="table"and aB.Title or aB
if b==ax.Name then
az=true
break
end
end
end
ax.Selected=az
else
local az=typeof(an.Value)=="table"and an.Value.Title or an.Value
ax.Selected=az==ax.Name
end

if ax.Selected and not ax.Locked then
ax.UIElements.TabItem.ImageTransparency=.95
ax.UIElements.TabItem.Highlight.ImageTransparency=.75
ax.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency=0
if ax.UIElements.TabIcon then
ax.UIElements.TabIcon.ImageLabel.ImageTransparency=0
end
end

an.Tabs[av]=ax

ar:Display()

if aq=="Dropdown"then
aj.AddSignal(ax.UIElements.TabItem.MouseButton1Click,function()
if ax.Locked then return end

if an.Multi then
if not ax.Selected then
ax.Selected=true
al(ax.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
al(ax.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()
al(ax.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if ax.UIElements.TabIcon then
al(ax.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
table.insert(an.Value,ax.Original)
else
if not an.AllowNone and#an.Value==1 then
return
end
ax.Selected=false
al(ax.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
al(ax.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()
al(ax.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=.4}):Play()
if ax.UIElements.TabIcon then
al(ax.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=.2}):Play()
end

for az,aA in next,an.Value do
if typeof(aA)=="table"and(aA.Title==ax.Name)or(aA==ax.Name)then
table.remove(an.Value,az)
break
end
end
end
else
for az,aA in next,an.Tabs do
al(aA.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
al(aA.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()
al(aA.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=.4}):Play()
if aA.UIElements.TabIcon then
al(aA.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=.2}):Play()
end
aA.Selected=false
end
ax.Selected=true
al(ax.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
al(ax.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()
al(ax.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if ax.UIElements.TabIcon then
al(ax.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
an.Value=ax.Original
end
Callback()
end)
elseif aq=="Menu"then
if not ax.Locked then
aj.AddSignal(ax.UIElements.TabItem.MouseEnter,function()
al(ax.UIElements.TabItem,0.08,{ImageTransparency=.95}):Play()
end)
aj.AddSignal(ax.UIElements.TabItem.InputEnded,function()
al(ax.UIElements.TabItem,0.08,{ImageTransparency=1}):Play()
end)
end
aj.AddSignal(ax.UIElements.TabItem.MouseButton1Click,function()
if ax.Locked then return end
Callback(aw.Callback or function()end)
end)
end

RecalculateCanvasSize()
RecalculateListSize()
else a.load'O'
:New{Parent=an.UIElements.Menu.Frame.ScrollingFrame}
end
end

local av=an.MenuWidth or 0
if av==0 then
for aw,ax in next,an.Tabs do
if ax.UIElements.TabItem.Frame.UIListLayout then
av=math.max(av,ax.UIElements.TabItem.Frame.UIListLayout.AbsoluteContentSize.X)
end
end
end

an.UIElements.MenuCanvas.Size=UDim2.new(0,av+6+6+5+5+18+6+6,an.UIElements.MenuCanvas.Size.Y.Scale,an.UIElements.MenuCanvas.Size.Y.Offset)
Callback()

an.Values=au
end

ar:Refresh(an.Values)

function ar.Select(at,au)
if au then
an.Value=au
else
if an.Multi then
an.Value={}
else
an.Value=nil
end
end
ar:Refresh(an.Values)
end

RecalculateListSize()
RecalculateCanvasSize()

function ar.Open(at)
if ap then
an.UIElements.Menu.Visible=true
an.UIElements.MenuCanvas.Visible=true
an.UIElements.MenuCanvas.Active=true
an.UIElements.Menu.Size=UDim2.new(
1,0,
0,0
)
al(an.UIElements.Menu,0.1,{
Size=UDim2.new(
1,0,
1,0
),
ImageTransparency=0.05
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(.1)
an.Opened=true
end)

UpdatePosition()
end
end

function ar.Close(at)
an.Opened=false

al(an.UIElements.Menu,0.25,{
Size=UDim2.new(
1,0,
0,0
),
ImageTransparency=1,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(.1)
an.UIElements.Menu.Visible=false
end)

task.spawn(function()
task.wait(.25)
an.UIElements.MenuCanvas.Visible=false
an.UIElements.MenuCanvas.Active=false
end)
end

aj.AddSignal((an.UIElements.Dropdown and an.UIElements.Dropdown.MouseButton1Click or an.DropdownFrame.UIElements.Main.MouseButton1Click),function()
ar:Open()
end)

aj.AddSignal(ae.InputBegan,function(at)
if at.UserInputType==Enum.UserInputType.MouseButton1 or at.UserInputType==Enum.UserInputType.Touch then
local au=an.UIElements.MenuCanvas
local av,aw=au.AbsolutePosition,au.AbsoluteSize

local ax=an.UIElements.Dropdown or an.DropdownFrame.UIElements.Main
local ay=ax.AbsolutePosition
local az=ax.AbsoluteSize

local aA=
af.X>=ay.X and
af.X<=ay.X+az.X and
af.Y>=ay.Y and
af.Y<=ay.Y+az.Y

local aB=
af.X>=av.X and
af.X<=av.X+aw.X and
af.Y>=av.Y and
af.Y<=av.Y+aw.Y

if am.Window.CanDropdown and an.Opened and not aA and not aB then
ar:Close()
end
end
end)

aj.AddSignal(
an.UIElements.Dropdown and an.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition"or
an.DropdownFrame.UIElements.Main:GetPropertyChangedSignal"AbsolutePosition",
UpdatePosition
)

return ar
end

return aa end function a.Q()

local aa=(cloneref or clonereference or function(aa)return aa end)

aa(game:GetService"UserInputService")
aa(game:GetService"Players").LocalPlayer:GetMouse()local ac=
aa(game:GetService"Workspace").CurrentCamera

local ae=a.load'c'
local af=ae.New local ag=
ae.Tween

local ah=a.load'w'.New local ai=a.load'm'
.New
local aj=a.load'P'.New local ak=

workspace.CurrentCamera

local al={
UICorner=10,
UIPadding=12,
MenuCorner=15,
MenuPadding=5,
TabPadding=10,
SearchBarHeight=39,
TabIcon=18,
}

function al.New(am,an)
local ao={
__type="Dropdown",
Title=an.Title or"Dropdown",
Desc=an.Desc or nil,
Locked=an.Locked or false,
LockedTitle=an.LockedTitle,
Values=an.Values or{},
MenuWidth=an.MenuWidth,
Value=an.Value,
AllowNone=an.AllowNone,
SearchBarEnabled=an.SearchBarEnabled or false,
Multi=an.Multi,
Callback=an.Callback or nil,

UIElements={},

Opened=false,
Tabs={},

Width=150,
}

if ao.Multi and not ao.Value then
ao.Value={}
end
if ao.Values and typeof(ao.Value)=="number"then
ao.Value=ao.Values[ao.Value]
end

local ap=true

ao.DropdownFrame=a.load'F'{
Title=ao.Title,
Desc=ao.Desc,
Parent=an.Parent,
TextOffset=ao.Callback and ao.Width or 20,
Hover=not ao.Callback and true or false,
Tab=an.Tab,
Index=an.Index,
Window=an.Window,
ElementTable=ao,
ParentConfig=an,
}


if ao.Callback then
ao.UIElements.Dropdown=ah("",nil,ao.DropdownFrame.UIElements.Main,nil,an.Window.NewElements and 12 or 10)

ao.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
ao.UIElements.Dropdown.Frame.Frame.TextLabel.Size=UDim2.new(1,ao.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

ao.UIElements.Dropdown.Size=UDim2.new(0,ao.Width,0,36)
ao.UIElements.Dropdown.Position=UDim2.new(1,0,an.Window.NewElements and 0 or 0.5,0)
ao.UIElements.Dropdown.AnchorPoint=Vector2.new(1,an.Window.NewElements and 0 or 0.5)








end

ao.DropdownMenu=aj(an,ao,al,ap,"Dropdown")


ao.Display=ao.DropdownMenu.Display
ao.Refresh=ao.DropdownMenu.Refresh
ao.Select=ao.DropdownMenu.Select
ao.Open=ao.DropdownMenu.Open
ao.Close=ao.DropdownMenu.Close

af("ImageLabel",{
Image=ae.Icon"chevrons-up-down"[1],
ImageRectOffset=ae.Icon"chevrons-up-down"[2].ImageRectPosition,
ImageRectSize=ae.Icon"chevrons-up-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(
1,
ao.UIElements.Dropdown and-12 or 0,
0.5,
0
),
ThemeTag={
ImageColor3="Icon"
},
AnchorPoint=Vector2.new(1,0.5),
Parent=ao.UIElements.Dropdown and ao.UIElements.Dropdown.Frame or ao.DropdownFrame.UIElements.Main
})



function ao.Lock(aq)
ao.Locked=true
ap=false
return ao.DropdownFrame:Lock(ao.LockedTitle)
end
function ao.Unlock(aq)
ao.Locked=false
ap=true
return ao.DropdownFrame:Unlock()
end

if ao.Locked then
ao:Lock()
end


return ao.__type,ao
end

return al end function a.R()







local aa={}
local ae={
lua={
"and","break","or","else","elseif","if","then","until","repeat","while","do","for","in","end",
"local","return","function","export",
},
rbx={
"game","workspace","script","math","string","table","task","wait","select","next","Enum",
"tick","assert","shared","loadstring","tonumber","tostring","type",
"typeof","unpack","Instance","CFrame","Vector3","Vector2","Color3","UDim","UDim2","Ray","BrickColor",
"OverlapParams","RaycastParams","Axes","Random","Region3","Rect","TweenInfo",
"collectgarbage","not","utf8","pcall","xpcall","_G","setmetatable","getmetatable","os","pairs","ipairs"
},
operators={
"#","+","-","*","%","/","^","=","~","=","<",">",
}
}

local af={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(ah)
local aj={}
for ak,al in ipairs(ah)do
aj[al]=true
end
return aj
end

local ah=createKeywordSet(ae.lua)
local aj=createKeywordSet(ae.rbx)
local ak=createKeywordSet(ae.operators)

local function getHighlight(al,am)
local an=al[am]

if af[an.."_color"]then
return af[an.."_color"]
end

if tonumber(an)then
return af.numbers
elseif an=="nil"then
return af.null
elseif an:sub(1,2)=="--"then
return af.comment
elseif ak[an]then
return af.operator
elseif ah[an]then
return af.lua
elseif aj[an]then
return af.rbx
elseif an:sub(1,1)=="\""or an:sub(1,1)=="\'"then
return af.str
elseif an=="true"or an=="false"then
return af.boolean
end

if al[am+1]=="("then
if al[am-1]==":"then
return af.self_call
end

return af.call
end

if al[am-1]=="."then
if al[am-2]=="Enum"then
return af.rbx
end

return af.local_property
end
end

function aa.run(al)
local am={}
local an=""

local ao=false
local ap=false
local aq=false

for ar=1,#al do
local as=al:sub(ar,ar)

if ap then
if as=="\n"and not aq then
table.insert(am,an)
table.insert(am,as)
an=""

ap=false
elseif al:sub(ar-1,ar)=="]]"and aq then
an=an.."]"

table.insert(am,an)
an=""

ap=false
aq=false
else
an=an..as
end
elseif ao then
if as==ao and al:sub(ar-1,ar-1)~="\\"or as=="\n"then
an=an..as
ao=false
else
an=an..as
end
else
if al:sub(ar,ar+1)=="--"then
table.insert(am,an)
an="-"
ap=true
aq=al:sub(ar+2,ar+3)=="[["
elseif as=="\""or as=="\'"then
table.insert(am,an)
an=as
ao=as
elseif ak[as]then
table.insert(am,an)
table.insert(am,as)
an=""
elseif as:match"[%w_]"then
an=an..as
else
table.insert(am,an)
table.insert(am,as)
an=""
end
end
end

table.insert(am,an)

local ar={}

for as,at in ipairs(am)do
local au=getHighlight(am,as)

if au then
local av=string.format("<font color = \"#%s\">%s</font>",au:ToHex(),at:gsub("<","&lt;"):gsub(">","&gt;"))

table.insert(ar,av)
else
table.insert(ar,at)
end
end

return table.concat(ar)
end

return aa end function a.S()

local aa={}

local ae=a.load'c'
local af=ae.New
local ah=ae.Tween

local aj=a.load'R'

function aa.New(ak,al,am,an,ao)
local ap={
Radius=12,
Padding=10
}

local aq=af("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=14,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
af("UIPadding",{
PaddingTop=UDim.new(0,ap.Padding+3),
PaddingLeft=UDim.new(0,ap.Padding+3),
PaddingRight=UDim.new(0,ap.Padding+3),
PaddingBottom=UDim.new(0,ap.Padding+3),
})
})
aq.Font="Code"

local ar=af("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize="X",
ScrollingDirection="X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
aq
})

local as=af("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,30,0,30),
Position=UDim2.new(1,-ap.Padding/2,0,ap.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=an and true or false,
},{
ae.NewRoundFrame(ap.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
af("UIScale",{
Scale=1,
}),
af("ImageLabel",{
Image=ae.Icon"copy"[1],
ImageRectSize=ae.Icon"copy"[2].ImageRectSize,
ImageRectOffset=ae.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.1,
})
})
})

ae.AddSignal(as.MouseEnter,function()
ah(as.Button,.05,{ImageTransparency=.95}):Play()
ah(as.Button.UIScale,.05,{Scale=.9}):Play()
end)
ae.AddSignal(as.InputEnded,function()
ah(as.Button,.08,{ImageTransparency=1}):Play()
ah(as.Button.UIScale,.08,{Scale=1}):Play()
end)

local at=ae.NewRoundFrame(ap.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=.035,
Size=UDim2.new(1,0,0,20+(ap.Padding*2)),
AutomaticSize="Y",
Parent=am,
},{
ae.NewRoundFrame(ap.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.955,
}),
af("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
},{
ae.NewRoundFrame(ap.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.96,
Size=UDim2.new(1,0,0,20+(ap.Padding*2)),
Visible=al and true or false
},{
af("ImageLabel",{
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Image="rbxassetid://132464694294269",



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.2,
}),
af("TextLabel",{
Text=al,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=.2,
TextSize=16,
AutomaticSize="Y",
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,as and-20-(ap.Padding*2),0,0)
}),
af("UIPadding",{

PaddingLeft=UDim.new(0,ap.Padding+3),
PaddingRight=UDim.new(0,ap.Padding+3),

}),
af("UIListLayout",{
Padding=UDim.new(0,ap.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
ar,
af("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
})
}),
as,
})

ap.CodeFrame=at

ae.AddSignal(aq:GetPropertyChangedSignal"TextBounds",function()
ar.Size=UDim2.new(1,0,0,(aq.TextBounds.Y/(ao or 1))+((ap.Padding+3)*2))
end)

function ap.Set(au)
aq.Text=aj.run(au)
end

function ap.Destroy()
at:Destroy()
ap=nil
end

ap.Set(ak)

ae.AddSignal(as.MouseButton1Click,function()
if an then
an()
local au=ae.Icon"check"
as.Button.ImageLabel.Image=au[1]
as.Button.ImageLabel.ImageRectSize=au[2].ImageRectSize
as.Button.ImageLabel.ImageRectOffset=au[2].ImageRectPosition

task.wait(1)
local av=ae.Icon"copy"
as.Button.ImageLabel.Image=av[1]
as.Button.ImageLabel.ImageRectSize=av[2].ImageRectSize
as.Button.ImageLabel.ImageRectOffset=av[2].ImageRectPosition
end
end)
return ap
end


return aa end function a.T()

local aa=a.load'c'local ae=
aa.New


local af=a.load'S'

local ah={}

function ah.New(aj,ak)
local al={
__type="Code",
Title=ak.Title,
Code=ak.Code,
OnCopy=ak.OnCopy,
}

local am=not al.Locked











local an=af.New(al.Code,al.Title,ak.Parent,function()
if am then
local an=al.Title or"code"
local ao,ap=pcall(function()
toclipboard(al.Code)

if al.OnCopy then al.OnCopy()end
end)
if not ao then
ak.HyperUI:Notify{
Title="Error",
Content="The "..an.." is not copied. Error: "..ap,
Icon="x",
Duration=5,
}
end
end
end,ak.HyperUI.UIScale,al)

function al.SetCode(ao,ap)
an.Set(ap)
al.Code=ap
end

function al.Set(ao,ap)
return al.SetCode(ap)
end

function al.Destroy(ao)
an.Destroy()
al=nil
end

al.ElementFrame=an.CodeFrame

return al.__type,al
end

return ah end function a.U()

local aa=a.load'c'
local ae=aa.New local af=
aa.Tween

local ah=(cloneref or clonereference or function(ah)return ah end)

local aj=ah(game:GetService"UserInputService")
ah(game:GetService"TouchInputService")
local ak=ah(game:GetService"RunService")
local al=ah(game:GetService"Players")

local am=ak.RenderStepped
local an=al.LocalPlayer
local ao=an:GetMouse()

local ap=a.load'l'.New
local aq=a.load'm'.New

local ar={
UICorner=9,

}

function ar.Colorpicker(as,at,au,av)
local aw={
__type="Colorpicker",
Title=at.Title,
Desc=at.Desc,
Default=at.Value or at.Default,
Callback=at.Callback,
Transparency=at.Transparency,
UIElements=at.UIElements,

TextPadding=10,
}

function aw.SetHSVFromRGB(ax,ay)
local az,aA,aB=Color3.toHSV(ay)
aw.Hue=az
aw.Sat=aA
aw.Vib=aB
end

aw:SetHSVFromRGB(aw.Default)

local ax=a.load'n'.Init(au)
local ay=ax.Create()

aw.ColorpickerFrame=ay

ay.UIElements.Main.Size=UDim2.new(1,0,0,0)



local az,aA,aB=aw.Hue,aw.Sat,aw.Vib

aw.UIElements.Title=ae("TextLabel",{
Text=aw.Title,
TextSize=20,
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=ay.UIElements.Main
},{
ae("UIPadding",{
PaddingTop=UDim.new(0,aw.TextPadding/2),
PaddingLeft=UDim.new(0,aw.TextPadding/2),
PaddingRight=UDim.new(0,aw.TextPadding/2),
PaddingBottom=UDim.new(0,aw.TextPadding/2),
})
})





local b=ae("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=HueDragHolder,
BackgroundColor3=aw.Default
},{
ae("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ae("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

aw.UIElements.SatVibMap=ae("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40+aw.TextPadding),
Image="rbxassetid://4155801252",
BackgroundColor3=Color3.fromHSV(az,1,1),
BackgroundTransparency=0,
Parent=ay.UIElements.Main,
},{
ae("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ZIndex=99999,
},{
ae("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),

b,
})

aw.UIElements.Inputs=ae("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(aw.Transparency and 240 or 210,40+aw.TextPadding),
BackgroundTransparency=1,
Parent=ay.UIElements.Main
},{
ae("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Vertical",
})
})





local d=ae("Frame",{
BackgroundColor3=aw.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=aw.Transparency,
},{
ae("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ae("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208+aw.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=ay.UIElements.Main,
},{
ae("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ZIndex=99999,
},{
ae("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),







d,
})

local f=ae("Frame",{
BackgroundColor3=aw.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
ae("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ae("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208+aw.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=ay.UIElements.Main,
},{
ae("UICorner",{
CornerRadius=UDim.new(0,8),
}),







aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ZIndex=99999,
},{
ae("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),
f,
})

local g={}

for h=0,1,0.1 do
table.insert(g,ColorSequenceKeypoint.new(h,Color3.fromHSV(h,1,1)))
end

local h=ae("UIGradient",{
Color=ColorSequence.new(g),
Rotation=90,
})

local j=ae("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local l=ae("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=j,


BackgroundColor3=aw.Default
},{
ae("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ae("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

local m=ae("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(180,40+aw.TextPadding),
Parent=ay.UIElements.Main,
},{
ae("UICorner",{
CornerRadius=UDim.new(1,0),
}),
h,
j,
})


function CreateNewInput(p,r)
local u=aq(p,nil,aw.UIElements.Inputs)

ae("TextLabel",{
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=17,
FontFace=Font.new(aa.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=u.Frame,
Text=p,
})

ae("UIScale",{
Parent=u,
Scale=.85,
})

u.Frame.Frame.TextBox.Text=r
u.Size=UDim2.new(0,150,0,42)

return u
end

local function ToRGB(p)
return{
R=math.floor(p.R*255),
G=math.floor(p.G*255),
B=math.floor(p.B*255)
}
end

local p=CreateNewInput("Hex","#"..aw.Default:ToHex())

local r=CreateNewInput("Red",ToRGB(aw.Default).R)
local u=CreateNewInput("Green",ToRGB(aw.Default).G)
local v=CreateNewInput("Blue",ToRGB(aw.Default).B)
local x
if aw.Transparency then
x=CreateNewInput("Alpha",((1-aw.Transparency)*100).."%")
end

local z=ae("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254+aw.TextPadding),
BackgroundTransparency=1,
Parent=ay.UIElements.Main,
LayoutOrder=4,
},{
ae("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),






})

local A={
{
Title="Cancel",
Variant="Secondary",
Callback=function()end
},
{
Title="Apply",
Icon="chevron-right",
Variant="Primary",
Callback=function()av(Color3.fromHSV(aw.Hue,aw.Sat,aw.Vib),aw.Transparency)end
}
}

for B,C in next,A do
local F=ap(C.Title,C.Icon,C.Callback,C.Variant,z,ay,false)
F.Size=UDim2.new(0.5,-3,0,40)
F.AutomaticSize="None"
end



local B,C,F
if aw.Transparency then
local G=ae("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

C=ae("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=G,

},{
ae("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ae("UICorner",{
CornerRadius=UDim.new(1,0),
})

})

F=ae("Frame",{
Size=UDim2.fromScale(1,1),
},{
ae("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
ae("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

B=ae("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(210,40+aw.TextPadding),
Parent=ay.UIElements.Main,
BackgroundTransparency=1,
},{
ae("UICorner",{
CornerRadius=UDim.new(1,0),
}),
ae("ImageLabel",{
Image="rbxassetid://14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
ae("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
F,
G,
})
end

function aw.Round(G,H,J)
if J==0 then
return math.floor(H)
end
H=tostring(H)
return H:find"%."and tonumber(H:sub(1,H:find"%."+J))or H
end


function aw.Update(G,H,J)
if H then az,aA,aB=Color3.toHSV(H)else az,aA,aB=aw.Hue,aw.Sat,aw.Vib end

aw.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(az,1,1)
b.Position=UDim2.new(aA,0,1-aB,0)
b.BackgroundColor3=Color3.fromHSV(az,aA,aB)
f.BackgroundColor3=Color3.fromHSV(az,aA,aB)
l.BackgroundColor3=Color3.fromHSV(az,1,1)
l.Position=UDim2.new(0.5,0,az,0)

p.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(az,aA,aB):ToHex()
r.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(az,aA,aB)).R
u.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(az,aA,aB)).G
v.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(az,aA,aB)).B

if J or aw.Transparency then
f.BackgroundTransparency=aw.Transparency or J
F.BackgroundColor3=Color3.fromHSV(az,aA,aB)
C.BackgroundColor3=Color3.fromHSV(az,aA,aB)
C.BackgroundTransparency=aw.Transparency or J
C.Position=UDim2.new(0.5,0,1-aw.Transparency or J,0)
x.Frame.Frame.TextBox.Text=aw:Round((1-aw.Transparency or J)*100,0).."%"
end
end

aw:Update(aw.Default,aw.Transparency)




local function GetRGB()
local G=Color3.fromHSV(aw.Hue,aw.Sat,aw.Vib)
return{R=math.floor(G.r*255),G=math.floor(G.g*255),B=math.floor(G.b*255)}
end



local function clamp(G,H,J)
return math.clamp(tonumber(G)or 0,H,J)
end

aa.AddSignal(p.Frame.Frame.TextBox.FocusLost,function(G)
if G then
local H=p.Frame.Frame.TextBox.Text:gsub("#","")
local J,L=pcall(Color3.fromHex,H)
if J and typeof(L)=="Color3"then
aw.Hue,aw.Sat,aw.Vib=Color3.toHSV(L)
aw:Update()
aw.Default=L
end
end
end)

local function updateColorFromInput(G,H)
aa.AddSignal(G.Frame.Frame.TextBox.FocusLost,function(J)
if J then
local L=G.Frame.Frame.TextBox
local M=GetRGB()
local N=clamp(L.Text,0,255)
L.Text=tostring(N)

M[H]=N
local O=Color3.fromRGB(M.R,M.G,M.B)
aw.Hue,aw.Sat,aw.Vib=Color3.toHSV(O)
aw:Update()
end
end)
end

updateColorFromInput(r,"R")
updateColorFromInput(u,"G")
updateColorFromInput(v,"B")

if aw.Transparency then
aa.AddSignal(x.Frame.Frame.TextBox.FocusLost,function(G)
if G then
local H=x.Frame.Frame.TextBox
local J=clamp(H.Text,0,100)
H.Text=tostring(J)

aw.Transparency=1-J*0.01
aw:Update(nil,aw.Transparency)
end
end)
end



local G=aw.UIElements.SatVibMap
aa.AddSignal(G.InputBegan,function(H)
if H.UserInputType==Enum.UserInputType.MouseButton1 or H.UserInputType==Enum.UserInputType.Touch then
while aj:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local J=G.AbsolutePosition.X
local L=J+G.AbsoluteSize.X
local M=math.clamp(ao.X,J,L)

local N=G.AbsolutePosition.Y
local O=N+G.AbsoluteSize.Y
local P=math.clamp(ao.Y,N,O)

aw.Sat=(M-J)/(L-J)
aw.Vib=1-((P-N)/(O-N))
aw:Update()

am:Wait()
end
end
end)

aa.AddSignal(m.InputBegan,function(H)
if H.UserInputType==Enum.UserInputType.MouseButton1 or H.UserInputType==Enum.UserInputType.Touch then
while aj:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local J=m.AbsolutePosition.Y
local L=J+m.AbsoluteSize.Y
local M=math.clamp(ao.Y,J,L)

aw.Hue=((M-J)/(L-J))
aw:Update()

am:Wait()
end
end
end)

if aw.Transparency then
aa.AddSignal(B.InputBegan,function(H)
if H.UserInputType==Enum.UserInputType.MouseButton1 or H.UserInputType==Enum.UserInputType.Touch then
while aj:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local J=B.AbsolutePosition.Y
local L=J+B.AbsoluteSize.Y
local M=math.clamp(ao.Y,J,L)

aw.Transparency=1-((M-J)/(L-J))
aw:Update()

am:Wait()
end
end
end)
end

return aw
end

function ar.New(as,at)
local au={
__type="Colorpicker",
Title=at.Title or"Colorpicker",
Desc=at.Desc or nil,
Locked=at.Locked or false,
LockedTitle=at.LockedTitle,
Default=at.Default or Color3.new(1,1,1),
Callback=at.Callback or function()end,

UIScale=at.UIScale,
Transparency=at.Transparency,
UIElements={}
}

local av=true



au.ColorpickerFrame=a.load'F'{
Title=au.Title,
Desc=au.Desc,
Parent=at.Parent,
TextOffset=40,
Hover=false,
Tab=at.Tab,
Index=at.Index,
Window=at.Window,
ElementTable=au,
ParentConfig=at,
}

au.UIElements.Colorpicker=aa.NewRoundFrame(ar.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=au.Default,
Parent=au.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,26,0,26),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
ZIndex=2
},nil,true)


function au.Lock(aw)
au.Locked=true
av=false
return au.ColorpickerFrame:Lock(au.LockedTitle)
end
function au.Unlock(aw)
au.Locked=false
av=true
return au.ColorpickerFrame:Unlock()
end

if au.Locked then
au:Lock()
end


function au.Update(aw,ax,ay)
au.UIElements.Colorpicker.ImageTransparency=ay or 0
au.UIElements.Colorpicker.ImageColor3=ax
au.Default=ax
if ay then
au.Transparency=ay
end
end

function au.Set(aw,ax,ay)
return au:Update(ax,ay)
end

aa.AddSignal(au.UIElements.Colorpicker.MouseButton1Click,function()
if av then
ar:Colorpicker(au,at.Window,function(aw,ax)
au:Update(aw,ax)
au.Default=aw
au.Transparency=ax
aa.SafeCallback(au.Callback,aw,ax)
end).ColorpickerFrame:Open()
end
end)

return au.__type,au
end

return ar end function a.V()

local aa=a.load'c'
local ae=aa.New
local af=aa.Tween

local ah={}

function ah.New(aj,ak)
local al={
__type="Section",
Title=ak.Title or"Section",
Desc=ak.Desc,
Icon=ak.Icon,
TextXAlignment=ak.TextXAlignment or"Left",
TextSize=ak.TextSize or 19,
DescTextSize=ak.DescTextSize or 16,
Box=ak.Box or false,
BoxBorder=ak.BoxBorder or false,
FontWeight=ak.FontWeight or Enum.FontWeight.SemiBold,
DescFontWeight=ak.DescFontWeight or Enum.FontWeight.Medium,
TextTransparency=ak.TextTransparency or 0.05,
DescTextTransparency=ak.DescTextTransparency or 0.4,
Opened=ak.Opened or false,
UIElements={},

HeaderSize=42,
IconSize=20,
Padding=10,

Elements={},

Expandable=false,
}

local am


function al.SetIcon(an,ao)
al.Icon=ao or nil
if am then am:Destroy()end
if ao then
am=aa.Image(
ao,
ao..":"..al.Title,
0,
ak.Window.Folder,
al.__type,
true
)
am.Size=UDim2.new(0,al.IconSize,0,al.IconSize)
end
end

local an=ae("Frame",{
Size=UDim2.new(0,al.IconSize,0,al.IconSize),
BackgroundTransparency=1,
Visible=false
},{
ae("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=aa.Icon"chevron-down"[1],
ImageRectSize=aa.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=aa.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageTransparency="SectionExpandIconTransparency",
ImageColor3="SectionExpandIcon",
},
})
})


if al.Icon then
al:SetIcon(al.Icon)
end

local ao=ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ae("UIListLayout",{
FillDirection="Vertical",
HorizontalAlignment=al.TextXAlignment,
VerticalAlignment="Center",
Padding=UDim.new(0,4)
})
})

local ap,aq

local function createTitle(ar,as)
return ae("TextLabel",{
BackgroundTransparency=1,
TextXAlignment=al.TextXAlignment,
AutomaticSize="Y",
TextSize=as=="Title"and al.TextSize or al.DescTextSize,
TextTransparency=as=="Title"and al.TextTransparency or al.DescTextTransparency,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(aa.Font,as=="Title"and al.FontWeight or al.DescFontWeight),


Text=ar,
Size=UDim2.new(
1,
0,
0,
0
),
TextWrapped=true,
Parent=ao,
})
end

ap=createTitle(al.Title,"Title")
if al.Desc then
aq=createTitle(al.Desc,"Desc")
end

local function UpdateTitleSize()
local ar=0
if am then
ar=ar-(al.IconSize+8)
end
if an.Visible then
ar=ar-(al.IconSize+8)
end
ao.Size=UDim2.new(1,ar,0,0)
end


local ar=aa.NewRoundFrame(ak.Window.ElementConfig.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Parent=ak.Parent,
ClipsDescendants=true,
AutomaticSize="Y",
ThemeTag={
ImageTransparency=al.Box and"SectionBoxBackgroundTransparency"or nil,
ImageColor3="SectionBoxBackground",
},
ImageTransparency=not al.Box and 1 or nil,
},{
aa.NewRoundFrame(ak.Window.ElementConfig.UICorner,ak.Window.NewElements and"Glass-1"or"SquircleOutline",{
Size=UDim2.new(1,0,1,0),

ThemeTag={
ImageTransparency="SectionBoxBorderTransparency",
ImageColor3="SectionBoxBorder",
},
Visible=al.Box and al.BoxBorder,
Name="Outline",
}),
ae("TextButton",{
Size=UDim2.new(1,0,0,al.Expandable and 0 or(not aq and al.HeaderSize or 0)),
BackgroundTransparency=1,
AutomaticSize=(not al.Expandable or aq)and"Y"or nil,
Text="",
Name="Top",
},{
al.Box and ae("UIPadding",{
PaddingTop=UDim.new(0,ak.Window.ElementConfig.UIPadding+(ak.Window.NewElements and 4 or 0)),
PaddingLeft=UDim.new(0,ak.Window.ElementConfig.UIPadding+(ak.Window.NewElements and 4 or 0)),
PaddingRight=UDim.new(0,ak.Window.ElementConfig.UIPadding+(ak.Window.NewElements and 4 or 0)),
PaddingBottom=UDim.new(0,ak.Window.ElementConfig.UIPadding+(ak.Window.NewElements and 4 or 0)),
})or nil,
am,
ao,
ae("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
an,
}),
ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=false,
Position=UDim2.new(0,0,0,al.HeaderSize)
},{
al.Box and ae("UIPadding",{
PaddingLeft=UDim.new(0,ak.Window.ElementConfig.UIPadding),
PaddingRight=UDim.new(0,ak.Window.ElementConfig.UIPadding),
PaddingBottom=UDim.new(0,ak.Window.ElementConfig.UIPadding),
})or nil,
ae("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,ak.Tab.Gap),
VerticalAlignment="Top",
}),
})
})





al.ElementFrame=ar

if aq then
ar.Top:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
ar.Content.Position=UDim2.new(0,0,0,ar.Top.AbsoluteSize.Y/ak.UIScale)

if al.Opened then al:Open(true)else al.Close(true)end
end)
end


local as=ak.ElementsModule

as.Load(al,ar.Content,as.Elements,ak.Window,ak.HyperUI,function()
if not al.Expandable then
al.Expandable=true
an.Visible=true
UpdateTitleSize()
end
end,as,ak.UIScale,ak.Tab)


UpdateTitleSize()

function al.SetTitle(at,au)
al.Title=au
ap.Text=au
end

function al.SetDesc(at,au)
al.Desc=au
if not aq then
aq=createTitle(au,"Desc")
end
aq.Text=au
end

function al.Destroy(at)
for au,av in next,al.Elements do
av:Destroy()
end








ar:Destroy()
end

function al.Open(at,au)
if al.Expandable then
al.Opened=true
if au then
ar.Size=UDim2.new(ar.Size.X.Scale,ar.Size.X.Offset,0,(ar.Top.AbsoluteSize.Y)/ak.UIScale+(ar.Content.AbsoluteSize.Y/ak.UIScale))
an.ImageLabel.Rotation=180
else
af(ar,0.33,{
Size=UDim2.new(ar.Size.X.Scale,ar.Size.X.Offset,0,(ar.Top.AbsoluteSize.Y)/ak.UIScale+(ar.Content.AbsoluteSize.Y/ak.UIScale))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

af(an.ImageLabel,0.2,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
end
function al.Close(at,au)
if al.Expandable then
al.Opened=false
if au then
ar.Size=UDim2.new(ar.Size.X.Scale,ar.Size.X.Offset,0,(ar.Top.AbsoluteSize.Y/ak.UIScale))
an.ImageLabel.Rotation=0
else
af(ar,0.26,{
Size=UDim2.new(ar.Size.X.Scale,ar.Size.X.Offset,0,(ar.Top.AbsoluteSize.Y/ak.UIScale))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
af(an.ImageLabel,0.2,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
end

aa.AddSignal(ar.Top.MouseButton1Click,function()
if al.Expandable then
if al.Opened then
al:Close()
else
al:Open()
end
end
end)

aa.AddSignal(ar.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if al.Opened then
al:Open(true)
end
end)

task.spawn(function()
task.wait(0.02)
if al.Expandable then








ar.Size=UDim2.new(ar.Size.X.Scale,ar.Size.X.Offset,0,ar.Top.AbsoluteSize.Y/ak.UIScale)
ar.AutomaticSize="None"
ar.Top.Size=UDim2.new(1,0,0,(not aq and al.HeaderSize or 0))
ar.Top.AutomaticSize=(not al.Expandable or aq)and"Y"or"None"
ar.Content.Visible=true
end
if al.Opened then
al:Open()
end

end)

return al.__type,al
end

return ah end function a.W()

local aa=a.load'c'
local ae=aa.New

local af={}

function af.New(ah,aj)
local ak=ae("Frame",{
Parent=aj.Parent,
Size=aj.ParentType~="Group"and UDim2.new(1,-7,0,7*(aj.Columns or 1))or UDim2.new(0,7*(aj.Columns or 1),0,0),
BackgroundTransparency=1,
})

return"Space",{__type="Space",ElementFrame=ak}
end

return af end function a.X()

local aa=a.load'c'
local ae=aa.New

local af={}

local function ParseAspectRatio(ah)
if type(ah)=="string"then
local aj,ak=ah:match"(%d+):(%d+)"
if aj and ak then
return tonumber(aj)/tonumber(ak)
end
elseif type(ah)=="number"then
return ah
end
return nil
end

function af.New(ah,aj)
local ak={
__type="Image",
Image=aj.Image or"",
AspectRatio=aj.AspectRatio or"16:9",
Radius=aj.Radius or aj.Window.ElementConfig.UICorner,
}
local al=aa.Image(
ak.Image,
ak.Image,
ak.Radius,
aj.Window.Folder,
"Image",
false
)
if al and al.Parent then
al.Parent=aj.Parent
al.Size=UDim2.new(1,0,0,0)
al.BackgroundTransparency=1












local am=ParseAspectRatio(ak.AspectRatio)
local an

if am then
an=ae("UIAspectRatioConstraint",{
Parent=al,
AspectRatio=am,
AspectType="ScaleWithParentSize",
DominantAxis="Width"
})
end

function ak.Destroy(ao)
al:Destroy()
end
end

return ak.__type,ak
end

return af end function a.Y()

local aa=a.load'c'
local ae=aa.New

local af={}

function af.New(ah,aj)
local ak={
__type="Group",
Elements={}
}

local al=ae("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=aj.Parent,
},{
ae("UIListLayout",{
FillDirection="Horizontal",
HorizontalAlignment="Center",

Padding=UDim.new(0,aj.Tab and aj.Tab.Gap or(Window.NewElements and 1 or 6))
}),
})

local am=aj.ElementsModule
am.Load(
ak,
al,
am.Elements,
aj.Window,
aj.HyperUI,
function(an,ao)
local ap=aj.Tab and aj.Tab.Gap or(aj.Window.NewElements and 1 or 6)

local aq={}
local ar=0

for as,at in next,ao do
if at.__type=="Space"then
ar=ar+(at.ElementFrame.Size.X.Offset or 6)
elseif at.__type=="Divider"then
ar=ar+(at.ElementFrame.Size.X.Offset or 1)
else
table.insert(aq,at)
end
end

local as=#aq
if as==0 then return end

local at=1/as

local au=ap*(as-1)

local av=-(au+ar)

local aw=math.floor(av/as)
local ax=av-(aw*as)

for ay,az in next,aq do
local aA=aw
if ay<=math.abs(ax)then
aA=aA-1
end

if az.ElementFrame then
az.ElementFrame.Size=UDim2.new(at,aA,1,0)
end
end
end,
am,
aj.UIScale,
aj.Tab
)



return ak.__type,ak
end

return af end function a.Z()

return{
Elements={
Paragraph=a.load'G',
Button=a.load'H',
Toggle=a.load'K',
Slider=a.load'L',
Keybind=a.load'M',
Input=a.load'N',
Dropdown=a.load'Q',
Code=a.load'T',
Colorpicker=a.load'U',
Section=a.load'V',
Divider=a.load'O',
Space=a.load'W',
Image=a.load'X',
Group=a.load'Y',

},
Load=function(aa,ae,af,ah,aj,ak,al,am,an)
for ao,ap in next,af do
aa[ao]=function(aq,ar)
ar=ar or{}
ar.Tab=an or aa
ar.ParentType=aa.__type
ar.ParentTable=aa
ar.Index=#aa.Elements+1
ar.GlobalIndex=#ah.AllElements+1
ar.Parent=ae
ar.Window=ah
ar.HyperUI=aj
ar.UIScale=am
ar.ElementsModule=al local

as, at=ap:New(ar)

if ar.Flag and typeof(ar.Flag)=="string"then
if ah.CurrentConfig then
ah.CurrentConfig:Register(ar.Flag,at)

if ah.PendingConfigData and ah.PendingConfigData[ar.Flag]then
local au=ah.PendingConfigData[ar.Flag]

local av=ah.ConfigManager
if av.Parser[au.__type]then
task.defer(function()
local aw,ax=pcall(function()
av.Parser[au.__type].Load(at,au)
end)

if aw then
ah.PendingConfigData[ar.Flag]=nil
else
warn("[ HyperUI ] Failed to apply pending config for '"..ar.Flag.."': "..tostring(ax))
end
end)
end
end
else
ah.PendingFlags=ah.PendingFlags or{}
ah.PendingFlags[ar.Flag]=at
end
end

local au
for av,aw in next,at do
if typeof(aw)=="table"and av~="ElementFrame"and av:match"Frame$"then
au=aw
break
end
end

if au and au.UIElements then
at.ElementFrame=au.UIElements.Main
function at.SetTitle(av,aw)
au:SetTitle(aw)
end
function at.SetDesc(av,aw)
au:SetDesc(aw)
end
function at.Highlight(av)
au:Highlight()
end
function at.Destroy(av)
au:Destroy()

table.remove(ah.AllElements,ar.GlobalIndex)
table.remove(aa.Elements,ar.Index)
table.remove(an.Elements,ar.Index)
aa:UpdateAllElementShapes(aa)
end
end



ah.AllElements[ar.Index]=at
aa.Elements[ar.Index]=at
if an then an.Elements[ar.Index]=at end

if ah.NewElements then
aa:UpdateAllElementShapes(aa)
end

if ak then
ak(at,aa.Elements)
end
return at
end
end
function aa.UpdateAllElementShapes(ao,ap)
for aq,ar in next,ap.Elements do
local as
for at,au in pairs(ar)do
if typeof(au)=="table"and at:match"Frame$"then
as=au
break
end
end

if as then

as.Index=aq
if as.UpdateShape then

as.UpdateShape(ap)
end
end
end
end
end,

}end function a._()

local aa=(cloneref or clonereference or function(aa)return aa end)

aa(game:GetService"UserInputService")
local ae=game.Players.LocalPlayer:GetMouse()

local af=a.load'c'
local ah=af.New

local aj=a.load'E'.New
local ak=a.load'x'.New





local al={


Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(al)end
}

function al.Init(am,an,ao,ap)
Window=am
HyperUI=an
al.ToolTipParent=ao
al.TabHighlight=ap
return al
end

function al.New(am,an)
local ao={
__type="Tab",
Title=am.Title or"Tab",
Desc=am.Desc,
Icon=am.Icon,
IconColor=am.IconColor,
IconShape=am.IconShape,
IconThemed=am.IconThemed,
Locked=am.Locked,
ShowTabTitle=am.ShowTabTitle,
Border=am.Border,
Selected=false,
Index=nil,
Parent=am.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=Window.UICorner-(Window.UIPadding/2),

Gap=Window.NewElements and 1 or 6,

TabPaddingX=4+(Window.UIPadding/2),
TabPaddingY=3+(Window.UIPadding/2),
TitlePaddingY=0,
}

if ao.IconShape then
ao.TabPaddingX=2+(Window.UIPadding/4)
ao.TabPaddingY=2+(Window.UIPadding/4)
ao.TitlePaddingY=2+(Window.UIPadding/4)
end

al.TabCount=al.TabCount+1

local ap=al.TabCount
ao.Index=ap

ao.UIElements.Main=af.NewRoundFrame(ao.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=am.Parent,
ThemeTag={
ImageColor3="TabBackground",
},
ImageTransparency=1,
},{
af.NewRoundFrame(ao.UICorner,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="TabBorder",
},
ImageTransparency=1,
Name="Outline"
},{













}),
af.NewRoundFrame(ao.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Frame",
},{
ah("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,2+(Window.UIPadding/2)),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ah("TextLabel",{
Text=ao.Title,
ThemeTag={
TextColor3="TabTitle"
},
TextTransparency=not ao.Locked and 0.4 or.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
},{
ah("UIPadding",{
PaddingTop=UDim.new(0,ao.TitlePaddingY),


PaddingBottom=UDim.new(0,ao.TitlePaddingY)
})
}),
ah("UIPadding",{
PaddingTop=UDim.new(0,ao.TabPaddingY),
PaddingLeft=UDim.new(0,ao.TabPaddingX),
PaddingRight=UDim.new(0,ao.TabPaddingX),
PaddingBottom=UDim.new(0,ao.TabPaddingY),
})
}),
},true)

local aq=0
local ar
local as

if ao.Icon then
ar=af.Image(
ao.Icon,
ao.Icon..":"..ao.Title,
0,
Window.Folder,
ao.__type,
ao.IconColor and false or true,
ao.IconThemed,
"TabIcon"
)
ar.Size=UDim2.new(0,16,0,16)
if ao.IconColor then
ar.ImageLabel.ImageColor3=ao.IconColor
end

if not ao.IconShape and not ao.IconColor then
ar.Parent=ao.UIElements.Main.Frame
ao.UIElements.Icon=ar
ar.ImageLabel.ImageTransparency=not ao.Locked and 0 or.7
aq=-18-(Window.UIPadding/2)
ao.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,aq,0,0)
else
local at=ao.IconShape or"Squircle"
af.NewRoundFrame(at~="Circle"and(ao.UICorner+5-(2+(Window.UIPadding/4)))or 9999,at,{
Size=UDim2.new(0,26,0,26),
ImageColor3=ao.IconColor or Color3.fromRGB(100,100,100),
Parent=ao.UIElements.Main.Frame
},{
ar,
af.NewRoundFrame(at~="Circle"and(ao.UICorner+5-(2+(Window.UIPadding/4)))or 9999,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=0,
Name="Outline"
},{}),
})
ar.AnchorPoint=Vector2.new(0.5,0.5)
ar.Position=UDim2.new(0.5,0,0.5,0)
ar.ImageLabel.ImageTransparency=0
if ao.IconColor then
ar.ImageLabel.ImageColor3=af.GetTextColorForHSB(ao.IconColor,0.68)
end
aq=-28-(Window.UIPadding/2)
ao.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,aq,0,0)
ao.UIElements.Icon=ar
end





as=af.Image(
ao.Icon,
ao.Icon..":"..ao.Title,
0,
Window.Folder,
ao.__type,
true,
ao.IconThemed
)
as.Size=UDim2.new(0,16,0,16)
as.ImageLabel.ImageTransparency=not ao.Locked and 0 or.7
aq=-30




end

ao.UIElements.ContainerFrame=ah("ScrollingFrame",{
Size=UDim2.new(1,0,1,ao.ShowTabTitle and-((Window.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
ah("UIPadding",{
PaddingTop=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingLeft=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingRight=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingBottom=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
}),
ah("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,ao.Gap),
HorizontalAlignment="Center",
})
})





ao.UIElements.ContainerFrameCanvas=ah("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=Window.UIElements.MainBar,
ZIndex=5,
},{
ao.UIElements.ContainerFrame,
ah("Frame",{
Size=UDim2.new(1,0,0,((Window.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=ao.ShowTabTitle or false,
Name="TabTitle"
},{
as,
ah("TextLabel",{
Text=ao.Title,
ThemeTag={
TextColor3="Text"
},
TextSize=20,
TextTransparency=.1,
Size=UDim2.new(1,-aq,1,0),
FontFace=Font.new(af.Font,Enum.FontWeight.SemiBold),
TextTruncate="AtEnd",
RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
ah("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
ah("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
ah("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
},
Position=UDim2.new(0,0,0,((Window.UIPadding*2.4)+12)),
Visible=ao.ShowTabTitle or false,
})
})

al.Containers[ap]=ao.UIElements.ContainerFrameCanvas
al.Tabs[ap]=ao

ao.ContainerFrame=ao.UIElements.ContainerFrameCanvas

af.AddSignal(ao.UIElements.Main.MouseButton1Click,function()
if not ao.Locked then
al:SelectTab(ap)
end
end)

if Window.ScrollBarEnabled then
ak(ao.UIElements.ContainerFrame,ao.UIElements.ContainerFrameCanvas,Window,3)
end

local at
local au
local av
local aw=false



if ao.Desc then


af.AddSignal(ao.UIElements.Main.InputBegan,function()
aw=true
au=task.spawn(function()
task.wait(0.35)
if aw and not at then
at=aj(ao.Desc,al.ToolTipParent,true)
at.Container.AnchorPoint=Vector2.new(0.5,0.5)

local function updatePosition()
if at then
at.Container.Position=UDim2.new(0,ae.X,0,ae.Y-4)
end
end

updatePosition()
av=ae.Move:Connect(updatePosition)
at:Open()
end
end)
end)

end

af.AddSignal(ao.UIElements.Main.MouseEnter,function()
if not ao.Locked then
af.SetThemeTag(ao.UIElements.Main.Frame,{
ImageTransparency="TabBackgroundHoverTransparency",
ImageColor3="TabBackgroundHover",
},0.08)
end
end)
af.AddSignal(ao.UIElements.Main.InputEnded,function()
if ao.Desc then
aw=false
if au then
task.cancel(au)
au=nil
end
if av then
av:Disconnect()
av=nil
end
if at then
at:Close()
at=nil
end
end

if not ao.Locked then
af.SetThemeTag(ao.UIElements.Main.Frame,{
ImageTransparency="TabBorderTransparency"
},0.08)
end
end)



function ao.ScrollToTheElement(ax,ay)
ao.UIElements.ContainerFrame.ScrollingEnabled=false

af.Tween(ao.UIElements.ContainerFrame,0.45,{
CanvasPosition=Vector2.new(
0,
ao.Elements[ay].ElementFrame.AbsolutePosition.Y
-ao.UIElements.ContainerFrame.AbsolutePosition.Y
-ao.UIElements.ContainerFrame.UIPadding.PaddingTop.Offset
)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.48)

if ao.Elements[ay].Highlight then
ao.Elements[ay]:Highlight()
end
ao.UIElements.ContainerFrame.ScrollingEnabled=true
end)

return ao
end





local ax=a.load'Z'

ax.Load(ao,ao.UIElements.ContainerFrame,ax.Elements,Window,HyperUI,nil,ax,an)



function ao.LockAll(ay)

for az,aA in next,Window.AllElements do
if aA.Tab and aA.Tab.Index and aA.Tab.Index==ao.Index and aA.Lock then
aA:Lock()
end
end
end
function ao.UnlockAll(ay)
for az,aA in next,Window.AllElements do
if aA.Tab and aA.Tab.Index and aA.Tab.Index==ao.Index and aA.Unlock then
aA:Unlock()
end
end
end
function ao.GetLocked(ay)
local az={}

for aA,aB in next,Window.AllElements do
if aB.Tab and aB.Tab.Index and aB.Tab.Index==ao.Index and aB.Locked==true then
table.insert(az,aB)
end
end

return az
end
function ao.GetUnlocked(ay)
local az={}

for aA,aB in next,Window.AllElements do
if aB.Tab and aB.Tab.Index and aB.Tab.Index==ao.Index and aB.Locked==false then
table.insert(az,aB)
end
end

return az
end

function ao.Select(ay)
return al:SelectTab(ao.Index)
end

task.spawn(function()
local ay=ah("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=ao.UIElements.ContainerFrame
},{
ah("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),
ah("ImageLabel",{
Size=UDim2.new(0,48,0,48),
Image=af.Icon"frown"[1],
ImageRectOffset=af.Icon"frown"[2].ImageRectPosition,
ImageRectSize=af.Icon"frown"[2].ImageRectSize,
ThemeTag={
ImageColor3="Icon"
},
BackgroundTransparency=1,
ImageTransparency=.6,
}),
ah("TextLabel",{
AutomaticSize="XY",
Text="This tab is empty",
ThemeTag={
TextColor3="Text"
},
TextSize=18,
TextTransparency=.5,
BackgroundTransparency=1,
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
})
})





local az
az=af.AddSignal(ao.UIElements.ContainerFrame.ChildAdded,function()
ay.Visible=false
az:Disconnect()
end)
end)

return ao
end

function al.OnChange(am,an)
al.OnChangeFunc=an
end

function al.SelectTab(am,an)
local ao=al.Tabs[an]
if not ao or ao.Locked then return end

al.SelectedTab=an

for ap,aq in next,al.Tabs do
if not aq.Locked then
local ar=aq.UIElements.Main
local as=ar:FindFirstChild"Frame"

af.SetThemeTag(ar,{
ImageTransparency="TabBorderTransparency"
},0.15)

if aq.Border and ar:FindFirstChild"Outline"then
af.SetThemeTag(ar.Outline,{
ImageTransparency="TabBorderTransparency"
},0.15)
end

if as then
local at=as:FindFirstChild"TextLabel"
if at then
af.SetThemeTag(at,{
TextTransparency="TabTextTransparency"
},0.15)
end

local au=aq.UIElements.Icon
if au and au:FindFirstChild"ImageLabel"and not aq.IconColor then
af.SetThemeTag(au.ImageLabel,{
ImageTransparency="TabIconTransparency"
},0.15)
end
end
aq.Selected=false
end
end

local ap=ao.UIElements.Main
local aq=ap:FindFirstChild"Frame"

af.SetThemeTag(ap,{
ImageTransparency="TabBackgroundActiveTransparency"
},0.15)

if ao.Border and ap:FindFirstChild"Outline"then
af.SetThemeTag(ap.Outline,{
ImageTransparency="TabBorderTransparencyActive"
},0.15)
end

if aq then
local ar=aq:FindFirstChild"TextLabel"
if ar then
af.SetThemeTag(ar,{
TextTransparency="TabTextTransparencyActive"
},0.15)
end

local as=ao.UIElements.Icon
if as and as:FindFirstChild"ImageLabel"and not ao.IconColor then
af.SetThemeTag(as.ImageLabel,{
ImageTransparency="TabIconTransparencyActive"
},0.15)
end
end
ao.Selected=true

task.spawn(function()
for ar,as in next,al.Containers do
as.AnchorPoint=Vector2.new(0,0.05)
as.Visible=false
end
al.Containers[an].Visible=true
local ar=game:GetService"TweenService"

local as=TweenInfo.new(
0.15,
Enum.EasingStyle.Quart,
Enum.EasingDirection.Out
)
local at=ar:Create(al.Containers[an],as,{
AnchorPoint=Vector2.new(0,0)
})
at:Play()
end)

al.OnChangeFunc(an)
end

return al end function a.aa()

local aa={}


local ae=a.load'c'
local af=ae.New
local ah=ae.Tween

local aj=a.load'_'

function aa.New(ak,al,am,an,ao)
local ap={
Title=ak.Title or"Section",
Icon=ak.Icon,
IconThemed=ak.IconThemed,
Opened=ak.Opened or false,

HeaderSize=42,
IconSize=18,

Expandable=false,
}

local aq
if ap.Icon then
aq=ae.Image(
ap.Icon,
ap.Icon,
0,
am,
"Section",
true,
ap.IconThemed
)

aq.Size=UDim2.new(0,ap.IconSize,0,ap.IconSize)
aq.ImageLabel.ImageTransparency=.25
end

local ar=af("Frame",{
Size=UDim2.new(0,ap.IconSize,0,ap.IconSize),
BackgroundTransparency=1,
Visible=false
},{
af("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=ae.Icon"chevron-down"[1],
ImageRectSize=ae.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=ae.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})

local as=af("Frame",{
Size=UDim2.new(1,0,0,ap.HeaderSize),
BackgroundTransparency=1,
Parent=al,
ClipsDescendants=true,
},{
af("TextButton",{
Size=UDim2.new(1,0,0,ap.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
aq,
af("TextLabel",{
Text=ap.Title,
TextXAlignment="Left",
Size=UDim2.new(
1,
aq and(-ap.IconSize-10)*2
or(-ap.IconSize-10),

1,
0
),
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold),
TextSize=14,
BackgroundTransparency=1,
TextTransparency=.7,

TextWrapped=true
}),
af("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10)
}),
ar,
af("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
})
}),
af("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,ap.HeaderSize)
},{
af("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,ao.Gap),
VerticalAlignment="Bottom",
}),
})
})


function ap.Tab(at,au)
if not ap.Expandable then
ap.Expandable=true
ar.Visible=true
end
au.Parent=as.Content
return aj.New(au,an)
end

function ap.Open(at)
if ap.Expandable then
ap.Opened=true
ah(as,0.33,{
Size=UDim2.new(1,0,0,ap.HeaderSize+(as.Content.AbsoluteSize.Y/an))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ah(ar.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function ap.Close(at)
if ap.Expandable then
ap.Opened=false
ah(as,0.26,{
Size=UDim2.new(1,0,0,ap.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ah(ar.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

ae.AddSignal(as.TextButton.MouseButton1Click,function()
if ap.Expandable then
if ap.Opened then
ap:Close()
else
ap:Open()
end
end
end)

ae.AddSignal(as.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if ap.Opened then
ap:Open()
end
end)

if ap.Opened then
task.spawn(function()
task.wait()
ap:Open()
end)
end



return ap
end


return aa end function a.ab()

return{
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
}end function a.ac()

local aa=(cloneref or clonereference or function(aa)return aa end)

aa(game:GetService"UserInputService")

local ae={
Margin=8,
Padding=9,
}


local af=a.load'c'
local ah=af.New
local aj=af.Tween


function ae.new(ak,al,am)
local an={
IconSize=18,
Padding=14,
Radius=22,
Width=400,
MaxHeight=380,

Icons=a.load'ab'
}


local ao=ah("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(
1,
-((an.IconSize*2)+(an.Padding*2)),
0,
0
),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(af.Font,Enum.FontWeight.Regular),
TextSize=18,
})

local ap=ah("ImageLabel",{
Image=af.Icon"x"[1],
ImageRectSize=af.Icon"x"[2].ImageRectSize,
ImageRectOffset=af.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.1,
Size=UDim2.new(0,an.IconSize,0,an.IconSize)
},{
ah("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})

local aq=ah("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false
},{
ah("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
ah("UIPadding",{
PaddingTop=UDim.new(0,an.Padding),
PaddingLeft=UDim.new(0,an.Padding),
PaddingRight=UDim.new(0,an.Padding),
PaddingBottom=UDim.new(0,an.Padding),
})
})

local ar=af.NewRoundFrame(an.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="WindowSearchBarBackground",
},
ImageTransparency=0,
},{
af.NewRoundFrame(an.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
ThemeTag={
ImageColor3="White",
},
ImageTransparency=1,
Name="Frame",
},{
ah("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








ah("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ah("ImageLabel",{
Image=af.Icon"search"[1],
ImageRectSize=af.Icon"search"[2].ImageRectSize,
ImageRectOffset=af.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.1,
Size=UDim2.new(0,an.IconSize,0,an.IconSize)
}),
ao,
ap,
ah("UIListLayout",{
Padding=UDim.new(0,an.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ah("UIPadding",{
PaddingLeft=UDim.new(0,an.Padding),
PaddingRight=UDim.new(0,an.Padding),
})
})
}),
ah("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
ah("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=.9,
Visible=false,
}),
aq,
ah("UISizeConstraint",{
MaxSize=Vector2.new(an.Width,an.MaxHeight),
}),
}),
ah("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
})
})

local as=ah("Frame",{
Size=UDim2.new(0,an.Width,0,0),
AutomaticSize="Y",
Parent=al,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
ah("UIScale",{
Scale=.9,
}),
ar,
af.NewRoundFrame(an.Radius,"Glass-0.7",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,


ThemeTag={
ImageColor3="SearchBarBorder",
ImageTransparency="SearchBarBorderTransparency",
},
Name="Outline",
}),
})

local function CreateSearchTab(at,au,av,aw,ax,ay)
local az=ah("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=aw or nil
},{
af.NewRoundFrame(an.Radius-11,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main"
},{
af.NewRoundFrame(an.Radius-11,"Glass-1",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=1,
Name="Outline",
},{








ah("UIPadding",{
PaddingTop=UDim.new(0,an.Padding-2),
PaddingLeft=UDim.new(0,an.Padding),
PaddingRight=UDim.new(0,an.Padding),
PaddingBottom=UDim.new(0,an.Padding-2),
}),
ah("ImageLabel",{
Image=af.Icon(av)[1],
ImageRectSize=af.Icon(av)[2].ImageRectSize,
ImageRectOffset=af.Icon(av)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.1,
Size=UDim2.new(0,an.IconSize,0,an.IconSize)
}),
ah("Frame",{
Size=UDim2.new(1,-an.IconSize-an.Padding,0,0),
BackgroundTransparency=1,
},{
ah("TextLabel",{
Text=at,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title"
}),
ah("TextLabel",{
Text=au or"",
Visible=au and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=.3,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc"
})or nil,
ah("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
})
}),
ah("UIListLayout",{
Padding=UDim.new(0,an.Padding),
FillDirection="Horizontal",
})
}),
},true),
ah("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-an.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=ax,

},{
af.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=.9,
}),
ah("Frame",{
Size=UDim2.new(1,-an.Padding-2,0,0),
Position=UDim2.new(0,an.Padding+2,0,0),
BackgroundTransparency=1,
},{
ah("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
ah("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right"
})
})



az.Main.Size=UDim2.new(
1,
0,
0,
az.Main.Outline.Frame.Desc.Visible and(((an.Padding-2)*2)+az.Main.Outline.Frame.Title.TextBounds.Y+6+az.Main.Outline.Frame.Desc.TextBounds.Y)
or(((an.Padding-2)*2)+az.Main.Outline.Frame.Title.TextBounds.Y)
)

af.AddSignal(az.Main.MouseEnter,function()
aj(az.Main,.04,{ImageTransparency=.95}):Play()
aj(az.Main.Outline,.04,{ImageTransparency=.75}):Play()
end)
af.AddSignal(az.Main.InputEnded,function()
aj(az.Main,.08,{ImageTransparency=1}):Play()
aj(az.Main.Outline,.08,{ImageTransparency=1}):Play()
end)
af.AddSignal(az.Main.MouseButton1Click,function()
if ay then
ay()
end
end)

return az
end

local function ContainsText(at,au)
if not au or au==""then
return false
end

if not at or at==""then
return false
end

local av=string.lower(at)
local aw=string.lower(au)

return string.find(av,aw,1,true)~=nil
end

local function Search(at)
if not at or at==""then
return{}
end

local au={}
for av,aw in next,ak.Tabs do
local ax=ContainsText(aw.Title or"",at)
local ay={}

for az,aA in next,aw.Elements do
if aA.__type~="Section"then
local aB=ContainsText(aA.Title or"",at)
local b=ContainsText(aA.Desc or"",at)

if aB or b then
ay[az]={
Title=aA.Title,
Desc=aA.Desc,
Original=aA,
__type=aA.__type,
Index=az,
}
end
end
end

if ax or next(ay)~=nil then
au[av]={
Tab=aw,
Title=aw.Title,
Icon=aw.Icon,
Elements=ay,
}
end
end
return au
end

function an.Search(at,au)
au=au or""

local av=Search(au)

aq.Visible=true
ar.Frame.Results.Frame.Visible=true
for aw,ax in next,aq:GetChildren()do
if ax.ClassName~="UIListLayout"and ax.ClassName~="UIPadding"then
ax:Destroy()
end
end

if av and next(av)~=nil then
for aw,ax in next,av do
local ay=an.Icons.Tab
local az=CreateSearchTab(ax.Title,nil,ay,aq,true,function()
an:Close()
ak:SelectTab(aw)
end)
if ax.Elements and next(ax.Elements)~=nil then
for aA,aB in next,ax.Elements do
local b=an.Icons[aB.__type]
CreateSearchTab(aB.Title,aB.Desc,b,az:FindFirstChild"ParentContainer"and az.ParentContainer.Frame or nil,false,function()
an:Close()
ak:SelectTab(aw)
if ax.Tab.ScrollToTheElement then

ax.Tab:ScrollToTheElement(aB.Index)
end

end)

end
end
end
elseif au~=""then
ah("TextLabel",{
Size=UDim2.new(1,0,0,70),
BackgroundTransparency=1,
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=.2,
BackgroundTransparency=1,
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
Parent=aq,
Name="NotFound",
})
else
aq.Visible=false
ar.Frame.Results.Frame.Visible=false
end
end

af.AddSignal(ao:GetPropertyChangedSignal"Text",function()
an:Search(ao.Text)
end)

af.AddSignal(aq.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

aj(aq,.06,{Size=UDim2.new(
1,
0,
0,
math.clamp(aq.UIListLayout.AbsoluteContentSize.Y+(an.Padding*2),0,an.MaxHeight)
)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function an.Open(at)
task.spawn(function()
ar.Frame.Visible=true
as.Visible=true
aj(as.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function an.Close(at,au)
task.spawn(function()
am()
ar.Frame.Visible=false
aj(as.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.12)
as.Visible=false
if au then as:Destroy()end
end)
end

af.AddSignal(ap.TextButton.MouseButton1Click,function()
an:Close(true)
end)

an:Open()

return an
end

return ae end function a.ad()

local aa={}

local ae=a.load'c'
local af=ae.New local ah=
ae.Tween

local aj=game:GetService"RunService"
local ak=game:GetService"Stats"
local al=game:GetService"Players"
local am=al.LocalPlayer

function aa.Init(an)
local ao=af("Frame",{
Name="StatsWidget",
Size=UDim2.new(0,0,0,40),
Position=UDim2.new(0.5,0,0,20),
AnchorPoint=Vector2.new(0.5,0),
BackgroundColor3=Color3.fromRGB(0,0,0),
BackgroundTransparency=0.2,
Parent=an.Parent,
AutomaticSize=Enum.AutomaticSize.X,
},{
af("UICorner",{
CornerRadius=UDim.new(0,10),
}),
af("UIStroke",{
Thickness=1,
Transparency=0.5,
ThemeTag={
Color="Accent",
}
}),
af("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,12),
HorizontalAlignment=Enum.HorizontalAlignment.Center,
}),
af("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
})
})


local ap=af("ImageLabel",{
Size=UDim2.new(0,24,0,24),
BackgroundTransparency=1,
Image="",
},{
af("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

local aq=af("TextLabel",{
Text=am.DisplayName,
TextSize=14,
FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold),
TextColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.XY,
})


task.spawn(function()
local ar,as=al:GetUserThumbnailAsync(
am.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)
if as then
ap.Image=ar
end
end)


local function MakeSeparator()
return af("Frame",{
Size=UDim2.new(0,1,0,20),
BackgroundTransparency=0.8,
BackgroundColor3=Color3.fromRGB(255,255,255),
})
end


local function CreateStat(ar,as)
local at=af("Frame",{
Size=UDim2.new(0,0,0,24),
BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.X,
},{
af("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,4),
}),
af("ImageLabel",{
Size=UDim2.new(0,16,0,16),
Image=ae.Icon(ar)[1],
ImageRectOffset=ae.Icon(ar)[2].ImageRectPosition,
ImageRectSize=ae.Icon(ar)[2].ImageRectSize,
BackgroundTransparency=1,
ThemeTag={ImageColor3="Icon"},
}),
af("TextLabel",{
Text=as,
TextSize=13,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
TextColor3=Color3.fromRGB(200,200,200),
BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.XY,
})
})
return at,at:FindFirstChildWhichIsA"TextLabel"
end



local ar=af("Frame",{
Size=UDim2.new(0,0,0,24),
BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.X,
},{
af("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,4),
}),
af("ImageLabel",{
Size=UDim2.new(0,16,0,16),
Image=ae.Icon"clock"[1],
ImageRectOffset=ae.Icon"clock"[2].ImageRectPosition,
ImageRectSize=ae.Icon"clock"[2].ImageRectSize,
BackgroundTransparency=1,
ThemeTag={ImageColor3="Icon"},
}),
})

local as=af("TextLabel",{
Text="00:00:00",
TextSize=13,
FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold),

TextColor3=Color3.fromRGB(180,210,255),
BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.XY,
Parent=ar,
})


local function GetLocalTime()

return os.date"%H:%M:%S"
end


local at=(identifyexecutor and identifyexecutor())or"Unknown"local
au=CreateStat("cpu",at)
local av,aw=CreateStat("wifi","0ms")
local ax,ay=CreateStat("activity","0 FPS")
local az,aA=CreateStat("database","0MB")


local aB=af("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
LayoutOrder=1,
})

if an.Icon then
local b=ae.Image(
an.Icon,
an.Title,
an.IconRadius or 0,
an.Folder,
"FooterIcon",
true,
an.IconThemed,
"WindowTopbarIcon"
)
b.Size=UDim2.new(1,0,1,0)
b.Parent=aB
end


aB.Parent=ao
MakeSeparator().Parent=ao
ap.Parent=ao
aq.Parent=ao
MakeSeparator().Parent=ao
au.Parent=ao
av.Parent=ao
ax.Parent=ao
az.Parent=ao
MakeSeparator().Parent=ao
ar.Parent=ao


local b=0
local d=0
local f=tick()

aj.RenderStepped:Connect(function()
d=d+1
local g=tick()


if g-f>=1 then
ay.Text=tostring(d).." FPS"
d=0
f=g
end


if g-b>=1 then
b=g


local h,j=pcall(function()
return math.round(ak.Network.ServerStatsItem["Data Ping"]:GetValue())
end)
aw.Text=(h and tostring(j).."ms")or"?ms"


aA.Text=tostring(math.round(ak:GetTotalMemoryUsageMb())).."MB"


as.Text=GetLocalTime()
end
end)

ae.Drag(ao)


an._FooterCloseCallback=function()

end
an._FooterOpenCallback=function()

end


an._FooterDestroyCallback=function()
ao:Destroy()
end

return ao
end

return aa end function a.ae()
local aa=(cloneref or clonereference or function(aa)return aa end)

local ae=aa(game:GetService"UserInputService")
local af=aa(game:GetService"RunService")
aa(game:GetService"Players")

local ah=workspace.CurrentCamera

local aj=a.load't'

local ak=a.load'c'
local al=ak.New
local am=ak.Tween


local an=a.load'w'.New
local ao=a.load'l'.New
local ap=a.load'x'.New
local aq=a.load'y'

local ar=a.load'z'
local as=a.load'A'
local at=a.load'B'
local au=a.load'C'



return function(av)
local aw=av.HyperUI
local ax={
Title=av.Title or"UI Library",
Author=av.Author,
Icon=av.Icon,
IconSize=av.IconSize or 22,
IconThemed=av.IconThemed,
IconRadius=av.IconRadius or 0,
Folder=av.Folder,
Resizable=av.Resizable~=false,
Background=av.Background,
BackgroundImageTransparency=av.BackgroundImageTransparency or 0,
ShadowTransparency=av.ShadowTransparency or 0.7,
User=av.User or{},
Footer=av.Footer or{},
Topbar=av.Topbar or{Height=52,ButtonsType="Default"},

Size=av.Size,

MinSize=av.MinSize or Vector2.new(560,350),
MaxSize=av.MaxSize or Vector2.new(850,560),

SideBarWidth=av.SideBarWidth or 200,
TopBarButtonIconSize=av.TopBarButtonIconSize or 22,

ToggleKey=av.ToggleKey,
ElementsRadius=av.ElementsRadius,
Radius=av.Radius or 16,
Transparent=av.Transparent or false,
HideSearchBar=av.HideSearchBar==true,
ScrollBarEnabled=av.ScrollBarEnabled or false,
SideBarWidth=av.SideBarWidth or 200,
Acrylic=av.Acrylic or false,
NewElements=av.NewElements or false,
IgnoreAlerts=av.IgnoreAlerts or false,
HidePanelBackground=av.HidePanelBackground or false,
AutoScale=av.AutoScale~=false,
OpenButton=av.OpenButton,

Position=UDim2.new(0.5,0,0.5,0),
UICorner=nil,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=av.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=av.Resizable~=false,
IsOpenButtonEnabled=true,

CurrentConfig=nil,
ConfigManager=nil,
AcrylicPaint=nil,
CurrentTab=nil,
TabModule=nil,

OnOpenCallback=nil,
OnCloseCallback=nil,
OnDestroyCallback=nil,

IsPC=false,

Gap=5,

TopBarButtons={},
AllElements={},

ElementConfig={},

PendingFlags={},

IsToggleDragging=false,
}

ax.UICorner=ax.Radius

ax.TopBarButtonIconSize=ax.TopBarButtonIconSize or(ax.Topbar.ButtonsType=="Mac"and 9 or 22)

ax.ElementConfig={
UIPadding=(ax.NewElements and 10 or 13),
UICorner=ax.ElementsRadius or(ax.NewElements and 23 or 12),
}

local ay=ax.Size or UDim2.new(0,580,0,460)
ax.Size=UDim2.new(
ay.X.Scale,
math.clamp(ay.X.Offset,ax.MinSize.X,ax.MaxSize.X),
ay.Y.Scale,
math.clamp(ay.Y.Offset,ax.MinSize.Y,ax.MaxSize.Y)
)

if ax.Topbar=={}then
ax.Topbar={Height=52,ButtonsType="Default"}
end

if not af:IsStudio()and ax.Folder and writefile then
ax.Folder=ak.SanitizeFilename(ax.Folder)
if not isfolder("HyperUI/"..ax.Folder)then
makefolder("HyperUI/"..ax.Folder)
end
if not isfolder("HyperUI/"..ax.Folder.."/assets")then
makefolder("HyperUI/"..ax.Folder.."/assets")
end
end

local az=al("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner)
})

if ax.Folder then
ax.ConfigManager=ar:Init(ax)
end


if ax.Acrylic then local
aA=aj.AcrylicPaint{UseAcrylic=ax.Acrylic}

ax.AcrylicPaint=aA
end

local aA=al("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(.5,.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true
},{
al("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Image="rbxassetid://120997033468887",
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
})
})
local aB=ak.NewRoundFrame(ax.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
al("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=ak.Icon"expand"[1],
ImageRectOffset=ak.Icon"expand"[2].ImageRectPosition,
ImageRectSize=ak.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local b=ak.NewRoundFrame(ax.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})










ax.UIElements.SideBar=al("ScrollingFrame",{
Size=UDim2.new(
1,
ax.ScrollBarEnabled and-3-(ax.UIPadding/2)or 0,
1,
not ax.HideSearchBar and-45 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
al("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
al("UIPadding",{



PaddingBottom=UDim.new(0,ax.UIPadding/2),
}),
al("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,ax.Gap)
})
}),
al("UIPadding",{

PaddingLeft=UDim.new(0,ax.UIPadding/2),
PaddingRight=UDim.new(0,ax.UIPadding/2),

}),

})

ax.UIElements.SideBarContainer=al("Frame",{
Size=UDim2.new(0,ax.SideBarWidth,1,ax.User.Enabled and-ax.Topbar.Height-42-(ax.UIPadding*2)or-ax.Topbar.Height),
Position=UDim2.new(0,0,0,ax.Topbar.Height),
BackgroundTransparency=1,
Visible=true,
},{
al("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(
1,
0,
1,
not ax.HideSearchBar and-45-ax.UIPadding/2 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
}),
ax.UIElements.SideBar,
})

if ax.ScrollBarEnabled then
ap(ax.UIElements.SideBar,ax.UIElements.SideBarContainer.Content,ax,3)
end


ax.UIElements.MainBar=al("Frame",{
Size=UDim2.new(1,-ax.UIElements.SideBarContainer.AbsoluteSize.X,1,-ax.Topbar.Height),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
ak.NewRoundFrame(ax.UICorner-(ax.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="PanelBackground",
ImageTransparency="PanelBackgroundTransparency",
},


ZIndex=3,
Name="Background",
Visible=not ax.HidePanelBackground
}),
al("UIPadding",{

PaddingLeft=UDim.new(0,ax.UIPadding/2),
PaddingRight=UDim.new(0,ax.UIPadding/2),
PaddingBottom=UDim.new(0,ax.UIPadding/2),
})
})

local d=al("ImageLabel",{
Image="rbxassetid://8992230677",
ThemeTag={
ImageColor3="WindowShadow",

},
ImageTransparency=1,
Size=UDim2.new(1,120,1,116),
Position=UDim2.new(0,-60,0,-58),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})



if ae.TouchEnabled and not ae.KeyboardEnabled then
ax.IsPC=false
elseif ae.KeyboardEnabled then
ax.IsPC=true
else
ax.IsPC=nil
end










local f=au.Init(ax,av)

local g
local h


local j=false
local l

local m=typeof(ax.Background)=="string"and string.match(ax.Background,"^video:(.+)")or nil
local p=typeof(ax.Background)=="string"and not m and string.match(ax.Background,"^https?://.+")or nil

local function GetImageExtension(r)
local u=r:match"%.(%w+)$"or r:match"%.(%w+)%?"
if u then
u=u:lower()
if u=="jpg"or u=="jpeg"or u=="png"or u=="webp"then
return"."..u
end
end
return".png"
end

if typeof(ax.Background)=="string"and m then
j=true

if string.find(m,"http")then
local r=ax.Folder.."/assets/."..ak.SanitizeFilename(m)..".webm"
if not isfile(r)then
local u,v=pcall(function()
local u=ak.Request{Url=m,Method="GET",Headers={["User-Agent"]="Roblox/Exploit"}}
writefile(r,u.Body)
end)
if not u then
warn("[ HyperUI.Window.Background ] Failed to download video: "..tostring(v))
return
end
end

local u,v=pcall(function()
return getcustomasset(r)
end)
if not u then
warn("[ HyperUI.Window.Background ] Failed to load custom asset: "..tostring(v))
return
end
warn"[ HyperUI.Window.Background ] VideoFrame may not work with custom video"
m=v
end

l=al("VideoFrame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Video=m,
Looped=true,
Volume=0,
},{
al("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner)
}),
})
l:Play()

elseif p then
local r=ax.Folder.."/assets/."..ak.SanitizeFilename(p)..GetImageExtension(p)
if not isfile(r)then
local u,v=pcall(function()
local u=ak.Request{Url=p,Method="GET",Headers={["User-Agent"]="Roblox/Exploit"}}
writefile(r,u.Body)
end)
if not u then
warn("[ Window.Background ] Failed to download image: "..tostring(v))
return
end
end

local u,v=pcall(function()
return getcustomasset(r)
end)
if not u then
warn("[ Window.Background ] Failed to load custom asset: "..tostring(v))
return
end

l=al("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=v,
ImageTransparency=0,
ScaleType="Crop",
},{
al("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner)
}),
})

elseif ax.Background then
l=al("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=typeof(ax.Background)=="string"and ax.Background or"",
ImageTransparency=1,
ScaleType="Crop",
},{
al("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner)
}),
})
end


local r=ak.NewRoundFrame(99,"Squircle",{
ImageTransparency=.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,0,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
al("TextButton",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
Name="Frame",
})
})

function createAuthor(u)
return al("TextLabel",{
Text=u,
FontFace=Font.new(ak.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.35,
AutomaticSize="XY",
Parent=ax.UIElements.Main and ax.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="WindowTopbarAuthor"
},
Name="Author",
})
end

local u
local v

if ax.Author then
u=createAuthor(ax.Author)
end


local x=al("TextLabel",{
Text=ax.Title,
FontFace=Font.new(ak.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="WindowTopbarTitle"
}
})

local z=al("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
Name="TitleRow",
LayoutOrder=1,
},{
al("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,8),
SortOrder="LayoutOrder"
}),
x,
al("TextLabel",{
Text="|",
FontFace=Font.new(ak.Font,Enum.FontWeight.ExtraLight),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Separator",
TextXAlignment="Center",
TextSize=16,
ThemeTag={
TextColor3="Text"
},
TextTransparency=0.5,
LayoutOrder=1,
})
})


if av.Tags and typeof(av.Tags)=="table"then
task.spawn(function()
task.wait(0.1)
for A,B in ipairs(av.Tags)do
if B.Title then
local C=B.Color or Color3.fromRGB(100,200,255)
al("Frame",{
AutomaticSize="XY",
BackgroundColor3=C,
BackgroundTransparency=0.85,
Parent=z,
LayoutOrder=10,
},{
al("UICorner",{
CornerRadius=UDim.new(0,6),
}),
al("UIStroke",{
Color=C,
Thickness=1,
Transparency=0.5,
}),
al("UIPadding",{
PaddingLeft=UDim.new(0,6),
PaddingRight=UDim.new(0,6),
PaddingTop=UDim.new(0,2),
PaddingBottom=UDim.new(0,2),
}),
al("TextLabel",{
Text=B.Title,
TextSize=11,
FontFace=Font.new(ak.Font,Enum.FontWeight.Bold),
TextColor3=C,
BackgroundTransparency=1,
AutomaticSize="XY",
})
})
end
end
end)
end

ax.UIElements.Main=al("Frame",{
Size=ax.Size,
Position=ax.Position,
BackgroundTransparency=1,
Parent=av.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
},{
aw and aw.UIScaleObj or al("UIScale",{Scale=1}),
ax.AcrylicPaint and ax.AcrylicPaint.Frame or nil,
d,
ak.NewRoundFrame(ax.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,-240),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="WindowBackground"
},

},{
l,
r,
aA,



}),
UIStroke,
az,
aB,
b,
al("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
al("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner)
}),
ax.UIElements.SideBarContainer,
ax.UIElements.MainBar,

f,

h,
al("Frame",{
Size=UDim2.new(1,0,0,ax.Topbar.Height),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar"
},{
g,






al("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left"
},{
al("UIListLayout",{
Padding=UDim.new(0,ax.UIPadding+4),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
al("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
al("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Center",
}),
z,
u,
}),
al("UIPadding",{
PaddingLeft=UDim.new(0,4)
})
}),
al("ScrollingFrame",{
Name="Center",
BackgroundTransparency=1,
AutomaticSize="Y",
ScrollBarThickness=0,
ScrollingDirection="X",
AutomaticCanvasSize="X",
CanvasSize=UDim2.new(0,0,0,0),
Size=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
Visible=false,
},{
al("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,ax.UIPadding/2)
})
}),
al("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(ax.Topbar.ButtonsType=="Default"and 1 or 0,0,0.5,0),
AnchorPoint=Vector2.new(ax.Topbar.ButtonsType=="Default"and 1 or 0,0.5),
Name="Right",
},{
al("UIListLayout",{
Padding=UDim.new(0,ax.Topbar.ButtonsType=="Default"and 9 or 0),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),

}),
al("UIPadding",{
PaddingTop=UDim.new(0,ax.UIPadding),
PaddingLeft=UDim.new(0,ax.Topbar.ButtonsType=="Default"and ax.UIPadding or 8),
PaddingRight=UDim.new(0,ax.Topbar.ButtonsType=="Default"and 8 or ax.UIPadding),
PaddingBottom=UDim.new(0,ax.UIPadding),
})
})
})
})

at.Init(ax,av)




local A=ak.Drag(
ax.UIElements.Main,
{ax.UIElements.Main.Main.Topbar,r.Frame},
function(A,B)
if not ax.Closed then
if A and B==r.Frame then
am(r,.1,{ImageTransparency=.35}):Play()
else
am(r,.2,{ImageTransparency=.8}):Play()
end
ax.Position=ax.UIElements.Main.Position
ax.Dragging=A
end
end
)

if not j and ax.Background and typeof(ax.Background)=="table"then

local B=al"UIGradient"
for C,F in next,ax.Background do
B[C]=F
end

ax.UIElements.BackgroundGradient=ak.NewRoundFrame(ax.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
Parent=ax.UIElements.Main.Background,
ImageTransparency=ax.Transparent and av.HyperUI.TransparencyValue or 0
},{
B
})
end














ax.OpenButtonMain=a.load'D'.New(ax)


task.spawn(function()
if ax.Icon then

local B=al("Frame",{
Size=UDim2.new(0,22,0,22),
BackgroundTransparency=1,
Parent=ax.UIElements.Main.Main.Topbar.Left,
})

v=ak.Image(
ax.Icon,
ax.Title,
ax.IconRadius,
ax.Folder,
"Window",
true,
ax.IconThemed,
"WindowTopbarIcon"
)
v.Parent=B
v.Size=UDim2.new(0,ax.IconSize,0,ax.IconSize)
v.Position=UDim2.new(0.5,0,0.5,0)
v.AnchorPoint=Vector2.new(0.5,0.5)

ax.OpenButtonMain:SetIcon(ax.Icon)











else
ax.OpenButtonMain:SetIcon(ax.Icon)

end
end)

function ax.SetToggleKey(B,C)
ax.ToggleKey=C
end

function ax.SetTitle(B,C)
ax.Title=C
x.Text=C
end

function ax.SetAuthor(B,C)
ax.Author=C
if not u then
u=createAuthor(ax.Author)
end

u.Text=C
end

function ax.SetSize(B,C)
if typeof(C)=="UDim2"then
ax.Size=C

am(ax.UIElements.Main,0.08,{Size=C},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end


function ax.SetBackgroundImage(B,C)
ax.UIElements.Main.Background.ImageLabel.Image=C
end
function ax.SetBackgroundImageTransparency(B,C)
if l and l:IsA"ImageLabel"then
l.ImageTransparency=math.floor(C*10+0.5)/10
end
ax.BackgroundImageTransparency=math.floor(C*10+0.5)/10
end

function ax.SetBackgroundTransparency(B,C)
local F=math.floor(tonumber(C)*10+0.5)/10
av.HyperUI.TransparencyValue=F
ax:ToggleTransparency(F>0)
end

local B
local C
ak.Icon"minimize"
ak.Icon"maximize"

ax:CreateTopbarButton("Fullscreen",ax.Topbar.ButtonsType=="Mac"and"rbxassetid://127426072704909"or"solar:full-screen-square-linear",function()
ax:ToggleFullscreen()
end,(ax.Topbar.ButtonsType=="Default"and 998 or 999),true,Color3.fromHex"#60C762",ax.Topbar.ButtonsType=="Mac"and 9 or 26)

function ax.ToggleFullscreen(F)
local G=ax.IsFullscreen

A:Set(G)

if not G then
B=ax.UIElements.Main.Position
C=ax.UIElements.Main.Size

ax.CanResize=false
else
if ax.Resizable then
ax.CanResize=true
end
end

am(ax.UIElements.Main,0.45,{Size=G and C or UDim2.new(1,-20,1,-72)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

am(ax.UIElements.Main,0.45,{Position=G and B or UDim2.new(0.5,0,0.5,26)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()



ax.IsFullscreen=not G
end


ax:CreateTopbarButton("Minimize","minus",function()
ax:Close()






















end,(ax.Topbar.ButtonsType=="Default"and 997 or 998),nil,Color3.fromHex"#F4C948")

ax:CreateTopbarButton("Close","x",function()
if ax.IgnoreAlerts then
ax:Destroy()
return
end

ax:Dialog{
Title="Close Window",
Content="Are you sure you want to close the window?",
Buttons={
{
Title="Cancel",
Variant="Secondary",
Callback=function()end
},
{
Title="Close",
Variant="Primary",
Callback=function()
ax:Destroy()
end
}
}
}
end,(ax.Topbar.ButtonsType=="Default"and 996 or 997),nil,Color3.fromHex"#FF6060")

function ax.OnOpen(F,G)
ax.OnOpenCallback=G
end
function ax.OnClose(F,G)
ax.OnCloseCallback=G
end
function ax.OnDestroy(F,G)
ax.OnDestroyCallback=G
end

if av.HyperUI.UseAcrylic then
ax.AcrylicPaint.AddParent(ax.UIElements.Main)
end

function ax.SetIconSize(F,G)
local H
if typeof(G)=="number"then
H=UDim2.new(0,G,0,G)
ax.IconSize=G
elseif typeof(G)=="UDim2"then
H=G
ax.IconSize=G.X.Offset
end

if v then
v.Size=H
end
end

function ax.Open(F)
task.spawn(function()
if ax.OnOpenCallback then
task.spawn(function()
ak.SafeCallback(ax.OnOpenCallback)
end)
end
if ax._FooterOpenCallback then
task.spawn(function()
ax._FooterOpenCallback()
end)
end


task.wait(.06)
ax.Closed=false

am(ax.UIElements.Main.Background,0.2,{
ImageTransparency=ax.Transparent and av.HyperUI.TransparencyValue or 0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

if ax.UIElements.BackgroundGradient then
am(ax.UIElements.BackgroundGradient,0.2,{
ImageTransparency=0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

am(ax.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,0),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()

if l then
if l:IsA"VideoFrame"then
l.Visible=true
else
am(l,0.2,{
ImageTransparency=ax.BackgroundImageTransparency,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

if ax.OpenButtonMain and ax.IsOpenButtonEnabled then
ax.OpenButtonMain:Visible(false)
end


am(d,0.25,{ImageTransparency=ax.ShadowTransparency},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
am(UIStroke,0.25,{Transparency=.8},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

task.spawn(function()
task.wait(.3)
am(r,.45,{Size=UDim2.new(0,200,0,4),ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
A:Set(true)
task.wait(.45)
if ax.Resizable then
am(aA.ImageLabel,.45,{ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
ax.CanResize=true
end
end)


ax.CanDropdown=true

ax.UIElements.Main.Visible=true
task.spawn(function()
task.wait(.05)
ax.UIElements.Main:WaitForChild"Main".Visible=true

av.HyperUI:ToggleAcrylic(true)
end)
end)
end
function ax.Close(F)
local G={}

if ax.OnCloseCallback then
task.spawn(function()
ak.SafeCallback(ax.OnCloseCallback)
end)
end
if ax._FooterCloseCallback then
task.spawn(function()
ax._FooterCloseCallback()
end)
end

av.HyperUI:ToggleAcrylic(false)

ax.UIElements.Main:WaitForChild"Main".Visible=false

ax.CanDropdown=false
ax.Closed=true

am(ax.UIElements.Main.Background,0.32,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
if ax.UIElements.BackgroundGradient then
am(ax.UIElements.BackgroundGradient,0.32,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

am(ax.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,-240),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()


if l then
if l:IsA"VideoFrame"then
l.Visible=false
else
am(l,0.3,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
am(d,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
am(UIStroke,0.25,{Transparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

am(r,.3,{Size=UDim2.new(0,0,0,4),ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()
am(aA.ImageLabel,.3,{ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
A:Set(false)
ax.CanResize=false

local H=ax.UIElements.Main.Position

task.spawn(function()
task.wait(0.4)
ax.UIElements.Main.Visible=false

if ax.OpenButtonMain and not ax.Destroyed and ax.IsOpenButtonEnabled then
ax.OpenButtonMain:Visible(true,H)
end
end)

function G.Destroy(J)
task.spawn(function()
if ax.OnDestroyCallback then
task.spawn(function()
ak.SafeCallback(ax.OnDestroyCallback)
end)
end
if ax._FooterDestroyCallback then
task.spawn(function()
ax._FooterDestroyCallback()
end)
end
if ax.AcrylicPaint and ax.AcrylicPaint.Model then
ax.AcrylicPaint.Model:Destroy()
end
ax.Destroyed=true
task.wait(0.4)
av.HyperUI.Window=nil
ax.UIElements.Main:Destroy()
return
end)
end

return G
end
function ax.Destroy(F)
return ax:Close():Destroy()
end
function ax.Toggle(F)
if ax.Closed then
ax:Open()
else
ax:Close()
end
end


function ax.ToggleTransparency(F,G)

ax.Transparent=G
av.HyperUI.Transparent=G

if ax.UIElements.Main:FindFirstChild"Background"then
ax.UIElements.Main.Background.ImageTransparency=G and av.HyperUI.TransparencyValue or 0
end
end

function ax.LockAll(F)
for G,H in next,ax.AllElements do
if H.Lock then H:Lock()end
end
end
function ax.UnlockAll(F)
for G,H in next,ax.AllElements do
if H.Unlock then H:Unlock()end
end
end
function ax.GetLocked(F)
local G={}

for H,J in next,ax.AllElements do
if J.Locked then table.insert(G,J)end
end

return G
end
function ax.GetUnlocked(F)
local G={}

for H,J in next,ax.AllElements do
if J.Locked==false then table.insert(G,J)end
end

return G
end

function ax.GetUIScale(F,G)
return av.HyperUI.UIScale
end

function ax.SetUIScale(F,G)
av.HyperUI.UIScale=G
am(av.HyperUI.UIScaleObj,.2,{Scale=G},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
return ax
end

function ax.SetToTheCenter(F)
am(ax.UIElements.Main,0.45,{Position=UDim2.new(0.5,0,0.5,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
return ax
end

function ax.SetCurrentConfig(F,G)
ax.CurrentConfig=G
end

do
local F=40
local G=ah.ViewportSize
local H=ax.UIElements.Main.AbsoluteSize

if not ax.IsFullscreen and ax.AutoScale then
local J=G.X-(F*2)
local L=G.Y-(F*2)

local M=J/H.X
local N=L/H.Y

local O=math.min(M,N)

local P=0.3
local Q=1.0

local R=math.clamp(O,P,Q)

local S=ax:GetUIScale()or 1
local T=0.05

if math.abs(R-S)>T then
ax:SetUIScale(R)
end
end
end



ak.AddSignal(ae.InputBegan,function(F,G)
if G then return end

local H=ae:IsKeyDown(Enum.KeyCode.LeftControl)or ae:IsKeyDown(Enum.KeyCode.RightControl)

if ax.ToggleKey then
if F.KeyCode==ax.ToggleKey then
ax:Toggle()
end
end

if H and F.KeyCode==Enum.KeyCode.H then
ax:Toggle()
end
end)

task.spawn(function()

ax:Open()
end)

function ax.EditOpenButton(F,G)
return ax.OpenButtonMain:Edit(G)
end

if ax.OpenButton and typeof(ax.OpenButton)=="table"then
ax:EditOpenButton(ax.OpenButton)
end


local F=a.load'_'
local G=a.load'aa'
local H=F.Init(ax,av.HyperUI,av.HyperUI.TooltipGui)
H:OnChange(function(J)ax.CurrentTab=J end)

ax.TabModule=H


function ax.Tab(J,L)
L.Parent=ax.UIElements.SideBar.Frame
return H.New(L,av.HyperUI.UIScale)
end

function ax.SelectTab(J,L)
H:SelectTab(L)
end

function ax.Section(J,L)
return G.New(L,ax.UIElements.SideBar.Frame,ax.Folder,av.HyperUI.UIScale,ax)
end

function ax.IsResizable(J,L)
ax.Resizable=L
ax.CanResize=L
end

function ax.SetPanelBackground(J,L)
if typeof(L)=="boolean"then
ax.HidePanelBackground=L

ax.UIElements.MainBar.Background.Visible=L

if H then
for M,N in next,H.Containers do
N.ScrollingFrame.UIPadding.PaddingTop=UDim.new(0,ax.HidePanelBackground and 20 or 10)
N.ScrollingFrame.UIPadding.PaddingLeft=UDim.new(0,ax.HidePanelBackground and 20 or 10)
N.ScrollingFrame.UIPadding.PaddingRight=UDim.new(0,ax.HidePanelBackground and 20 or 10)
N.ScrollingFrame.UIPadding.PaddingBottom=UDim.new(0,ax.HidePanelBackground and 20 or 10)
end
end
end
end

function ax.Divider(J)
local L=al("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local M=al("Frame",{
Parent=ax.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
L
})

return M
end

local J=a.load'n'.Init(ax,nil)
function ax.Dialog(L,M)
local N={
Title=M.Title or"Dialog",
Width=M.Width or 320,
Content=M.Content,
Buttons=M.Buttons or{},

TextPadding=14,
}
local O=J.Create(false)

O.UIElements.Main.Size=UDim2.new(0,N.Width,0,0)

local P=al("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=O.UIElements.Main
},{
al("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,O.UIPadding),
VerticalAlignment="Center"
}),
al("UIPadding",{
PaddingTop=UDim.new(0,N.TextPadding/2),
PaddingLeft=UDim.new(0,N.TextPadding/2),
PaddingRight=UDim.new(0,N.TextPadding/2),
})
})

local Q
if M.Icon then
Q=ak.Image(
M.Icon,
N.Title..":"..M.Icon,
0,
ax,
"Dialog",
true,
M.IconThemed
)
Q.Size=UDim2.new(0,22,0,22)
Q.Parent=P
end

O.UIElements.UIListLayout=al("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
Parent=O.UIElements.Main
})

al("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=O.UIElements.Main,
})


O.UIElements.Title=al("TextLabel",{
Text=N.Title,
TextSize=20,
FontFace=Font.new(ak.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,Q and-26-O.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=P
})
if N.Content then
al("TextLabel",{
Text=N.Content,
TextSize=18,
TextTransparency=.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(ak.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=O.UIElements.Main
},{
al("UIPadding",{
PaddingLeft=UDim.new(0,N.TextPadding/2),
PaddingRight=UDim.new(0,N.TextPadding/2),
PaddingBottom=UDim.new(0,N.TextPadding/2),
})
})
end

local R=al("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
})

local S=al("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=O.UIElements.Main,
LayoutOrder=4,
},{
R,






})


local T={}

for U,V in next,N.Buttons do
local W=ao(V.Title,V.Icon,V.Callback,V.Variant,S,O,true)
table.insert(T,W)
end

local function CheckButtonsOverflow()
R.FillDirection=Enum.FillDirection.Horizontal
R.HorizontalAlignment=Enum.HorizontalAlignment.Right
R.VerticalAlignment=Enum.VerticalAlignment.Center
S.AutomaticSize=Enum.AutomaticSize.None

for U,V in ipairs(T)do
V.Size=UDim2.new(0,0,1,0)
V.AutomaticSize=Enum.AutomaticSize.X
end

wait()

local U=R.AbsoluteContentSize.X/av.HyperUI.UIScale
local V=S.AbsoluteSize.X/av.HyperUI.UIScale

if U>V then
R.FillDirection=Enum.FillDirection.Vertical
R.HorizontalAlignment=Enum.HorizontalAlignment.Right
R.VerticalAlignment=Enum.VerticalAlignment.Bottom
S.AutomaticSize=Enum.AutomaticSize.Y

for W,X in ipairs(T)do
X.Size=UDim2.new(1,0,0,40)
X.AutomaticSize=Enum.AutomaticSize.None
end
else
local W=V-U
if W>0 then
local X
local Y=math.huge

for _,aC in ipairs(T)do
local aD=aC.AbsoluteSize.X/av.HyperUI.UIScale
if aD<Y then
Y=aD
X=aC
end
end

if X then
X.Size=UDim2.new(0,Y+W,1,0)
X.AutomaticSize=Enum.AutomaticSize.None
end
end
end
end

ak.AddSignal(O.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize",CheckButtonsOverflow)
CheckButtonsOverflow()

wait()
O:Open()

return O
end




function ax.Tag(aC,aD)
if ax.UIElements.Main.Main.Topbar.Center.Visible==false then ax.UIElements.Main.Main.Topbar.Center.Visible=true end
return aq:New(aD,ax.UIElements.Main.Main.Topbar.Center)
end


as.Init(ax,aA,aB)




local aC=0
local aD=0.4
local L
local M=0

function onDoubleClick()
ax:SetToTheCenter()
end

r.Frame.MouseButton1Up:Connect(function()
local N=tick()
local O=ax.Position

M=M+1

if M==1 then
aC=N
L=O

task.spawn(function()
task.wait(aD)
if M==1 then
M=0
L=nil
end
end)

elseif M==2 then
if N-aC<=aD and O==L then
onDoubleClick()
end

M=0
L=nil
aC=0
else
M=1
aC=N
L=O
end
end)





if not ax.HideSearchBar then
local N=a.load'ac'
local O=false





















local P=an("Search","search",ax.UIElements.SideBarContainer,true)
P.Size=UDim2.new(1,-ax.UIPadding/2,0,39)
P.Position=UDim2.new(0,ax.UIPadding/2,0,0)

ak.AddSignal(P.MouseButton1Click,function()
if O then return end

N.new(ax.TabModule,ax.UIElements.Main,function()

O=false
if ax.Resizable then
ax.CanResize=true
end

am(b,0.1,{ImageTransparency=1}):Play()
b.Active=false
end)
am(b,0.1,{ImageTransparency=.65}):Play()
b.Active=true

O=true
ax.CanResize=false
end)
end




function ax.DisableTopbarButtons(N,O)
for P,Q in next,O do
for R,S in next,ax.TopBarButtons do
if S.Name==Q then
S.Object.Visible=false
end
end
end
end





























if av.StatsWidget~=false then
local N=a.load'ad'
N.Init(ax)
end

return ax
end end end

local aa=game:GetService"RunService"
local ae={
Window=nil,
Theme=nil,
Creator=a.load'c',
LocalizationModule=a.load'd',
NotificationModule=a.load'e',
Themes=nil,
Transparent=false,

TransparencyValue=.15,

UIScale=1,

ConfigManager=nil,
Version="0.0.0",

Services=a.load'j',

AllElements={},

OnThemeChangeFunction=nil,

cloneref=nil,
UIScaleObj=nil,
}


local af=(cloneref or clonereference or function(af)return af end)

ae.cloneref=af

local ah=af(game:GetService"HttpService")
local aj=af(game:GetService"Players")
local ak=af(game:GetService"CoreGui")local al=

aj.LocalPlayer or nil

local am=ah:JSONDecode(a.load'k')
if am then
ae.Version=am.version
end

local an=a.load'o'
ae.Loading=a.load'p'local ao=

ae.Services


local ap=ae.Creator

local aq=ap.New local ar=
ap.Tween


local as=a.load't'


local at=protectgui or(syn and syn.protect_gui)or function()end

local au=gethui and gethui()or(ak or game.Players.LocalPlayer:WaitForChild"PlayerGui")

local av=aq("UIScale",{
Scale=ae.UIScale,
})

ae.UIScaleObj=av

ae.ScreenGui=aq("ScreenGui",{
Name="HyperUI",
Parent=au,
IgnoreGuiInset=true,
ScreenInsets="None",
},{

aq("Folder",{
Name="Window"
}),






aq("Folder",{
Name="KeySystem"
}),
aq("Folder",{
Name="Popups"
}),
aq("Folder",{
Name="ToolTips"
})
})

ae.NotificationGui=aq("ScreenGui",{
Name="HyperUI/Notifications",
Parent=au,
IgnoreGuiInset=true,
DisplayOrder=102,
})
ae.DropdownGui=aq("ScreenGui",{
Name="HyperUI/Dropdowns",
Parent=au,
IgnoreGuiInset=true,
DisplayOrder=100,
})
ae.TooltipGui=aq("ScreenGui",{
Name="HyperUI/Tooltips",
Parent=au,
IgnoreGuiInset=true,
DisplayOrder=101,
})
at(ae.ScreenGui)
at(ae.NotificationGui)
at(ae.DropdownGui)
at(ae.TooltipGui)

ap.Init(ae)


function ae.SetParent(aw,ax)
ae.ScreenGui.Parent=ax
ae.NotificationGui.Parent=ax
ae.DropdownGui.Parent=ax
end
math.clamp(ae.TransparencyValue,0,1)

local aw=ae.NotificationModule.Init(ae.NotificationGui)

function ae.Notify(ax,ay)
ay.Holder=aw.Frame
ay.Window=ae.Window

return ae.NotificationModule.New(ay)
end

function ae.SetNotificationLower(ax,ay)
aw.SetLower(ay)
end

function ae.SetFont(ax,ay)
ap.UpdateFont(ay)
end

function ae.OnThemeChange(ax,ay)
ae.OnThemeChangeFunction=ay
end

function ae.AddTheme(ax,ay)
ae.Themes[ay.Name]=ay
return ay
end

function ae.SetTheme(ax,ay)
if ae.Themes[ay]then
ae.Theme=ae.Themes[ay]
ap.SetTheme(ae.Themes[ay])

if ae.OnThemeChangeFunction then
ae.OnThemeChangeFunction(ay)
end

return ae.Themes[ay]
end
return nil
end

function ae.GetThemes(ax)
return ae.Themes
end
function ae.GetCurrentTheme(ax)
return ae.Theme.Name
end
function ae.GetTransparency(ax)
return ae.Transparent or false
end
function ae.GetWindowSize(ax)
if not ae.Window or not ae.Window.UIElements or not ae.Window.UIElements.Main then
return UDim2.fromOffset(600,400)
end
return ae.Window.UIElements.Main.Size
end
function ae.Localization(ax,ay)
return ae.LocalizationModule:New(ay,ap)
end

function ae.SetLanguage(ax,ay)
if ap.Localization then
return ap.SetLanguage(ay)
end
return false
end

function ae.ToggleAcrylic(ax,ay)
if ae.Window and ae.Window.AcrylicPaint and ae.Window.AcrylicPaint.Model then
ae.Window.Acrylic=ay
ae.Window.AcrylicPaint.Model.Transparency=ay and 0.98 or 1
if ay then
as.Enable()
else
as.Disable()
end
end
end


function ae.Gradient(ax,ay,az)
local aA={}
local aB={}

for aC,aD in next,ay do
local b=tonumber(aC)
if b then
b=math.clamp(b/100,0,1)

local d=aD.Color
if typeof(d)=="string"and string.sub(d,1,1)=="#"then
d=Color3.fromHex(d)
end

local f=aD.Transparency or 0

table.insert(aA,ColorSequenceKeypoint.new(b,d))
table.insert(aB,NumberSequenceKeypoint.new(b,f))
end
end

table.sort(aA,function(aC,aD)return aC.Time<aD.Time end)
table.sort(aB,function(aC,aD)return aC.Time<aD.Time end)

if#aA<2 then
table.insert(aA,ColorSequenceKeypoint.new(1,aA[1].Value))
table.insert(aB,NumberSequenceKeypoint.new(1,aB[1].Value))
end

local aC={
Color=ColorSequence.new(aA),
Transparency=NumberSequence.new(aB),
}

if az then
for aD,b in pairs(az)do
aC[aD]=b
end
end

return aC
end


function ae.Popup(ax,ay)
ay.HyperUI=ae
return a.load'u'.new(ay)
end


ae.Themes=a.load'v'(ae)

ap.Themes=ae.Themes


ae:SetTheme"Dark"
ae:SetLanguage(ap.Language)


function ae.CreateWindow(ax,ay)
local az=a.load'ae'
local aA=a.load'p'

local aB
if not ay.HideLoadingScreen then
aB=aA.new{
Parent=ae.ScreenGui,
Version=ae.Version
}
aB:UpdateStatus("Synchronizing environment state",20)
end

if not aa:IsStudio()and writefile then
if not isfolder"HyperUI"then
makefolder"HyperUI"
end
if ay.Folder then
ay.Folder=ap.SanitizeFilename(ay.Folder)
if not isfolder("HyperUI/"..ay.Folder)then
makefolder("HyperUI/"..ay.Folder)
end
else
ay.Folder=ap.SanitizeFilename(ay.Title)
if not isfolder("HyperUI/"..ay.Folder)then
makefolder("HyperUI/"..ay.Folder)
end
end
end

ay.HyperUI=ae
ay.Parent=ae.ScreenGui.Window

if aB then
aB:UpdateStatus("Reconstructing core components",40)
end

if ae.Window then
warn"You cannot create more than one window"
return
end

local aC=true

local aD=ae.Themes[ay.Theme or"Dark"]


ap.SetTheme(aD)


local b=gethwid or function()
return aj.LocalPlayer.UserId
end

local d=b()

if ay.KeySystem then
aC=false

local function loadKeysystem()
if aB then aB:Finish()end
an.new(ay,d,function(f)aC=f end)
end

if aB then aB:UpdateStatus("Authenticating session credentials",60)end
local f=(ay.Folder or"Temp").."/"..d..".key"

if ay.KeySystem.KeyValidator then
if ay.KeySystem.SaveKey and isfile(f)then
local g=readfile(f)
local h=ay.KeySystem.KeyValidator(g)

if h then
aC=true
else
loadKeysystem()
end
else
loadKeysystem()
end
elseif not ay.KeySystem.API then
if ay.KeySystem.SaveKey and isfile(f)then
local g=readfile(f)
local h=(type(ay.KeySystem.Key)=="table")
and table.find(ay.KeySystem.Key,g)
or tostring(ay.KeySystem.Key)==tostring(g)

if h then
aC=true
else
loadKeysystem()
end
else
loadKeysystem()
end
else
if isfile(f)then
local g=readfile(f)
local h=false

for j,l in next,ay.KeySystem.API do
local m=ae.Services[l.Type]
if m then
local p={}
for r,u in next,m.Args do
table.insert(p,l[u])
end

local r=m.New(table.unpack(p))
local u=r.Verify(g)
if u then
h=true
break
end
end
end

aC=h
if not h then loadKeysystem()end
else
loadKeysystem()
end
end

repeat task.wait()until aC
end

if aB then aB:UpdateStatus("Finalizing system architecture",90)end
task.wait(1.5)

local f=az(ay)

if aB then
aB:UpdateStatus("System operational",100)
task.wait(0.8)
aB:Finish()
end

ae.Transparent=ay.Transparent
ae.Window=f

if ay.Acrylic then
as.init()
end













return f
end


return ae