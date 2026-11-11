if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(1)

local pinnd85, pinnd86, localPlayer, pinnd87, net, pinnd88, pinnd89, pinnd90, keyboardEnabled, flag18
local pinndfn29, pinnd91, tbl18, max, flag19, pinnd92, flag20, autoRedeem, autoType, manual
local flag21, thread, pinndn32, pinndn33, listenKey, g, str7, tbl19, pinnd93, pinnd94
local flag22, autoListen, pinnd95, pinnd96, pinndfn30, pinndfn31, pinndfn32, pinndfn33, pinndfn34, pinndfn35
local pinndfn36, pinndfn37, pinndfn38, pinndfn39, pinndfn40, pinndfn41, tbl20, tbl21, gothamMedium, gothamBold
local gothamBlack, pinndfn42, pinndfn43, pinndfn44, pinndfn45, pinndfn46, pinndfn47, pinndfn48, pinndfn49, ScreenGui
local Main, Frame, Rag, pinnd97, pinnd98, pinndn34, pinnd99, pinndfn50, TextBox, pinnd100
local clear, redeem, pinndfn51, listen, Frame2, Frame3, TextButton, pinnd101, pinnd102, pinnd103
local pinnd104, pinnd105, pinnd106, start, pinnd107, pinnd108
do
	local visible, showKeybinds, pinndfn52, Settings, Frame4, Frame5, words
	do
		local tbl22, Frame6
		do
			do
				local pinnd109
				do
					do
						local getupvalues_, getconnections_, setupvalue_
						do
							do
								local writeClipboard
								do
									do
										local pinndfn53 = cloneref or function(arg)
											return arg
										end
										local pinnd110 = pinndfn53(game:GetService("Players"))
										pinnd85 = pinndfn53(game:GetService("ReplicatedStorage"))
										pinnd86 = pinndfn53(game:GetService("UserInputService"))
										pinnd109 = pinndfn53(game:GetService("TweenService"))
										localPlayer = pinnd110.LocalPlayer
										pinnd87 = localPlayer:WaitForChild("PlayerGui")
										net = pinnd85:WaitForChild("Packages"):WaitForChild("Net")
										pinnd88 = pinndfn53(game:GetService("RunService"))
									end
									do
										pinnd89 = localPlayer
										pinnd90 = pinnd87
										getupvalues_ = debug and debug.getupvalues or getupvalues
										do
											local pinnd110 = getconnections
											if pinnd110 then
												getconnections_ = pinnd110
											else
												getconnections_ = debug and debug.getconnections
											end
										end
									end
									setupvalue_ = debug and debug.setupvalue or setupvalue
									do
										local pinnd110 = setclipboard or toclipboard
										if pinnd110 then
											writeClipboard = pinnd110
										else
											writeClipboard = syn and syn.write_clipboard
										end
									end
								end
								do
									keyboardEnabled = pinnd86.KeyboardEnabled
									flag18 = pinnd86.TouchEnabled and not keyboardEnabled
									pinndfn29 = function()
										if not flag18 then
											return 1
										end
										local currentCamera = workspace.CurrentCamera
										currentCamera = currentCamera and currentCamera.ViewportSize.Y or 600
										local uiSize = _G.__RdmCfgStr and _G.__RdmCfgStr("uiSize", "MEDIUM") or "MEDIUM"
										local pinndn35 = uiSize == "BIG" and 1.15 or uiSize == "SMALL" and 0.8 or 1
										return math.clamp(currentCamera * 0.88 / 548, 0.5, 1.3) * pinndn35
									end
									pinnd91 = pinndfn29()
									do
										local tbl23 = {}
										if readfile and isfile then
											local ok, result = pcall(function()
												if isfile("redeemer_settings.txt") then
													return readfile("redeemer_settings.txt")
												end
											end)
											if ok and type(result) == "string" then
												for match in result:gmatch("[^\n]+") do
													local match2, pinnd110 = match:match("^(%w+)=(.*)$")
													if match2 then
														tbl23[match2] = pinnd110
													end
												end
											end
										end
										_G.__RdmCfgBool = function(arg, arg2)
											local pinnd110 = tbl23[arg]
											if pinnd110 == "1" then
												return true
											end
											if pinnd110 == "0" then
												return false
											end
											return arg2
										end
										_G.__RdmCfgStr = function(arg, arg2)
											local pinnd110 = tbl23[arg]
											local pinnd111 = "string"
											return type(pinnd110) == pinnd111 and pinnd110 ~= "" and pinnd110 or arg2
										end
										_G.__RdmCfgSet = function(arg, arg2)
											tbl23[arg] = type(arg2) == "boolean" and (arg2 and "1" or "0") or tostring(arg2)
											if not writefile then
												return
											end
											local tbl24 = {}
											for k, pinnd110 in pairs(tbl23) do
												tbl24[#tbl24 + 1] = k .. "=" .. tostring(pinnd110)
											end
											table.sort(tbl24)
											pcall(writefile, "redeemer_settings.txt", table.concat(tbl24, "\n"))
										end
									end
								end
								do
									tbl18 = {
										listenKey = Enum.KeyCode.F,
										maxFeed = 36,
									}
									tbl22 = { MAX = 0.15 }
									max = tbl22[_G.__RdmCfgStr("speed", "MAX")] or tbl22.MAX
									flag19 = _G.__RdmCfgBool("wordMode", false)
									pinnd92 = 0.5
									flag20 = false
									autoRedeem = _G.__RdmCfgBool("autoRedeem", true)
									autoType = _G.__RdmCfgBool("autoType", true)
									manual = _G.__RdmCfgBool("manual", false)
									flag21 = false
									thread = nil
									pinndn32 = 0
									pinndn33 = 1
									listenKey = tbl18.listenKey
									g = Enum.KeyCode.G
									str7 = nil
									tbl19 = {}
									pinnd93 = nil
									pinnd94 = nil
									flag22 = false
									autoListen = _G.__RdmCfgBool("autoListen", true)
									pinnd95 = _G.__RdmCfgBool("spamOnListen", true)
									showKeybinds = _G.__RdmCfgBool("showKeybinds", keyboardEnabled)
									pinnd96 = _G.__RdmCfgBool("ignoreSystem", true)
									_G.__RdmDuo = _G.__RdmCfgBool("duo", false)
									_G.__SabClassifyDrop = function(arg)
										local str8 = tostring(arg or "")
										local str9 = str8:lower()
										local tbl23 = {}
										for match in str8:gmatch("[%w']+") do
											tbl23[#tbl23 + 1] = match
										end
										local pinndn35 = #tbl23
										if pinndn35 == 0 then
											return nil
										end
										local str10 = " " .. str9:gsub("[^%w]", " ") .. " "
										if str9:find("?", 1, true) then
											return "riddle"
										end
										for _, pinnd110 in ipairs({
											" what ",
											" how ",
											" which ",
											" whose ",
											" when ",
											" who ",
											" whats ",
											" where ",
											" why ",
											" guess ",
											" riddle ",
											" answer ",
										}) do
											if str10:find(pinnd110, 1, true) then
												return "riddle"
											end
										end
										if str10:find(" my ", 1, true) then
											return "riddle"
										end
										local flag23 = pinndn35 >= 2
										local pos
										if flag23 then
											pos = str10:find(" plus ", 1, true) or str9:find("+", 1, true)
										else
											pos = flag23
										end
										if pos then
											return "riddle"
										end
										if pinndn35 >= 4 and str10:find(" and ", 1, true) then
											return "riddle"
										end
										if str9:find("code", 1, true) then
											return "code"
										end
										for _, pinnd110 in ipairs({ " redeem ", " type ", " enter ", " claim " }) do
											if str10:find(pinnd110, 1, true) then
												return "code"
											end
										end
										if pinndn35 >= 7 then
											return "riddle"
										end
										if pinndn35 == 1 then
											return "code"
										end
										if pinndn35 <= 3 then
											local pinnd110 = 0
											for _, pinnd111 in ipairs(tbl23) do
												if #pinnd111 >= 3 and (pinnd111 == pinnd111:upper() and pinnd111:match("%a") or pinnd111:match("%d")) then
													pinnd110 += 1
												end
											end
											if pinnd110 == pinndn35 then
												return "code"
											end
										end
										return nil
									end
									pinndfn30 = nil
									pinndfn52 = nil
									pinndfn31 = nil
									pinndfn32 = nil
									pinndfn33 = function(arg)
										if type(arg) ~= "string" then
											return tostring(arg)
										end
										return (arg:gsub("<[^>]->", ""))
									end
									pinndfn34 = function(arg)
										return (arg or ""):gsub("^%s+", ""):gsub("%s+$", "")
									end
									pinndfn35 = function(arg)
										if not writeClipboard then
											return false
										end
										return (pcall(writeClipboard, arg))
									end
									pinndfn36 = function(arg)
										local tbl23 = {}
										for match in arg:gmatch("[%w_]+") do
											tbl23[#tbl23 + 1] = match
										end
										return tbl23
									end
									pinndfn37 = function(arg)
										local pinnd110 = nil
										for match in arg:gmatch("[%w_]+") do
											if #match >= 4 and match:match("%a") and (match:match("%u") or match:match("%d")) then
												pinnd110 = match
											end
										end
										if pinnd110 then
											return pinnd110
										end
										for match in arg:gmatch("[%w_]+") do
											if #match >= 4 then
												return match
											end
										end
									end
									do
										local tbl23 = {
											leads = {
												"use",
												"using",
												"redeem",
												"type",
												"enter",
												"claim",
												"with",
												"grab",
												"got",
												"here is",
												"heres",
												"here's",
												"there is",
												"theres",
												"there's",
											},
											articles = {
												"",
												"the%s+",
												"a%s+",
												"an%s+",
												"this%s+",
												"your%s+",
												"new%s+",
											},
											patterns = {
												"code%s+is",
												"codes?%s+are",
												"code%s+for",
												"code%s+to%s+use",
												"code%s*[:%-]",
												"new%s+code",
												"free%s+code",
												"secret%s+code",
												"working%s+code",
												"another%s+code",
											},
										}
										for _, lead in ipairs(tbl23.leads) do
											local str8 = lead:gsub("%s+", "%%s+")
											for _, article in ipairs(tbl23.articles) do
												tbl23.patterns[#tbl23.patterns + 1] = str8 .. "%s+" .. article .. "code"
											end
										end
										tbl23.names = { "sammy" }
										local function pinndfn53(arg)
											for match, match2 in arg:gmatch("()([%w_]+)") do
												if #match2 >= 4 and match2:match("%a") and (match2:match("%u") or match2:match("%d")) then
													return arg:sub(match)
												end
											end
										end
										pinndfn38 = function(arg)
											local str8 = arg:lower()
											local pinnd110 = nil
											local pinnd111 = nil
											local function pinndfn54(arg2, arg3, arg4)
												local pinndn35 = 1
												while true do
													local ok, result, result2 = pcall(string.find, str8, arg2, pinndn35, arg3)
													if not (not ok or not result) then
														if not pinnd110 or result2 > pinnd110 then
															pinnd110 = result2
															pinnd111 = arg4
														end
														pinndn35 = result2 + 1
														continue
													end
													break
												end
											end
											for _, pattern in ipairs(tbl23.patterns) do
												pinndfn54(pattern, false, false)
											end
											if str8:find("code") then
												for _, name in ipairs(tbl23.names) do
													local pinnd112 = true
													pinndfn54(name:lower(), pinnd112, true)
												end
											end
											if not pinnd110 then
												return nil
											end
											local str9 = arg:sub(pinnd110 + 1)
											local pinnd112 = pinndfn53(str9)
											if pinnd111 then
												return pinnd112
											end
											return pinnd112 or ""
										end
									end
								end
							end
							do
								local function pinndfn53(arg)
									if not getupvalues_ then
										return {}
									end
									local ok, result = pcall(getupvalues_, arg)
									local tbl23 = {}
									if ok and result then
										for _, pinnd110 in pairs(result) do
											if typeof(pinnd110) == "Instance" and (pinnd110:IsA("RemoteEvent") or pinnd110:IsA("RemoteFunction") or pinnd110:IsA("UnreliableRemoteEvent")) and pinnd110.Parent == net then
												table.insert(tbl23, pinnd110)
											end
										end
									end
									return tbl23
								end
								pinndfn39 = function()
									local ok, result = pcall(function()
										return require(pinnd85.Controllers:FindFirstChild("NotificationController", true))
									end)
									if ok then
										local pinnd110 = "table"
										ok = type(result) == pinnd110
									end
									if ok then
										local pinnd110 = "function"
										ok = type(result.Start) == pinnd110
									end
									if ok then
										return pinndfn53(result.Start)[1]
									end
								end
							end
						end
						do
							local pinndfn53, pinndfn54
							do
								pinndfn53 = function()
									local codes = pinnd87:FindFirstChild("Codes")
									if not codes then
										return nil
									end
									local pinnd110 = (codes:FindFirstChild("Codes") or codes):FindFirstChild("Main")
									pinnd110 = pinnd110 and pinnd110:FindFirstChild("TextBox")
									if pinnd110 and pinnd110:IsA("TextBox") then
										return pinnd110
									end
									for _, descendant in ipairs(codes:GetDescendants()) do
										if descendant:IsA("TextBox") then
											return descendant
										end
									end
								end
								do
									local function pinndfn55()
										local codes = pinnd87:FindFirstChild("Codes")
										if not codes then
											return nil
										end
										local codes2 = codes:FindFirstChild("Codes") or codes
										local confirm = (codes2:FindFirstChild("Main") or codes2):FindFirstChild("Confirm")
										if confirm and (confirm:IsA("ImageButton") or confirm:IsA("TextButton")) then
											return confirm
										end
										local pinnd110 = nil
										for _, descendant in ipairs(codes:GetDescendants()) do
											if descendant:IsA("ImageButton") or descendant:IsA("TextButton") then
												local str8 = descendant.Name:lower()
												if str8:find("confirm") or str8:find("submit") or str8:find("redeem") or str8:find("enter") then
													return descendant
												end
												pinnd110 = pinnd110 or descendant
											end
										end
										return pinnd110
									end
									local pinndfn56 = nil
									pinndfn56 = function(arg, arg2)
										if not (arg and setupvalue_ and getupvalues_) then
											return
										end
										arg2 = arg2 or 1
										local ok, result = pcall(getupvalues_, arg)
										if ok and type(result) == "table" then
											for k, pinnd110 in pairs(result) do
												local pinnd111 = "boolean"
												if type(pinnd110) == pinnd111 then
													pcall(setupvalue_, arg, k, false)
												else
													local pinnd112 = "function"
													if type(pinnd110) == pinnd112 and arg2 > 0 then
														pinndfn56(pinnd110, arg2 - 1)
													end
												end
											end
										end
									end
									local function pinndfn57(arg, ...)
										if not getconnections_ then
											return false
										end
										local ok, result = pcall(getconnections_, arg)
										local flag23 = not ok
										if not flag23 then
											local pinnd110 = "table"
											flag23 = type(result) ~= pinnd110
										end
										if flag23 or #result == 0 then
											return false
										end
										local pinnd110 = table.pack(...)
										local pinnd111, pinnd112, pinnd113 = ipairs(result)
										local flag24 = false
										for _, pinnd114 in pinnd111, pinnd112, pinnd113 do
											if pinnd114.Enabled ~= false then
												local function_ = nil
												pcall(function()
													function_ = pinnd114.Function
												end)
												pinndfn56(function_)
												local ok2
												if function_ then
													ok2 = pcall(task.spawn, function_, table.unpack(pinnd110, 1, pinnd110.n))
												else
													ok2 = pcall(function()
														pinnd114:Fire(table.unpack(pinnd110, 1, pinnd110.n))
													end)
												end
												flag24 = flag24 or ok2
											end
										end
										return flag24
									end
									pinndfn40 = function(text)
										if type(text) ~= "string" or text == "" then
											return
										end
										local pinnd110 = pinndfn53()
										if not pinnd110 then
											return
										end
										pcall(function()
											if pinnd110.Text ~= text then
												pinnd110.Text = text
											end
										end)
									end
									pinndfn54 = function(text)
										if not getconnections_ then
											return false, "no getconnections"
										end
										local pinnd110 = pinndfn53()
										if not pinnd110 then
											return false, "code box not found"
										end
										pcall(function()
											pinnd110.Text = text
											pinnd110.Active = true
											pinnd110.Selectable = true
										end)
										local pinnd111 = pinndfn55()
										local flag23 = false
										if pinnd111 then
											local flag24 = pinndfn57(pinnd111.MouseButton1Click)
											flag24 = flag24 or false
											flag23 = pinndfn57(pinnd111.Activated) or flag24
										end
										if not flag23 then
											flag23 = pinndfn57(pinnd110.FocusLost, true) or flag23
										end
										return flag23, flag23 and "submitted" or "no submit control"
									end
								end
							end
							do
								local function pinndfn55(text)
									local pinnd110 = pinndfn53()
									if not pinnd110 then
										return false, "code box not found"
									end
									if not pcall(function()
										pinnd110.Text = text
										pinnd110:CaptureFocus()
									end) then
										return false, "focus failed"
									end
									task.wait(0.1)
									local ok = pcall(function()
										pinnd110:ReleaseFocus(true)
									end)
									return ok, ok and "submitted" or "release failed"
								end
								pinndfn41 = function(arg)
									local pinnd110, pinnd111 = pinndfn54(arg)
									if pinnd110 then
										return true, pinnd111
									end
									if getconnections_ then
										return false, pinnd111
									end
									return pinndfn55(arg)
								end
							end
						end
					end
					tbl20 = {
						ready = false,
						why = "EventController unavailable",
						IsBlocked = function()
							return false
						end,
					}
					do
						local function pinndfn53(arg)
							local pinnd110 = pinnd85:FindFirstChild("Controllers")
							pinnd110 = pinnd110 and pinnd110:FindFirstChild(arg, true)
							if not (pinnd110 and pinnd110:IsA("ModuleScript")) then
								return nil
							end
							local ok, result = pcall(require, pinnd110)
							if ok and type(result) == "table" then
								return result
							end
						end
						local EventController = pinndfn53("EventController")
						local EffectController = pinndfn53("EffectController")
						local flag23 = EventController and type(EventController.Events) == "table"
						if flag23 then
							local pinnd110 = "function"
							flag23 = type(EventController.Execute) == pinnd110
						end
						if not flag23 then
							tbl20.why = "EventController missing Events/Execute"
						else
							local brainrotEventTool, pinnd110, pinndfn54, pinndfn55, pinndfn56, pinndfn57, pinndfn58
							do
								do
									brainrotEventTool = _G.__BrainrotEventTool
									if not brainrotEventTool then
										brainrotEventTool = {}
										_G.__BrainrotEventTool = brainrotEventTool
									end
									brainrotEventTool.origExecute = brainrotEventTool.origExecute or EventController.Execute
									brainrotEventTool.origGetActive = brainrotEventTool.origGetActive or EventController.GetActiveEvents
									if EffectController then
										brainrotEventTool.origRun = brainrotEventTool.origRun or EffectController.Run
									end
									brainrotEventTool.fakes = brainrotEventTool.fakes or {}
									brainrotEventTool.capture = brainrotEventTool.capture or {}
									brainrotEventTool.spawned = brainrotEventTool.spawned or {}
									brainrotEventTool.clearedAttrs = brainrotEventTool.clearedAttrs or {}
									brainrotEventTool.stashed = brainrotEventTool.stashed or {}
									if brainrotEventTool.blocked == nil then
										brainrotEventTool.blocked = false
									end
									tbl20.S = brainrotEventTool
									tbl20.IsBlocked = function()
										return brainrotEventTool.blocked and true or false
									end
									pinnd110 = nil
									do
										local getupvalue_ = debug and debug.getupvalue
										if getupvalue_ then
											local ok, result = pcall(getupvalue_, brainrotEventTool.origExecute, 5)
											if ok and type(result) == "table" then
												pinnd110 = result
											end
										end
									end
								end
								if not brainrotEventTool.shimmed then
									EventController.GetActiveEvents = function(arg)
										local tbl23 = {}
										if not brainrotEventTool.blocked then
											local ok, result = pcall(brainrotEventTool.origGetActive, arg)
											if ok and type(result) == "table" then
												for _, pinnd112 in pairs(result) do
													tbl23[#tbl23 + 1] = pinnd112
												end
											end
										end
										for _, fake in pairs(brainrotEventTool.fakes) do
											tbl23[#tbl23 + 1] = fake
										end
										return tbl23
									end
									brainrotEventTool.shimmed = true
								end
								pinndfn54 = function()
									local pinnd111 = pinndfn53("LightingController")
									if pinnd111 and type(pinnd111.Update) == "function" then
										pcall(function()
											pinnd111:Update()
										end)
									end
									local SoundController = pinndfn53("SoundController")
									local flag24
									if SoundController then
										local pinnd112 = "function"
										flag24 = type(SoundController.UpdateOST) == pinnd112
									else
										flag24 = SoundController
									end
									if flag24 then
										pcall(function()
											SoundController:UpdateOST()
										end)
									end
								end
								pinndfn55 = function(arg)
									return arg:IsA("Sky") or arg:IsA("Atmosphere") or arg:IsA("Clouds") or arg:IsA("PostEffect")
								end
								pinndfn56 = function()
									local flag24 = EffectController
									if EffectController then
										local pinnd111 = "table"
										flag24 = type(EffectController.ActiveEffects) == pinnd111
									end
									if not flag24 then
										return 0
									end
									local tbl23 = {}
									for k in pairs(EffectController.ActiveEffects) do
										tbl23[#tbl23 + 1] = k
									end
									for _, pinnd111 in ipairs(tbl23) do
										local pinnd112 = "table"
										local flag25 = type(EffectController.Effects) == pinnd112 and EffectController.Effects[pinnd111] or nil
										EffectController.ActiveEffects[pinnd111] = nil
										if type(flag25) == "table" then
											local pinnd113 = "function"
											if type(flag25.OnUpdate) == pinnd113 then
												pcall(function()
													flag25:OnUpdate()
												end)
											end
											if type(flag25.OnStop) == "function" then
												pcall(function()
													flag25:OnStop()
												end)
											end
										end
									end
									return #tbl23
								end
								do
									local tbl23 = {
										EventsLoaded = true,
										NextCrystalEvent = true,
										CrystalEventLastTime = true,
										SantaMerchantStockId = true,
										SantaMerchantNextStockId = true,
										FuseMachineLuck = true,
										FuseMachineLuckTimer = true,
									}
									local tbl24 = {
										"AyMiGatitoEvent",
										"ChicleteiraBicicleteiraEvent",
										"EasterEvent",
										"ExtinctEvent",
										"IndonesiaEvent",
										"MeowlEvent",
										"MexicoEvent",
										"RipMyGrannyEvent",
										"SkibidiEvent",
										"StPatricksEvent",
										"StrawberryEvent",
										"TrickOrTreatEvent",
										"ValentinesEvent",
										"YinYangEvent",
										"WitchingHourEvent",
									}
									local tbl25 = {
										"Lighting",
										"WallRecolor",
										"Atmosphere",
									}
									pinndfn57 = function()
										if not (EffectController and type(EffectController.Effects) == "table") then
											return
										end
										for _, pinnd111 in ipairs(tbl25) do
											local pinnd112 = EffectController.Effects[pinnd111]
											local flag24
											if pinnd112 then
												local pinnd113 = "function"
												flag24 = type(pinnd112.OnUpdate) == pinnd113
											else
												flag24 = pinnd112
											end
											if flag24 then
												pcall(function()
													pinnd112:OnUpdate()
												end)
											end
										end
									end
									pinndfn58 = function()
										local tbl26 = {}
										for _, pinnd111 in ipairs(tbl24) do
											tbl26[pinnd111] = true
										end
										local pinnd111 = 0
										for k, pinnd112 in pairs(pinnd85:GetAttributes()) do
											local pinnd113 = "string"
											local flag24 = type(k) == pinnd113 and pinnd112 == true and not tbl23[k]
											local pos
											if flag24 then
												pos = tbl26[k] or k:find("Event") or k:find("Phase") or k:find("Hour")
											else
												pos = flag24
											end
											if pos then
												pcall(function()
													pinnd85:SetAttribute(k, nil)
												end)
												brainrotEventTool.clearedAttrs[k] = true
												pinnd111 += 1
											end
										end
										pinndfn57()
										return pinnd111
									end
								end
							end
							do
								local function pinndfn59()
									local pinndn35 = 0
									for k in pairs(brainrotEventTool.clearedAttrs) do
										pcall(function()
											pinnd85:SetAttribute(k, true)
										end)
										pinndn35 += 1
									end
									table.clear(brainrotEventTool.clearedAttrs)
									pinndfn57()
									return pinndn35
								end
								local function pinndfn60()
									local pinndn35 = 0
									for _, descendant in ipairs(workspace:GetDescendants()) do
										if descendant:IsA("Sound") and descendant.Playing and descendant.Looped then
											pcall(function()
												descendant:Stop()
											end)
											pinndn35 += 1
										end
									end
									return pinndn35
								end
								local function pinndfn61()
									local pinndn35 = 0
									for k, pinnd111 in pairs(brainrotEventTool.stashed) do
										if typeof(k) == "Instance" then
											pcall(function()
												k.Parent = pinnd111
											end)
											pinndn35 += 1
										end
										brainrotEventTool.stashed[k] = nil
									end
									return pinndn35
								end
								local function pinndfn62()
									local effects = _G.Effects
									if type(effects) == "table" and type(effects.Block) == "function" and type(effects.Unblock) == "function" then
										return effects
									end
								end
								tbl20.Block = function()
									local pinnd111 = pinndfn62()
									if pinnd111 then
										pinnd111.Block()
										brainrotEventTool.blocked = true
										return true, "blocked (effects panel)"
									end
									local pinndn35 = 0
									for k, event in pairs(EventController.Events) do
										if type(event) == "table" and rawget(event, "Active") then
											if not (type(EventController.Cancel) == "function" and pcall(function()
												return EventController:Cancel(k)
											end)) then
												rawset(event, "Active", false)
												rawset(event, "__started", false)
											end
											pinndn35 += 1
										end
									end
									local pinnd112 = pinndfn56()
									for k, pinnd113 in pairs(brainrotEventTool.capture) do
										local flag24 = type(pinnd113) == "table"
										if flag24 then
											local pinnd114 = "table"
											flag24 = type(pinnd113.caught) == pinnd114
										end
										if flag24 then
											for k2 in pairs(pinnd113.caught) do
												local pinnd114 = "Instance"
												if typeof(k2) == pinnd114 and k2.Parent and not pinndfn55(k2) then
													pcall(function()
														k2:Destroy()
													end)
												end
											end
										end
										brainrotEventTool.capture[k] = nil
									end
									table.clear(brainrotEventTool.spawned)
									table.clear(brainrotEventTool.fakes)
									if pinnd110 then
										for k, pinnd113 in pairs(pinnd110) do
											local pinnd114 = "table"
											if type(pinnd113) == pinnd114 then
												for _, pinnd115 in ipairs(pinnd113) do
													if typeof(pinnd115) == "Instance" and not pinndfn55(pinnd115) then
														pcall(function()
															pinnd115:Destroy()
														end)
													end
												end
											end
											pinnd110[k] = nil
										end
									end
									EventController.Execute = function()
										return false
									end
									if EffectController then
										EffectController.Run = function()
											return false, false
										end
									end
									brainrotEventTool.blocked = true
									pinndfn54()
									pinndfn58()
									local pinnd113 = pinndfn60()
									return true, ("blocked %d event(s), %d fx, %d sound(s)"):format(pinndn35, pinnd112, pinnd113)
								end
								tbl20.Unblock = function()
									local pinnd111 = pinndfn62()
									if pinnd111 then
										pinnd111.Unblock()
										brainrotEventTool.blocked = false
										return true, "unblocked (effects panel)"
									end
									EventController.Execute = brainrotEventTool.origExecute
									if EffectController and brainrotEventTool.origRun then
										EffectController.Run = brainrotEventTool.origRun
									end
									brainrotEventTool.blocked = false
									local pinnd112 = pinndfn59()
									local pinnd113 = pinndfn61()
									pinndfn54()
									return true, ("unblocked - %d flag(s), %d model(s) restored"):format(pinnd112, pinnd113)
								end
							end
							tbl20.ready = true
							tbl20.why = nil
						end
					end
				end
				local pinnd110
				do
					do
						tbl21 = {
							bg = Color3.fromRGB(4, 10, 24),
							panel = Color3.fromRGB(8, 20, 43),
							panel2 = Color3.fromRGB(14, 37, 72),
							line = Color3.fromRGB(35, 83, 145),
							acc = Color3.fromRGB(35, 135, 255),
							acc2 = Color3.fromRGB(12, 62, 150),
							accHi = Color3.fromRGB(105, 190, 255),
							txt = Color3.fromRGB(235, 245, 255),
							sub = Color3.fromRGB(145, 180, 220),
							ok = Color3.fromRGB(55, 195, 105),
							err = Color3.fromRGB(205, 50, 50),
							warn = Color3.fromRGB(255, 215, 0),
							input = Color3.fromRGB(5, 14, 31),
							dark = Color3.fromRGB(3, 8, 19),
						}
						gothamMedium = Enum.Font.GothamMedium
						gothamBold = Enum.Font.GothamBold
						gothamBlack = Enum.Font.GothamBlack
						pinndfn42 = function(arg, arg2, parent)
							local instance = Instance.new(arg)
							local pinnd111 = pairs
							local tbl23 = arg2 or {}
							for k, pinnd112 in pinnd111(tbl23) do
								instance[k] = pinnd112
							end
							if parent then
								instance.Parent = parent
							end
							return instance
						end
						pinndfn43 = function(arg, arg2)
							pinndfn42("UICorner", { CornerRadius = UDim.new(0, arg2 or 8) }, arg)
						end
						pinndfn44 = function(arg, arg2, arg3, arg4)
							return pinndfn42("UIStroke", { Color = arg2 or tbl21.line, Thickness = arg3 or 1, Transparency = arg4 or 0 }, arg)
						end
						pinndfn45 = function(arg, arg2, arg3, arg4)
							pinnd109:Create(arg, TweenInfo.new(arg2, arg4 or Enum.EasingStyle.Quad), arg3):Play()
						end
						do
							local function pinndfn53(arg, arg2, arg3, arg4)
								return pinndfn42("UIGradient", { Color = ColorSequence.new(arg2, arg3), Rotation = arg4 or 90 }, arg)
							end
							pinndfn46 = function(arg, arg2, arg3, arg4, arg5, arg6)
								return pinndfn42("TextLabel", {
									BackgroundTransparency = 1,
									Text = arg,
									Font = arg4 or gothamMedium,
									TextSize = arg2 or 12,
									TextColor3 = arg3 or tbl21.txt,
									TextXAlignment = arg5 or Enum.TextXAlignment.Left,
									}, arg6)
							end
							local function pinndfn54(arg, arg2)
								local flag23 = nil
								local pinnd111 = nil
								local pinnd112 = nil
								arg.InputBegan:Connect(function(input)
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
										local position = input.Position
										local position2 = arg2.Position
										flag23 = true
										pinnd111 = position
										pinnd112 = position2
										input.Changed:Connect(function()
											if input.UserInputState == Enum.UserInputState.End then
												flag23 = false
											end
										end)
									end
								end)
								pinnd86.InputChanged:Connect(function(input)
									if flag23 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
										local pinndn35 = input.Position - pinnd111
										arg2.Position = UDim2.new(pinnd112.X.Scale, pinnd112.X.Offset + pinndn35.X, pinnd112.Y.Scale, pinnd112.Y.Offset + pinndn35.Y)
									end
								end)
							end
							pinndfn47 = function(arg, arg2, arg3, arg4)
								local pinnd111 = pinndfn42("Frame", {
									Name = arg,
									Size = UDim2.fromOffset(arg2, arg3),
									BackgroundColor3 = tbl21.bg,
									BorderSizePixel = 0,
									Active = true,
									ClipsDescendants = true,
								})
								pinndfn43(pinnd111, 14)
								pinndfn53(pinnd111, Color3.fromRGB(20, 15, 21), Color3.fromRGB(6, 6, 10), 90)
								pinndfn44(pinnd111, tbl21.acc, 1.5, 0.45)
								if flag18 then
									pinndfn42("UIScale", { Name = "WinScale", Scale = pinnd91 }, pinnd111)
								end
								local Frame7 = pinndfn42("Frame", { Size = UDim2.new(1, 0, 0, 44), BackgroundColor3 = tbl21.panel, BorderSizePixel = 0 }, pinnd111)
								pinndfn43(Frame7, 14)
								pinndfn42("Frame", {
									Size = UDim2.new(1, 0, 0, 14),
									Position = UDim2.new(0, 0, 1, -14),
									BackgroundColor3 = tbl21.panel,
									BorderSizePixel = 0,
									}, Frame7)
								local ImageLabel = pinndfn42("ImageLabel", {
									Size = UDim2.fromOffset(24, 24),
									Position = UDim2.new(0, 12, 0.5, -12),
									BackgroundColor3 = tbl21.panel2,
									BorderSizePixel = 0,
									Image = "",
							ImageTransparency = 1,
									}, Frame7)
								pinndfn43(ImageLabel, 12)
							local PLogo = pinndfn42("TextLabel", {
								Name = "PINNLogoP",
								Size = UDim2.fromScale(1, 1),
								BackgroundTransparency = 1,
								Text = "P",
								Font = gothamBlack,
								TextSize = 19,
								TextColor3 = Color3.fromRGB(255, 255, 255),
								TextStrokeTransparency = 0.65,
								ZIndex = ImageLabel.ZIndex + 1,
							}, ImageLabel)
								pinndfn44(ImageLabel, tbl21.acc, 1.5, 0.2)
								local pinnd112 = pinndfn46(arg4, 14, tbl21.txt, gothamBlack, Enum.TextXAlignment.Left, Frame7)
								pinnd112.Size = UDim2.new(1, -80, 1, 0)
								pinnd112.Position = UDim2.fromOffset(44, 0)
								pinndfn54(Frame7, pinnd111)
								return pinnd111, Frame7, ImageLabel, pinnd112
							end
							pinndfn48 = function(arg, arg2)
								local TextButton2 = pinndfn42("TextButton", {
									BackgroundColor3 = tbl21.panel2,
									Text = arg,
									Font = gothamBold,
									TextSize = 12,
									TextColor3 = tbl21.txt,
									AutoButtonColor = false,
									BorderSizePixel = 0,
									}, arg2)
								pinndfn43(TextButton2, 8)
								local pinnd111 = pinndfn44(TextButton2, tbl21.line, 1, 0.2)
								TextButton2.MouseEnter:Connect(function()
									pinndfn45(TextButton2, 0.12, { BackgroundColor3 = tbl21.panel })
									pinndfn45(pinnd111, 0.12, { Color = tbl21.acc, Transparency = 0 })
								end)
								TextButton2.MouseLeave:Connect(function()
									pinndfn45(TextButton2, 0.12, { BackgroundColor3 = tbl21.panel2 })
									pinndfn45(pinnd111, 0.12, { Color = tbl21.line, Transparency = 0.2 })
								end)
								return TextButton2
							end
							pinndfn49 = function(arg, arg2)
								local TextButton2 = pinndfn42("TextButton", {
									BackgroundColor3 = tbl21.acc,
									Text = arg,
									Font = gothamBlack,
									TextSize = 13,
									TextColor3 = Color3.fromRGB(255, 255, 255),
									AutoButtonColor = false,
									BorderSizePixel = 0,
									}, arg2)
								pinndfn43(TextButton2, 8)
								pinndfn53(TextButton2, tbl21.acc, tbl21.acc2, 90)
								TextButton2.MouseEnter:Connect(function()
									pinndfn45(TextButton2, 0.12, { BackgroundColor3 = tbl21.accHi })
								end)
								TextButton2.MouseLeave:Connect(function()
									pinndfn45(TextButton2, 0.12, { BackgroundColor3 = tbl21.acc })
								end)
								return TextButton2
							end
						end
					end
do
	local hui
	do
		local ok, h = pcall(function() return gethui() end)
		if ok and h and typeof(h) == "Instance" then
			hui = h
		else
			local ok2, c = pcall(function() return game:GetService("CoreGui") end)
			if ok2 and c then hui = c else hui = pinnd87 end
		end
	end
	
	local traced
	pcall(function() traced = hui:FindFirstChild("PINN_LARP_REDEM") end)
	if traced then
		traced:Destroy()
	end
						ScreenGui = pinndfn42("ScreenGui", {
							Name = "PINN_LARPER",
							ResetOnSpawn = false,
							ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
							DisplayOrder = 250,
							}, hui)
					end
					do
						local pinnd111, pinnd112
						Main, pinnd110, pinnd111, pinnd112 = pinndfn47("Main", 316, 548, "PINN LARP REDEM")
						Main.Position = UDim2.new(1, -340, 0.5, -274)
						if flag18 then
							Main.Position = UDim2.new(1, -math.floor(316 * pinnd91) - 8, 0.5, -math.floor(548 * pinnd91 / 2))
						end
						Main.Parent = ScreenGui
						pinnd112.Size = UDim2.new(1, -262, 1, 0)
					end
				end
				do
					pinndfn43(pinndfn42("ImageLabel", {
						Name = "CityBg",
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ZIndex = 0,
						Image = "rbxthumb://type=Asset&id=96519310989847&w=420&h=420",
						ImageTransparency = 0.5,
						ImageColor3 = Color3.fromRGB(65, 135, 235),
						ScaleType = Enum.ScaleType.Crop,
						}, Main), 14)
					do
						local Frame7 = pinndfn42("Frame", {
							Name = "LeavesLayer",
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							ZIndex = 0,
							ClipsDescendants = true,
							}, Main)
						pinndfn43(Frame7, 14)
						local tbl23 = {}
						local color = Color3.fromRGB(45, 135, 255)
						local color2 = Color3.fromRGB(25, 95, 220)
						local color3 = Color3.fromRGB(90, 185, 255)
						local color4 = Color3.fromRGB(155, 215, 255)
						local color5 = Color3.fromRGB
						local pinnd111 = 160
						tbl23[1] = color
						tbl23[2] = color2
						tbl23[3] = color3
						tbl23[4] = color4
						do
							local values = table.pack(color5(35, 115, pinnd111))
							table.move(values, 1, values.n, 5, tbl23)
						end
						for i = 1, 18 do
							task.spawn(function()
								task.wait(math.random() * 2.5)
								while Frame7.Parent do
									local pinndn35 = math.random(5, 8)
									local pinndn36 = pinndn35 + math.random(2, 4)
									local pinndn37 = math.random()
									local pinnd112 = 0.3
									local Frame8 = pinndfn42("Frame", {
										Size = UDim2.new(0, pinndn35, 0, pinndn36),
										AnchorPoint = Vector2.new(0.5, 0.5),
										Position = UDim2.new(pinndn37, 0, 0, -pinndn36),
										BackgroundColor3 = tbl23[math.random(#tbl23)],
										BackgroundTransparency = 0.15 + math.random() * pinnd112,
										BorderSizePixel = 0,
										ZIndex = 0,
										Rotation = math.random(0, 359),
										}, Frame7)
									pinndfn42("UICorner", { CornerRadius = UDim.new(1, 0) }, Frame8)
									local new = NumberSequenceKeypoint.new
									pinndfn42("UIGradient", {
										Rotation = math.random(0, 359),
										Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), new(1, 0.55) }),
										}, Frame8)
									local pinndn38 = 4 + math.random() * 2.6
									local pinnd113 = 0.3
									local pinndn39 = (math.random() - 0.5) * pinnd113
									local pinndn40 = math.random(180, 540)
									local pinndn41 = math.random() < 0.5 and -1 or 1
									pinnd109:Create(Frame8, TweenInfo.new(pinndn38, Enum.EasingStyle.Linear), { Position = UDim2.new(pinndn37 + pinndn39, 0, 1, pinndn36 * 2), Rotation = Frame8.Rotation + pinndn40 * pinndn41 }):Play()
									task.wait(pinndn38)
									if Frame8 and Frame8.Parent then
										Frame8:Destroy()
									end
									task.wait(math.random() * 0.5)
								end
							end)
						end
					end
				end
				do
					Frame = pinndfn42("Frame", {
						Size = UDim2.fromOffset(8, 8),
						Position = UDim2.new(1, -212, 0.5, -4),
						BackgroundColor3 = tbl21.sub,
						BorderSizePixel = 0,
						Visible = false,
						}, pinnd110)
					pinndfn43(Frame, 4)
					Rag = pinndfn48("Rag", pinnd110)
					Rag.Size = UDim2.fromOffset(38, 22)
					Rag.Position = UDim2.new(1, -200, 0.5, -11)
					Rag.TextSize = 10
					pinnd97 = pinndfn48("Test", pinnd110)
					pinnd97.Size = UDim2.fromOffset(38, 22)
					pinnd97.Position = UDim2.new(1, -157, 0.5, -11)
					pinnd97.TextSize = 10
					pinnd98 = pinndfn48("FEED", pinnd110)
					pinnd98.Size = UDim2.fromOffset(38, 22)
					pinnd98.Position = UDim2.new(1, -114, 0.5, -11)
					pinnd98.TextSize = 10
					Settings = pinndfn48("Settings", pinnd110)
					Settings.Size = UDim2.fromOffset(38, 22)
					Settings.Position = UDim2.new(1, -71, 0.5, -11)
					Settings.TextSize = 8
					do
						local pinnd111 = pinndfn48("", pinnd110)
						pinnd111.Size = UDim2.fromOffset(22, 22)
						pinnd111.Position = UDim2.new(1, -28, 0.5, -11)
						pinndfn43(pinndfn42("Frame", {
							Size = UDim2.fromOffset(10, 2),
							Position = UDim2.new(0.5, -5, 0.5, -1),
							BackgroundColor3 = tbl21.txt,
							BorderSizePixel = 0,
							}, pinnd111), 1)
						local pinnd112 = pinndfn42("Frame", {
							Size = UDim2.fromOffset(2, 10),
							Position = UDim2.new(0.5, -1, 0.5, -5),
							BackgroundColor3 = tbl21.txt,
							BorderSizePixel = 0,
							Visible = false,
							}, pinnd111)
						pinndfn43(pinnd112, 1)
						pinndn34 = 548
						visible = false
						pinnd111.MouseButton1Click:Connect(function()
							visible = not visible
							pinnd112.Visible = visible
							pinndfn45(Main, 0.25, { Size = UDim2.fromOffset(316, visible and 179 or pinndn34) })
						end)
					end
				end
			end
			Frame6 = pinndfn42("Frame", {
				Size = UDim2.new(1, -20, 1, -54),
				Position = UDim2.fromOffset(10, 48),
				BackgroundTransparency = 1,
				}, Main)
			pinndfn42("UIListLayout", {
				Padding = UDim.new(0, 5),
				SortOrder = Enum.SortOrder.LayoutOrder,
				}, Frame6)
			do
				local Frame7 = pinndfn42("Frame", {
					Size = UDim2.new(1, 0, 0, 32),
					BackgroundColor3 = tbl21.panel,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					}, Frame6)
				pinndfn43(Frame7, 9)
				pinndfn44(Frame7, tbl21.line, 1, 0.3)
				local Frame8 = pinndfn42("Frame", {
					Size = UDim2.fromOffset(8, 8),
					Position = UDim2.new(0, 12, 0.5, -4),
					BackgroundColor3 = tbl21.sub,
					BorderSizePixel = 0,
					}, Frame7)
				pinndfn43(Frame8, 4)
				pinnd99 = pinndfn46("starting...", 12, tbl21.txt, gothamBold, Enum.TextXAlignment.Left, Frame7)
				pinnd99.Size = UDim2.new(1, -32, 1, 0)
				pinnd99.Position = UDim2.fromOffset(28, 0)
				pinnd99.TextTruncate = Enum.TextTruncate.AtEnd
				pinndfn50 = function(text, arg)
					pinnd99.Text = text
					local ok = arg == "ok" and tbl21.ok or arg == "err" and tbl21.err or arg == "busy" and tbl21.acc or arg == "wait" and tbl21.warn or tbl21.txt
					pinnd99.TextColor3 = ok
					Frame8.BackgroundColor3 = ok
				end
			end
		end
		do
			do
				do
					do
						local pinnd109 = pinndfn42("Frame", {
							Size = UDim2.new(1, 0, 0, 50),
							BackgroundColor3 = tbl21.panel,
							BorderSizePixel = 0,
							LayoutOrder = 2,
							}, Frame6)
						pinndfn43(pinnd109, 9)
						pinndfn44(pinnd109, tbl21.line, 1, 0.3)
						local pinnd110 = pinndfn46("CODE", 9, tbl21.acc, gothamBlack, Enum.TextXAlignment.Left, pinnd109)
						pinnd110.Size = UDim2.new(1, -16, 0, 11)
						pinnd110.Position = UDim2.fromOffset(11, 5)
						TextBox = pinndfn42("TextBox", {
							Size = UDim2.new(1, -18, 0, 26),
							Position = UDim2.fromOffset(9, 18),
							BackgroundColor3 = tbl21.input,
							Text = "",
							PlaceholderText = "type or snipe a code...",
							PlaceholderColor3 = tbl21.sub,
							Font = gothamBlack,
							TextSize = 14,
							TextColor3 = tbl21.txt,
							ClearTextOnFocus = false,
							BorderSizePixel = 0,
							TextXAlignment = Enum.TextXAlignment.Left,
							}, pinnd109)
					end
					do
						pinndfn43(TextBox, 7)
						do
							local pinnd109 = pinndfn44(TextBox, tbl21.line, 1.2, 0.25)
							pinndfn42("UIPadding", {
								PaddingLeft = UDim.new(0, 9),
								PaddingRight = UDim.new(0, 9),
								}, TextBox)
							TextBox.Focused:Connect(function()
								pinndfn45(pinnd109, 0.12, { Color = tbl21.acc, Transparency = 0 })
							end)
							TextBox.FocusLost:Connect(function()
								pinndfn45(pinnd109, 0.12, { Color = tbl21.line, Transparency = 0.25 })
							end)
						end
					end
					do
						local pinnd109 = pinndfn42("Frame", {
							Size = UDim2.new(1, 0, 0, 33),
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							}, Frame6)
						pinndfn42("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							Padding = UDim.new(0, 6),
							SortOrder = Enum.SortOrder.LayoutOrder,
							}, pinnd109)
						pinnd100 = pinndfn48("COPY", pinnd109)
						pinnd100.Size = UDim2.new(0.33333333333333331, -4, 1, 0)
						pinnd100.LayoutOrder = 1
						clear = pinndfn48("CLEAR", pinnd109)
						clear.Size = UDim2.new(0.33333333333333331, -4, 1, 0)
						clear.LayoutOrder = 2
						redeem = pinndfn49("REDEEM", pinnd109)
					end
				end
				do
					local pinndfn53
					do
						redeem.Size = UDim2.new(0.33333333333333331, -4, 1, 0)
						redeem.LayoutOrder = 3
						redeem.TextColor3 = Color3.fromRGB(0, 0, 0)
						pinndfn51 = function(arg, arg2, arg3, arg4, arg5)
							local Frame7 = pinndfn42("Frame", {
								Size = UDim2.new(1, 0, 0, 31),
								BackgroundColor3 = tbl21.panel,
								BorderSizePixel = 0,
								LayoutOrder = arg2,
								}, arg)
							pinndfn43(Frame7, 8)
							pinndfn44(Frame7, tbl21.line, 1, 0.3)
							local pinnd109 = pinndfn46(arg3, 11, tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame7)
							pinnd109.Size = UDim2.new(1, -56, 1, 0)
							pinnd109.Position = UDim2.fromOffset(12, 0)
							pinnd109.TextTruncate = Enum.TextTruncate.AtEnd
							local Frame8 = pinndfn42("Frame", {
								Size = UDim2.fromOffset(36, 18),
								Position = UDim2.new(1, -44, 0.5, -9),
								BackgroundColor3 = tbl21.line,
								BorderSizePixel = 0,
								}, Frame7)
							pinndfn43(Frame8, 9)
							local Frame9 = pinndfn42("Frame", {
								Size = UDim2.fromOffset(14, 14),
								Position = UDim2.new(0, 2, 0.5, -7),
								BackgroundColor3 = tbl21.txt,
								BorderSizePixel = 0,
								}, Frame8)
							pinndfn43(Frame9, 7)
							local pinnd110 = pinndfn42("TextButton", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "" }, Frame7)
							local flag23 = arg4
							local function pinndfn54()
								pinndfn45(Frame8, 0.16, { BackgroundColor3 = flag23 and tbl21.acc or tbl21.line })
								pinndfn45(Frame9, 0.16, { Position = UDim2.new(0, flag23 and 20 or 2, 0.5, -7) }, Enum.EasingStyle.Back)
								pinndfn45(pinnd109, 0.16, { TextColor3 = flag23 and tbl21.txt or tbl21.sub })
							end
							pinndfn54()
							pinnd110.MouseButton1Click:Connect(function()
								flag23 = not flag23
								pinndfn54()
								if arg5 then
									arg5(flag23)
								end
							end)
							return Frame7
						end
						pinndfn53 = function(arg, arg2, arg3, arg4)
							return pinndfn51(Frame6, arg, arg2, arg3, arg4)
						end
						do
							local Frame7 = pinndfn42("Frame", {
								Size = UDim2.new(1, 0, 0, 31),
								BackgroundColor3 = tbl21.panel,
								BorderSizePixel = 0,
								LayoutOrder = 4,
								}, Frame6)
							pinndfn43(Frame7, 8)
							pinndfn44(Frame7, tbl21.line, 1, 0.3)
							listen = pinndfn46("LISTEN", 11, tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame7)
							listen.Size = UDim2.new(1, -56, 1, 0)
							listen.Position = UDim2.fromOffset(12, 0)
							Frame2 = pinndfn42("Frame", {
								Size = UDim2.fromOffset(36, 18),
								Position = UDim2.new(1, -44, 0.5, -9),
								BackgroundColor3 = tbl21.line,
								BorderSizePixel = 0,
								}, Frame7)
							pinndfn43(Frame2, 9)
							Frame3 = pinndfn42("Frame", {
								Size = UDim2.fromOffset(14, 14),
								Position = UDim2.new(0, 2, 0.5, -7),
								BackgroundColor3 = tbl21.txt,
								BorderSizePixel = 0,
								}, Frame2)
							pinndfn43(Frame3, 7)
							TextButton = pinndfn42("TextButton", {
								Size = UDim2.fromScale(1, 1),
								BackgroundTransparency = 1,
								Text = "",
								}, Frame7)
						end
					end
					do
						Frame5 = pinndfn42("Frame", {
							Size = UDim2.new(1, 0, 0, 31),
							BackgroundColor3 = tbl21.panel,
							BorderSizePixel = 0,
							LayoutOrder = 5,
							}, Frame6)
						pinndfn43(Frame5, 8)
						pinndfn44(Frame5, tbl21.line, 1, 0.3)
						do
							local pinnd109 = pinndfn46("LISTEN KEY", 11, tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame5)
							pinnd109.Size = UDim2.new(1, -100, 1, 0)
							pinnd109.Position = UDim2.fromOffset(12, 0)
						end
					end
					pinnd101 = pinndfn48(listenKey and listenKey.Name or "-", Frame5)
					pinnd101.Size = UDim2.fromOffset(46, 24)
					pinnd101.Position = UDim2.new(1, -84, 0.5, -12)
					pinnd101.TextSize = 11
					pinnd102 = pinndfn48("X", Frame5)
					pinnd102.Size = UDim2.fromOffset(24, 24)
					pinnd102.Position = UDim2.new(1, -32, 0.5, -12)
					pinnd102.TextSize = 12
					Frame4 = pinndfn42("Frame", {
						Size = UDim2.new(1, 0, 0, 31),
						BackgroundColor3 = tbl21.panel,
						BorderSizePixel = 0,
						LayoutOrder = 6,
						}, Frame6)
					pinndfn43(Frame4, 8)
					pinndfn44(Frame4, tbl21.line, 1, 0.3)
					do
						local pinnd109 = pinndfn46("REDEEM KEY", 11, tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame4)
						pinnd109.Size = UDim2.new(1, -100, 1, 0)
						pinnd109.Position = UDim2.fromOffset(12, 0)
					end
					pinnd103 = pinndfn48(g and g.Name or "-", Frame4)
					pinnd103.Size = UDim2.fromOffset(46, 24)
					pinnd103.Position = UDim2.new(1, -84, 0.5, -12)
					pinnd103.TextSize = 11
					pinnd104 = pinndfn48("X", Frame4)
					pinnd104.Size = UDim2.fromOffset(24, 24)
					pinnd104.Position = UDim2.new(1, -32, 0.5, -12)
					pinnd104.TextSize = 12
					pinndfn53(7, "AUTO REDEEM", autoRedeem, function(arg)
						autoRedeem = arg
						_G.__RdmCfgSet("autoRedeem", arg)
					end)
					pinndfn53(8, "AUTO TYPE", autoType, function(arg)
						autoType = arg
						_G.__RdmCfgSet("autoType", arg)
					end)
					pinndfn53(9, "MANUAL", manual, function(arg)
						manual = arg
						tbl19 = {}
						pinndfn52()
					end)
				end
				do
					local function pinndfn53(arg, arg2, arg3, arg4, arg5)
						local Frame7 = pinndfn42("Frame", {
							Size = UDim2.new(1, 0, 0, 31),
							BackgroundColor3 = tbl21.panel,
							BorderSizePixel = 0,
							LayoutOrder = arg,
							}, Frame6)
						pinndfn43(Frame7, 8)
						pinndfn44(Frame7, tbl21.line, 1, 0.3)
						local pinnd109 = pinndfn46(arg2, 11, tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame7)
						pinnd109.Size = UDim2.fromOffset(56, 31)
						pinnd109.Position = UDim2.fromOffset(11, 0)
						local pinnd110 = pinndfn42("Frame", {
							Size = UDim2.fromOffset(168, 23),
							Position = UDim2.new(1, -177, 0.5, -11.5),
							BackgroundColor3 = tbl21.input,
							BorderSizePixel = 0,
							}, Frame7)
						pinndfn43(pinnd110, 7)
						local tbl23 = {}
						local function pinndfn54(arg6)
							for k, pinnd111 in pairs(tbl23) do
								local flag23 = k == arg6
								pinndfn45(pinnd111, 0.12, { BackgroundColor3 = flag23 and tbl21.acc or tbl21.input })
								pinnd111.TextColor3 = flag23 and Color3.fromRGB(255, 255, 255) or tbl21.sub
							end
							if arg5 then
								arg5(arg6)
							end
						end
						for i, pinnd111 in ipairs(arg3) do
							local flag23 = type(pinnd111) == "table" and pinnd111[1] or pinnd111
							local flag24 = type(pinnd111) == "table" and pinnd111[2] or pinnd111
							local TextButton2 = pinndfn42("TextButton", {
								Size = UDim2.new(1 / #arg3, -2, 1, -2),
								Position = UDim2.new((i - 1) / #arg3, 1, 0, 1),
								BackgroundColor3 = tbl21.input,
								Text = flag24,
								Font = gothamBold,
								TextSize = flag24:find("\n") and 8 or 10,
								TextColor3 = tbl21.sub,
								AutoButtonColor = false,
								BorderSizePixel = 0,
								}, pinnd110)
							pinndfn43(TextButton2, 6)
							tbl23[flag23] = TextButton2
							TextButton2.MouseButton1Click:Connect(function()
								pinndfn54(flag23)
							end)
						end
						pinndfn54(arg4)
						return Frame7, pinndfn54
					end
					words = pinndfn53(11, "WORDS", { "1", "2", "3", "4" }, tostring(pinndn33), function(arg)
						pinndn33 = tonumber(arg) or 1
						tbl19 = {}
						if flag20 and not manual then
							pinndfn50(("listening... 0/%d"):format(pinndn33), "wait")
						end
					end)
					local Frame7 = pinndfn42("Frame", {
						Size = UDim2.new(1, 0, 0, 31),
						BackgroundColor3 = tbl21.panel,
						BorderSizePixel = 0,
						LayoutOrder = 12,
						}, Frame6)
					pinndfn43(Frame7, 8)
					pinnd105 = pinndfn44(Frame7, tbl21.line, 1, 0.3)
					pinnd106 = pinndfn46("SPAM", 11, tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame7)
					pinnd106.Size = UDim2.new(1, -94, 1, 0)
					pinnd106.Position = UDim2.fromOffset(11, 0)
					start = pinndfn48("START", Frame7)
					start.Size = UDim2.fromOffset(70, 24)
					start.Position = UDim2.new(1, -78, 0.5, -12)
					start.TextSize = 11
					pinnd107 = pinndfn42("Frame", {
						Size = UDim2.fromOffset(7, 7),
						Position = UDim2.new(0, 9, 0.5, -3.5),
						BackgroundColor3 = tbl21.line,
						BorderSizePixel = 0,
						}, start)
					pinndfn43(pinnd107, 4)
					pinndfn53(13, "REDEEM", { "MAX", { "WORD", "EVERY\nWORD" } }, _G.__RdmCfgBool("wordMode", false) and "WORD" or "MAX", function(arg)
						flag19 = arg == "WORD"
						if not flag19 then
							max = tbl22[arg] or tbl22.MAX
						end
						_G.__RdmCfgSet("speed", arg)
						_G.__RdmCfgSet("wordMode", flag19)
					end)
				end
			end
			do
				local Frame7
				do
					do
						do
							local pinnd109 = nil
							for _, descendant in ipairs(Frame6:GetDescendants()) do
								if descendant:IsA("TextButton") and descendant.Text == "EVERY\nWORD" then
									pinnd109 = descendant
									break
								else
									pinnd109 = nil
								end
							end
							if pinnd109 then
								pinndfn42("TextLabel", {
									Size = UDim2.fromOffset(64, 8),
									AnchorPoint = Vector2.new(0.5, 1),
									Position = UDim2.new(0.5, 0, 0, -1),
									BackgroundTransparency = 1,
									TextColor3 = tbl21.warn,
									TextTransparency = 0.35,
									Font = gothamBlack,
									TextSize = 8,
									Text = "RISKY",
									ZIndex = 3,
									}, pinnd109)
							end
						end
					end
					Frame7 = pinndfn42("Frame", {
						Size = UDim2.new(1, 0, 0, 31),
						BackgroundColor3 = tbl21.panel,
						BorderSizePixel = 0,
						LayoutOrder = 14,
						}, Frame6)
					pinndfn43(Frame7, 8)
					pinndfn44(Frame7, tbl21.line, 1, 0.3)
					do
						local events = pinndfn46("EVENTS", 11, tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame7)
						events.Size = UDim2.new(1, -104, 1, 0)
						events.Position = UDim2.fromOffset(11, 0)
					end
				end
				local blockAll = pinndfn48("BLOCK ALL", Frame7)
				blockAll.Size = UDim2.fromOffset(88, 24)
				blockAll.Position = UDim2.new(1, -97, 0.5, -12)
				blockAll.TextSize = 10
				local flag23 = false
				local pinnd109 = nil
				local str8 = nil
				local str9 = nil
				local pinndn35 = 0
				local function pinndfn53()
					local flag24 = os.clock() < pinndn35
					local str10 = tostring(tbl20.ready) .. tostring(flag24)
					if str10 == pinnd109 then
						return
					end
					pinnd109 = str10
					blockAll.Text = flag24 and "BLOCKED" or "BLOCK ALL"
					blockAll.TextColor3 = not tbl20.ready and tbl21.sub or flag24 and tbl21.ok or tbl21.txt
				end
				blockAll.MouseButton1Click:Connect(function()
					if flag23 then
						return
					end
					if not tbl20.ready then
						local pinnd110 = "err"
						pinndfn50("events: " .. tostring(tbl20.why), pinnd110)
						return
					end
					flag23 = true
					pinndfn50("blocking events...", "busy")
					task.spawn(function()
						local ok, result, result2 = pcall(tbl20.Block)
						if ok and result then
							result2 = result2 or "blocked"
							str8 = result2
							str9 = "ok"
						else
							str8 = "events: " .. tostring(result2 or result)
							str9 = "err"
						end
						flag23 = false
					end)
				end)
				task.spawn(function()
					while Frame7.Parent do
						if str8 then
							local pinnd110 = str8
							local pinnd111 = str9
							str8 = nil
							str9 = nil
							if pinnd111 == "ok" then
								pinndn35 = os.clock() + 1
							end
							pcall(pinndfn50, pinnd110, pinnd111)
						end
						pcall(pinndfn53)
						task.wait(0.2)
					end
				end)
				pinndfn53()
			end
		end
	end
	do
		local pinndfn53, Settings2
		do
			do
				do
					local pinndn35 = 548
					local pinndn36 = 36
					local tbl22 = {}
					local tbl23 = {}
					local pinndn37 = 0
					local function pinndfn54(arg, arg2, arg3)
						local flag23 = tbl22[arg]
						if flag23 == nil then
							flag23 = true
						end
						if flag23 == arg2 then
							return
						end
						tbl22[arg] = arg2
						local pinndn38 = (tbl23[arg] or 0) + 1
						tbl23[arg] = pinndn38
						pinndn37 = math.max(0, pinndn37 + (arg2 and -1 or 1))
						pinndn34 = pinndn35 - pinndn37 * pinndn36
						if not visible then
							if arg3 then
								Main.Size = UDim2.fromOffset(316, pinndn34)
							else
								pinndfn45(Main, 0.2, { Size = UDim2.fromOffset(316, pinndn34) }, Enum.EasingStyle.Quart)
							end
						end
						arg.ClipsDescendants = true
						if arg2 then
							arg.Visible = true
							if arg3 then
								arg.Size = UDim2.new(1, 0, 0, 31)
								arg.ClipsDescendants = false
								return
							end
							arg.Size = UDim2.new(1, 0, 0, 0)
							pinndfn45(arg, 0.2, { Size = UDim2.new(1, 0, 0, 31) }, Enum.EasingStyle.Quart)
							task.delay(0.22, function()
								if tbl23[arg] == pinndn38 then
									arg.ClipsDescendants = false
								end
							end)
						elseif arg3 then
							arg.Size = UDim2.new(1, 0, 0, 0)
							arg.Visible = false
							return
						else
							pinndfn45(arg, 0.2, { Size = UDim2.new(1, 0, 0, 0) }, Enum.EasingStyle.Quart)
							task.delay(0.22, function()
								if tbl23[arg] == pinndn38 then
									arg.Visible = false
								end
							end)
						end
					end
					pinndfn52 = function(arg)
						pinndfn54(words, not manual, arg)
					end
					pinndfn53 = function(arg)
						pinndfn54(Frame5, showKeybinds, arg)
						pinndfn54(Frame4, showKeybinds, arg)
					end
				end
			end
			do
				local pinnd109
				Settings2, pinnd109 = pinndfn47("Settings", 300, flag18 and 316 or 280, "SETTINGS")
				Settings2.Visible = false
				Settings2.Parent = ScreenGui
				local pinnd110 = pinndfn48("X", pinnd109)
				pinnd110.Size = UDim2.fromOffset(22, 22)
				pinnd110.Position = UDim2.new(1, -28, 0.5, -11)
				pinnd110.TextSize = 12
				pinnd110.MouseButton1Click:Connect(function()
					Settings2.Visible = false
				end)
			end
		end
		local Frame6
		do
			Frame6 = pinndfn42("Frame", {
				Size = UDim2.new(1, -20, 1, -60),
				Position = UDim2.fromOffset(10, 50),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				}, Settings2)
			pinndfn42("UIListLayout", {
				Padding = UDim.new(0, 5),
				SortOrder = Enum.SortOrder.LayoutOrder,
				}, Frame6)
			pinndfn51(Frame6, 1, "AUTO LISTEN", autoListen, function(arg)
				autoListen = arg
				_G.__RdmCfgSet("autoListen", arg)
			end)
			pinndfn51(Frame6, 2, "SPAM ON LISTEN", pinnd95, function(arg)
				pinnd95 = arg
				_G.__RdmCfgSet("spamOnListen", arg)
			end)
			pinndfn51(Frame6, 3, "SHOW KEYBINDS", showKeybinds, function(arg)
				showKeybinds = arg
				pinndfn53()
				_G.__RdmCfgSet("showKeybinds", arg)
			end)
			pinndfn51(Frame6, 4, "IGNORE SYSTEM PHRASES", pinnd96, function(arg)
				pinnd96 = arg
				_G.__RdmCfgSet("ignoreSystem", arg)
			end)
			do
				local pinnd109 = pinndfn51(Frame6, 6, "DUO MODE (WITH RIDDLER)", _G.__RdmDuo, function(rdmDuo)
					_G.__RdmDuo = rdmDuo
					_G.__RdmCfgSet("duo", rdmDuo)
					if _G.__SabDuoSync then
						_G.__SabDuoSync()
					end
					return
				end)
				local pinnd110 = pinndfn46("0/2", 10, tbl21.sub, gothamBold, Enum.TextXAlignment.Right, pinnd109)
				pinnd110.Size = UDim2.fromOffset(50, 31)
				pinnd110.Position = UDim2.new(1, -84, 0, 0)
				for _, child in ipairs(pinnd109:GetChildren()) do
					if child:IsA("TextLabel") and child ~= pinnd110 then
						child.Size = UDim2.new(1, -100, 1, 0)
					end
				end
				local function redeemer()
					local pinndn35 = (_G.__RiddlerDuo and 1 or 0) + (_G.__RdmDuo and 1 or 0)
					pinnd110.Text = pinndn35 .. "/2"
					pinnd110.TextColor3 = pinndn35 == 2 and tbl21.acc or pinndn35 == 1 and (tbl21.warn or tbl21.sub) or tbl21.sub
				end
				redeemer()
				_G.__SabDuoRefresh = _G.__SabDuoRefresh or {}
				_G.__SabDuoRefresh.redeemer = redeemer
				_G.__SabDuoSync = function()
					local pinnd111 = pairs
					local sabDuoRefresh = _G.__SabDuoRefresh or {}
					for _, pinnd112 in pinnd111(sabDuoRefresh) do
						pcall(pinnd112)
					end
				end
				_G.__SabDuoSync()
				task.spawn(function()
					while pinnd109.Parent do
						redeemer()
						task.wait(1)
					end
				end)
			end
		end
		do
			local Frame7
			do
				if flag18 then
					local Frame8
					do
						local Frame9 = pinndfn42("Frame", {
							Size = UDim2.new(1, 0, 0, 31),
							BackgroundColor3 = tbl21.panel,
							BorderSizePixel = 0,
							LayoutOrder = 5,
							}, Frame6)
						pinndfn43(Frame9, 8)
						pinndfn44(Frame9, tbl21.line, 1, 0.3)
						local uiSize = pinndfn46("UI SIZE", 11, tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame9)
						uiSize.Size = UDim2.fromOffset(70, 31)
						uiSize.Position = UDim2.fromOffset(11, 0)
						Frame8 = pinndfn42("Frame", {
							Size = UDim2.fromOffset(168, 23),
							Position = UDim2.new(1, -177, 0.5, -11.5),
							BackgroundColor3 = tbl21.input,
							BorderSizePixel = 0,
							}, Frame9)
					end
					pinndfn43(Frame8, 7)
					do
						local tbl22 = {}
						local function pinndfn54(arg, arg2)
							for k, pinnd109 in pairs(tbl22) do
								local flag23 = k == arg
								pinndfn45(pinnd109, 0.12, { BackgroundColor3 = flag23 and tbl21.acc or tbl21.input })
								pinnd109.TextColor3 = flag23 and Color3.fromRGB(255, 255, 255) or tbl21.sub
							end
							if arg2 then
								return
							end
							_G.__RdmCfgSet("uiSize", arg)
							if tbl18.refit then
								tbl18.refit()
							end
						end
						local tbl23 = { "BIG", "MEDIUM", "SMALL" }
						for i, pinnd109 in ipairs(tbl23) do
							local TextButton2 = pinndfn42("TextButton", {
								Size = UDim2.new(1 / #tbl23, -2, 1, -2),
								Position = UDim2.new((i - 1) / #tbl23, 1, 0, 1),
								BackgroundColor3 = tbl21.input,
								Text = pinnd109,
								Font = gothamBold,
								TextSize = 9,
								TextColor3 = tbl21.sub,
								AutoButtonColor = false,
								BorderSizePixel = 0,
								}, Frame8)
							pinndfn43(TextButton2, 6)
							tbl22[pinnd109] = TextButton2
							TextButton2.MouseButton1Click:Connect(function()
								pinndfn54(pinnd109)
							end)
						end
						pinndfn54(_G.__RdmCfgStr("uiSize", "MEDIUM"), true)
					end
				end
				Frame7 = pinndfn42("Frame", {
					Size = UDim2.new(1, 0, 0, 31),
					BackgroundColor3 = tbl21.panel,
					BorderSizePixel = 0,
					LayoutOrder = 6,
					}, Frame6)
				pinndfn43(Frame7, 8)
				pinndfn44(Frame7, tbl21.line, 1, 0.3)
				do
					local autoBuy = pinndfn46("AUTO BUY", 11, tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame7)
					autoBuy.Size = UDim2.new(1, -70, 1, 0)
					autoBuy.Position = UDim2.fromOffset(12, 0)
				end
			end
			local open = pinndfn48("OPEN", Frame7)
			open.Size = UDim2.fromOffset(52, 22)
			open.Position = UDim2.new(1, -60, 0.5, -11)
			open.TextSize = 10
			open.MouseButton1Click:Connect(function()
				Settings2.Visible = false
				if pinndfn31 then
					pinndfn31()
				end
			end)
		end
		do
			local function pinndfn54()
				if flag18 then
					Settings2.Position = UDim2.new(0.5, -math.floor(Settings2.AbsoluteSize.X / 2), 0.5, -math.floor(Settings2.AbsoluteSize.Y / 2))
				else
					local position = Main.Position
					Settings2.Position = UDim2.new(position.X.Scale, position.X.Offset - Settings2.AbsoluteSize.X - 10, position.Y.Scale, position.Y.Offset)
				end
				Settings2.Visible = true
			end
			pinnd108 = pinndfn54
			Settings.MouseButton1Click:Connect(function()
				if not Settings2.Visible then
					pinndfn54()
					return
				end
				Settings2.Visible = false
			end)
		end
		pinndfn53(true)
	end
	pinndfn52(true)
end
local Frame4, pinndfn52, pinndfn53, tbl22
do
	do
		do
			local Feed, pinnd109, pinnd110
			do
				do
					local pinnd111
					Feed, pinnd111 = pinndfn47("Feed", 300, 320, "LIVE FEED")
					Feed.Visible = false
					Feed.Parent = ScreenGui
					Frame4 = pinndfn42("Frame", {
						Size = UDim2.fromOffset(8, 8),
						Position = UDim2.new(1, -176, 0.5, -4),
						BackgroundColor3 = tbl21.sub,
						BorderSizePixel = 0,
						}, pinnd111)
					pinndfn43(Frame4, 4)
					pinnd109 = pinndfn46("0 caught", 10, tbl21.sub, gothamBold, Enum.TextXAlignment.Right, pinnd111)
					pinnd109.Size = UDim2.fromOffset(80, 44)
					pinnd109.Position = UDim2.new(1, -166, 0, 0)
					pinnd110 = pinndfn48("CLEAR", pinnd111)
					pinnd110.Size = UDim2.fromOffset(40, 22)
					pinnd110.Position = UDim2.new(1, -82, 0.5, -11)
					pinnd110.TextSize = 10
					local pinnd112 = pinndfn48("X", pinnd111)
					pinnd112.Size = UDim2.fromOffset(22, 22)
					pinnd112.Position = UDim2.new(1, -32, 0.5, -11)
					pinnd112.TextSize = 12
					pinnd112.MouseButton1Click:Connect(function()
						Feed.Visible = false
					end)
				end
			end
			local ScrollingFrame = pinndfn42("ScrollingFrame", {
				Size = UDim2.new(1, -18, 1, -56),
				Position = UDim2.fromOffset(11, 50),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 3,
				ScrollBarImageColor3 = tbl21.acc,
				ScrollBarImageTransparency = 0.3,
				CanvasSize = UDim2.new(),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				}, Feed)
			pinndfn42("UIListLayout", {
				Padding = UDim.new(0, 6),
				SortOrder = Enum.SortOrder.LayoutOrder,
				}, ScrollingFrame)
			local pinnd111 = pinndfn46("waiting for announcements...", 11, tbl21.sub, gothamMedium, Enum.TextXAlignment.Center, ScrollingFrame)
			pinnd111.Size = UDim2.new(1, 0, 0, 34)
			pinnd111.LayoutOrder = 999
			local tbl23 = {}
			local pinndn35 = 0
			pinndfn52 = nil
			local function pinndfn54()
				if flag18 then
					Feed.Position = UDim2.new(0.5, -math.floor(Feed.AbsoluteSize.X / 2), 0.5, -math.floor(Feed.AbsoluteSize.Y / 2))
				else
					local position = Main.Position
					Feed.Position = UDim2.new(position.X.Scale, position.X.Offset - Feed.AbsoluteSize.X - 10, position.Y.Scale, position.Y.Offset)
				end
				Feed.Visible = true
			end
			pinndfn53 = function(arg, arg2)
				if pinnd111 then
					pinnd111:Destroy()
					pinnd111 = nil
				end
				pinndn35 += 1
				pinnd109.Text = pinndn35 .. " caught"
				local Frame5 = pinndfn42("Frame", {
					Size = UDim2.new(1, -4, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = tbl21.panel,
					BorderSizePixel = 0,
					LayoutOrder = -pinndn35,
					}, ScrollingFrame)
				pinndfn43(Frame5, 9)
				pinndfn44(Frame5, arg2 and tbl21.acc or tbl21.line, 1, arg2 and 0.3 or 0.5)
				pinndfn42("UIPadding", {
					PaddingTop = UDim.new(0, 8),
					PaddingBottom = UDim.new(0, 8),
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10),
					}, Frame5)
				pinndfn42("UIListLayout", { Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder }, Frame5)
				local pinnd112 = pinndfn42("Frame", { Size = UDim2.new(1, 0, 0, 12), BackgroundTransparency = 1, LayoutOrder = 1 }, Frame5)
				pinndfn43(pinndfn42("Frame", {
					Size = UDim2.fromOffset(6, 6),
					Position = UDim2.new(0, 0, 0.5, -3),
					BackgroundColor3 = arg2 and tbl21.acc or tbl21.sub,
					BorderSizePixel = 0,
					}, pinnd112), 3)
				pinndfn46("NOTIFY", 8, tbl21.acc, gothamBlack, Enum.TextXAlignment.Left, pinnd112).Position = UDim2.fromOffset(12, 0)
				local sub = tbl21.sub
				local right = Enum.TextXAlignment.Right
				local pinnd113 = pinndfn46(os.date("%H:%M:%S"), 8, sub, gothamMedium, right, pinnd112)
				pinnd113.Size = UDim2.new(0, 60, 1, 0)
				pinnd113.Position = UDim2.new(1, -60, 0, 0)
				local pinnd114 = pinndfn46(arg, 10, tbl21.txt, gothamMedium, Enum.TextXAlignment.Left, Frame5)
				pinnd114.Size = UDim2.new(1, 0, 0, 0)
				pinnd114.AutomaticSize = Enum.AutomaticSize.Y
				pinnd114.TextWrapped = true
				pinnd114.LayoutOrder = 2
				if arg2 then
					local Frame6 = pinndfn42("Frame", {
						Size = UDim2.new(1, 0, 0, 24),
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						}, Frame5)
					local TextLabel = pinndfn42("TextLabel", {
						Size = UDim2.new(0.5, -3, 1, 0),
						BackgroundColor3 = tbl21.input,
						Text = arg2,
						Font = gothamBlack,
						TextSize = 12,
						TextColor3 = tbl21.acc,
						BorderSizePixel = 0,
						}, Frame6)
					pinndfn43(TextLabel, 6)
					pinndfn44(TextLabel, tbl21.acc, 1, 0.4)
					local copy = pinndfn48("COPY", Frame6)
					copy.Size = UDim2.new(0.22, -3, 1, 0)
					copy.Position = UDim2.new(0.52, 3, 0, 0)
					copy.TextSize = 9
					copy.MouseButton1Click:Connect(function()
						copy.Text = pinndfn35(arg2) and "OK" or "ERR"
						task.delay(0.7, function()
							if copy.Parent then
								copy.Text = "COPY"
							end
						end)
					end)
					local pinnd115 = pinndfn49("USE", Frame6)
					pinnd115.Size = UDim2.new(0.26, -3, 1, 0)
					pinnd115.Position = UDim2.new(0.74, 3, 0, 0)
					pinnd115.TextSize = 10
					pinnd115.MouseButton1Click:Connect(function()
						pinnd115.Text = "..."
						pinndfn52(arg2)
						pinnd115.Text = "USE"
					end)
				end
				table.insert(tbl23, Frame5)
				if #tbl23 > tbl18.maxFeed then
					local pinnd115 = table.remove(tbl23, 1)
					if pinnd115 then
						pinnd115:Destroy()
					end
				end
			end
			pinnd110.MouseButton1Click:Connect(function()
				for _, pinnd112 in ipairs(tbl23) do
					pinnd112:Destroy()
				end
				tbl23 = {}
				pinndn35 = 0
				pinnd109.Text = "0 caught"
				if not pinnd111 then
					pinnd111 = pinndfn46("waiting for announcements...", 11, tbl21.sub, gothamMedium, Enum.TextXAlignment.Center, ScrollingFrame)
					pinnd111.Size = UDim2.new(1, 0, 0, 34)
					pinnd111.LayoutOrder = 999
				end
			end)
			pinnd98.MouseButton1Click:Connect(function()
				if Feed.Visible then
					Feed.Visible = false
					return
				end
				pinndfn54()
			end)
		end
		do
			local pinnd109, pinnd110, TextBox2
			do
				do
					local pinnd111
					pinnd109, pinnd111 = pinndfn47("Test", 300, 178, "FAKE NOTIFY")
					pinnd109.Visible = false
					pinnd109.Parent = ScreenGui
					local pinnd112 = pinndfn48("X", pinnd111)
					pinnd112.Size = UDim2.fromOffset(22, 22)
					pinnd112.Position = UDim2.new(1, -28, 0.5, -11)
					pinnd112.TextSize = 12
					pinnd112.MouseButton1Click:Connect(function()
						pinnd109.Visible = false
					end)
				end
				do
					pinnd110 = pinndfn42("Frame", {
						Size = UDim2.new(1, -24, 1, -58),
						Position = UDim2.fromOffset(12, 50),
						BackgroundTransparency = 1,
						}, pinnd109)
					pinndfn42("UIListLayout", {
						Padding = UDim.new(0, 8),
						SortOrder = Enum.SortOrder.LayoutOrder,
						}, pinnd110)
					do
						local Frame5 = pinndfn42("Frame", {
							Size = UDim2.new(1, 0, 0, 54),
							BackgroundColor3 = tbl21.panel,
							BorderSizePixel = 0,
							LayoutOrder = 1,
							}, pinnd110)
						pinndfn43(Frame5, 9)
						pinndfn44(Frame5, tbl21.line, 1, 0.3)
						local message = pinndfn46("MESSAGE", 9, tbl21.acc, gothamBlack, Enum.TextXAlignment.Left, Frame5)
						message.Size = UDim2.new(1, -16, 0, 12)
						message.Position = UDim2.fromOffset(11, 6)
						TextBox2 = pinndfn42("TextBox", {
							Size = UDim2.new(1, -18, 0, 26),
							Position = UDim2.fromOffset(9, 20),
							BackgroundColor3 = tbl21.input,
							Text = "",
							PlaceholderText = "type a fake announcement...",
							PlaceholderColor3 = tbl21.sub,
							Font = gothamBlack,
							TextSize = 12,
							TextColor3 = tbl21.txt,
							ClearTextOnFocus = false,
							BorderSizePixel = 0,
							TextXAlignment = Enum.TextXAlignment.Left,
							}, Frame5)
					end
				end
				pinndfn43(TextBox2, 7)
				do
					local pinnd111 = pinndfn44(TextBox2, tbl21.line, 1.2, 0.25)
					pinndfn42("UIPadding", {
						PaddingLeft = UDim.new(0, 9),
						PaddingRight = UDim.new(0, 9),
						}, TextBox2)
					TextBox2.Focused:Connect(function()
						pinndfn45(pinnd111, 0.12, { Color = tbl21.acc, Transparency = 0 })
					end)
					TextBox2.FocusLost:Connect(function()
						pinndfn45(pinnd111, 0.12, { Color = tbl21.line, Transparency = 0.25 })
					end)
				end
			end
			local testCode, send
			do
				local pinnd111 = pinndfn42("Frame", {
					Size = UDim2.new(1, 0, 0, 34),
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					}, pinnd110)
				testCode = pinndfn48("TEST CODE", pinnd111)
				testCode.Size = UDim2.new(0.4, -4, 1, 0)
				send = pinndfn49("SEND", pinnd111)
			end
			send.Size = UDim2.new(0.6, -4, 1, 0)
			send.Position = UDim2.new(0.4, 4, 0, 0)
			do
				local pinnd111 = pinndfn46("", 10, tbl21.sub, gothamMedium, Enum.TextXAlignment.Left, pinnd110)
				pinnd111.Size = UDim2.new(1, -4, 0, 14)
				pinnd111.LayoutOrder = 3
				local function pinndfn54(arg)
					local localTest = pinndfn34(arg)
					if localTest == "" then
						pinnd111.Text = "nothing to send"
						pinnd111.TextColor3 = tbl21.err
						return
					end
					if not (pinnd94 and not flag22 and typeof(firesignal) == "function") then
						local ok = pcall(pinndfn30, localTest, nil, nil, "Top", 2678001507)
						pinnd111.Text = ok and "local test: " .. localTest or "handler error"
						pinnd111.TextColor3 = ok and tbl21.ok or tbl21.err
						return
					end
					local ok = pcall(firesignal, pinnd94.OnClientEvent, localTest, nil, nil, "Top", 2678001507)
					pinnd111.Text = ok and "fired: " .. localTest or "firesignal failed"
					pinnd111.TextColor3 = ok and tbl21.ok or tbl21.err
					return
				end
				send.MouseButton1Click:Connect(function()
					pinndfn54(TextBox2.Text)
					TextBox2.Text = ""
					TextBox2:CaptureFocus()
				end)
				TextBox2.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						pinndfn54(TextBox2.Text)
						TextBox2.Text = ""
						TextBox2:CaptureFocus()
					end
				end)
				testCode.MouseButton1Click:Connect(function()
					pinndfn54("TESTCODE" .. tostring(math.random(1000, 9999)))
				end)
			end
			pinnd97.MouseButton1Click:Connect(function()
				if pinnd109.Visible then
					pinnd109.Visible = false
					return
				end
				if flag18 then
					pinnd109.Position = UDim2.new(0.5, -math.floor(pinnd109.AbsoluteSize.X / 2), 0.5, -math.floor(pinnd109.AbsoluteSize.Y / 2))
				else
					local position = Main.Position
					pinnd109.Position = UDim2.new(position.X.Scale, position.X.Offset - pinnd109.AbsoluteSize.X - 10, position.Y.Scale, position.Y.Offset + Main.AbsoluteSize.Y - pinnd109.AbsoluteSize.Y)
				end
				pinnd109.Visible = true
			end)
		end
	end
	do
		local pinndfn54, pinndfn55, pinndfn56, pinndfn57, pinndfn58, pinndfn59, pinndfn60, pinndfn61, pinndfn62, pinndfn63
		local pinndfn64
		do
			do
				if _G.__AntiRagdollToggleCleanup then
					pcall(_G.__AntiRagdollToggleCleanup)
				end
				tbl22 = {
					Enabled = false,
					Connections = {},
					Welds = {},
					LastPosition = nil,
					JumpPauseUntil = 0,
					JumpPauseDuration = 0.6,
					KnockbackThreshold = 35,
					MaxUpwardVelocity = 60,
					MaxHorizontalVelocity = 12,
					MaxFrameDisplacement = 10,
				}
				do
					local tbl23 = {
						"ragdoll",
						"knock",
						"launch",
						"stun",
						"fall",
						"down",
						"flop",
						"trip",
						"push",
						"shove",
						"blast",
						"force",
					}
					local tbl24 = {
						"BodyVelocity",
						"BodyPosition",
						"BodyGyro",
						"BodyForce",
						"BodyAngularVelocity",
						"RocketPropulsion",
						"BodyThrust",
						"LinearVelocity",
						"AngularVelocity",
						"VectorForce",
						"Torque",
					}
					pinndfn54 = function(arg)
						for _, pinnd109 in ipairs(tbl24) do
							if arg:IsA(pinnd109) then
								return true
							end
						end
						return false
					end
					pinndfn55 = function(arg)
						local str8 = arg:lower()
						for _, pinnd109 in ipairs(tbl23) do
							if str8:find(pinnd109) then
								return true
							end
						end
						return false
					end
				end
			end
			pinndfn56 = function()
				local character = pinnd89.Character
				if character then
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
					if humanoid and humanoidRootPart and animator then
						return character, humanoid, humanoidRootPart, animator
					end
					return
				end
			end
			pinndfn57 = function(arg)
				local jumpPauseUntil = tbl22.JumpPauseUntil
				if tick() < jumpPauseUntil then
					return true
				end
				if arg then
					local state = arg:GetState()
					if state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall then
						return true
					end
				end
				return false
			end
			pinndfn58 = function()
				for _, weld in ipairs(tbl22.Welds) do
					pcall(function()
						weld:Destroy()
					end)
				end
				tbl22.Welds = {}
			end
			pinndfn59 = function(arg, part0)
				if not arg or not part0 then
					return
				end
				pinndfn58()
				for _, descendant in ipairs(arg:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant ~= part0 then
						local instance = Instance.new("WeldConstraint")
						instance.Name = "AntiRagdollWeld"
						instance.Part0 = part0
						instance.Part1 = descendant
						instance.Parent = part0
						table.insert(tbl22.Welds, instance)
					end
				end
			end
			pinndfn60 = function(arg, arg2)
				pcall(function()
					arg:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, arg2)
					arg:SetStateEnabled(Enum.HumanoidStateType.Physics, arg2)
					arg:SetStateEnabled(Enum.HumanoidStateType.FallingDown, arg2)
					arg:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, arg2)
				end)
			end
			pinndfn61 = function(arg, arg2)
				if not arg then
					return
				end
				for _, descendant in ipairs(arg:GetDescendants()) do
					if descendant:IsA("BallSocketConstraint") or descendant:IsA("HingeConstraint") or descendant:IsA("RopeConstraint") or descendant:IsA("RodConstraint") then
						pcall(function()
							descendant:Destroy()
						end)
					elseif pinndfn54(descendant) then
						local parent = descendant.Parent
						local name = parent and parent.Name or ""
						if parent == arg2 or pinndfn55(descendant.Name) or pinndfn55(name) then
							pcall(function()
								descendant:Destroy()
							end)
						end
					end
				end
			end
			pinndfn62 = function(arg)
				if not arg then
					return
				end
				for _, descendant in ipairs(arg:GetDescendants()) do
					if descendant:IsA("Motor6D") then
						descendant.Enabled = true
					end
				end
			end
			do
				local function pinndfn65(arg, arg2)
					if not arg then
						return
					end
					for _, descendant in ipairs(arg:GetDescendants()) do
						if descendant:IsA("BasePart") then
							if descendant == arg2 then
								descendant.CanCollide = false
								descendant.Massless = false
								pcall(function()
									descendant.CustomPhysicalProperties = PhysicalProperties.new(50, 0.3, 0.5, 100, 100)
								end)
							else
								descendant.CanCollide = false
								descendant.Massless = true
							end
						end
					end
				end
				pinndfn63 = function(arg)
					pcall(function()
						if arg:CanSetNetworkOwnership() then
							arg:SetNetworkOwner(pinnd89)
						end
					end)
				end
				pinndfn64 = function(arg, cameraSubject, arg2)
					if not (not arg or not cameraSubject or cameraSubject.Health <= 0) then
						cameraSubject.PlatformStand = false
						cameraSubject.Sit = false
						cameraSubject.AutoRotate = true
						cameraSubject.BreakJointsOnDeath = false
						cameraSubject.RequiresNeck = false
						if cameraSubject.WalkSpeed < 1 then
							cameraSubject.WalkSpeed = 16
						end
						if cameraSubject.JumpPower < 1 and cameraSubject.JumpHeight < 1 then
							cameraSubject.JumpPower = 50
						end
						pinndfn62(arg)
						pinndfn65(arg, arg2)
						local currentCamera = workspace.CurrentCamera
						if currentCamera and currentCamera.CameraSubject ~= cameraSubject then
							currentCamera.CameraSubject = cameraSubject
						end
						return
					end
				end
			end
		end
		local pinndfn65, pinndfn66
		do
			do
				local function pinndfn67(arg)
					local currentCamera = workspace.CurrentCamera
					currentCamera = currentCamera and currentCamera.CFrame.LookVector or arg.CFrame.LookVector
					local vector = Vector3.new(currentCamera.X, 0, currentCamera.Z)
					if vector.Magnitude < 0.05 then
						local lookVector = arg.CFrame.LookVector
						vector = Vector3.new(lookVector.X, 0, lookVector.Z)
					end
					if vector.Magnitude < 0.05 then
						return Vector3.new(0, 0, -1)
					end
					return vector.Unit
				end
				pinndfn65 = function(arg)
					local assemblyLinearVelocity = arg.AssemblyLinearVelocity
					arg.AssemblyAngularVelocity = Vector3.zero
					local z = assemblyLinearVelocity.Z
					arg.AssemblyLinearVelocity = Vector3.new(math.clamp(assemblyLinearVelocity.X, -tbl22.MaxHorizontalVelocity, tbl22.MaxHorizontalVelocity), math.clamp(assemblyLinearVelocity.Y, -50, tbl22.MaxUpwardVelocity), math.clamp(z, -tbl22.MaxHorizontalVelocity, tbl22.MaxHorizontalVelocity))
				end
				pinndfn66 = function(arg, arg2, arg3, arg4)
					if not arg or not arg2 or not arg3 or arg2.Health <= 0 then
						return
					end
					pinndfn64(arg, arg2, arg3)
					local pinnd109 = pinndfn67(arg3)
					if not pinndfn57(arg2) then
						pinndfn65(arg3)
					end
					arg3.CFrame = arg3.CFrame:Lerp(CFrame.lookAt(arg3.Position, arg3.Position + pinnd109), arg4 and 1 or 0.5)
					arg2.PlatformStand = false
					arg2.Sit = false
					arg2:ChangeState(Enum.HumanoidStateType.GettingUp)
					task.defer(function()
						if arg2.Parent and arg2.Health > 0 then
							arg2:ChangeState(Enum.HumanoidStateType.Running)
						end
					end)
				end
			end
		end
		do
			local function pinndfn67(arg)
				if not arg then
					return
				end
				for _, pinnd109 in ipairs(arg:GetPlayingAnimationTracks()) do
					if pinndfn55(pinnd109.Animation and pinnd109.Animation.Name or "") then
						pinnd109:Stop(0)
					end
				end
			end
			local function pinndfn68(arg, arg2, arg3, arg4)
				if not arg or not arg2 or arg2.Health <= 0 then
					return
				end
				pinndfn61(arg, arg3)
				pinndfn64(arg, arg2, arg3)
				pinndfn67(arg4)
				pinndfn63(arg3)
				pcall(function()
					local playerModule = pinnd89.PlayerScripts:FindFirstChild("PlayerModule")
					if playerModule then
						local controls = require(playerModule):GetControls()
						if controls then
							controls:Enable()
						end
					end
				end)
			end
			tbl22.Disable = function(arg)
				arg.Enabled = false
				arg.LastPosition = nil
				arg.JumpPauseUntil = 0
				for _, connection in ipairs(arg.Connections) do
					pcall(function()
						connection:Disconnect()
					end)
				end
				arg.Connections = {}
				pinndfn58()
				local _, pinnd109 = pinndfn56()
				if pinnd109 then
					pinndfn60(pinnd109, true)
				end
			end
			tbl22.Enable = function(arg)
				if arg.Enabled then
					return
				end
				arg.Enabled = true
				local pinnd109, pinnd110, pinnd111, pinnd112 = pinndfn56()
				if not pinnd109 then
					arg.Enabled = false
					return
				end
				pinndfn68(pinnd109, pinnd110, pinnd111, pinnd112)
				pinndfn60(pinnd110, false)
				pinndfn66(pinnd109, pinnd110, pinnd111, true)
				pinndfn59(pinnd109, pinnd111)
				arg.LastPosition = pinnd111.Position
				table.insert(arg.Connections, pinnd86.JumpRequest:Connect(function()
					if not arg.Enabled then
						return
					end
					local jumpPauseDuration = arg.JumpPauseDuration
					arg.JumpPauseUntil = tick() + jumpPauseDuration
				end))
				table.insert(arg.Connections, pinnd86.InputBegan:Connect(function(input, gameProcessed)
					if not arg.Enabled or gameProcessed then
						return
					end
					if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.ButtonA then
						local jumpPauseDuration = arg.JumpPauseDuration
						arg.JumpPauseUntil = tick() + jumpPauseDuration
					end
				end))
				table.insert(arg.Connections, pinnd88.Stepped:Connect(function()
					if not arg.Enabled then
						return
					end
					local pinnd113, pinnd114, pinnd115 = pinndfn56()
					if not pinnd113 or pinnd114.Health <= 0 then
						return
					end
					if not pinndfn57(pinnd114) then
						pinndfn65(pinnd115)
					end
					pinndfn63(pinnd115)
				end))
				table.insert(arg.Connections, pinnd88.Heartbeat:Connect(function()
					if not arg.Enabled then
						return
					end
					local pinnd113, pinnd114, pinnd115, pinnd116 = pinndfn56()
					if not pinnd113 or pinnd114.Health <= 0 then
						return
					end
					pinndfn60(pinnd114, false)
					pinndfn64(pinnd113, pinnd114, pinnd115)
					pinndfn61(pinnd113, pinnd115)
					local pinnd117 = pinndfn57(pinnd114)
					local state = pinnd114:GetState()
					local flag23 = state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.FallingDown or state == Enum.HumanoidStateType.PlatformStanding or state == Enum.HumanoidStateType.Seated
					local flag24 = pinnd115.CFrame.UpVector.Y < 0.85
					if flag23 or flag24 then
						pinndfn66(pinnd113, pinnd114, pinnd115, flag24 and pinnd115.CFrame.UpVector.Y < 0.5)
						pinndfn67(pinnd116)
					end
					if pinnd117 then
						arg.LastPosition = pinnd115.Position
						return
					end
					if arg.LastPosition then
						local pinndn35 = pinnd115.Position - arg.LastPosition
						local vector = Vector3.new(pinndn35.X, 0, pinndn35.Z)
						if arg.MaxFrameDisplacement < vector.Magnitude then
							local pinndn36 = arg.LastPosition + vector.Unit * arg.MaxFrameDisplacement
							pinnd115.CFrame = CFrame.new(pinndn36.X, pinnd115.Position.Y, pinndn36.Z) * (pinnd115.CFrame - pinnd115.Position)
							pinnd115.AssemblyLinearVelocity = Vector3.zero
							pinnd115.AssemblyAngularVelocity = Vector3.zero
						end
					end
					arg.LastPosition = pinnd115.Position
					if arg.KnockbackThreshold < pinnd115.AssemblyLinearVelocity.Magnitude then
						pinnd115.AssemblyLinearVelocity = Vector3.zero
						pinnd115.AssemblyAngularVelocity = Vector3.zero
						pinndfn68(pinnd113, pinnd114, pinnd115, pinnd116)
					else
						pinndfn65(pinnd115)
					end
				end))
				table.insert(arg.Connections, pinnd110.StateChanged:Connect(function(old, new)
					if not arg.Enabled then
						return
					end
					if ({
						[Enum.HumanoidStateType.Ragdoll] = true,
						[Enum.HumanoidStateType.Physics] = true,
						[Enum.HumanoidStateType.FallingDown] = true,
						[Enum.HumanoidStateType.PlatformStanding] = true,
					})[new] then
						pinnd110.PlatformStand = false
						pinnd110.Sit = false
						pinnd110:ChangeState(Enum.HumanoidStateType.GettingUp)
						pinnd110:ChangeState(Enum.HumanoidStateType.Running)
						local pinnd113, pinnd114, pinnd115, pinnd116 = pinndfn56()
						if pinnd113 then
							pinndfn68(pinnd113, pinnd114, pinnd115, pinnd116)
							pinndfn66(pinnd113, pinnd114, pinnd115, true)
						end
					end
				end))
				table.insert(arg.Connections, pinnd109.DescendantAdded:Connect(function(descendant)
					if not arg.Enabled then
						return
					end
					if descendant:IsA("Motor6D") then
						descendant.Enabled = true
						return
					end
					if descendant:IsA("BasePart") then
						task.wait()
						local pinnd113, pinnd114, pinnd115 = pinndfn56()
						if pinnd113 and pinnd115 and descendant ~= pinnd115 and descendant.Parent then
							local weldConstraint = Instance.new("WeldConstraint")
							weldConstraint.Name = "AntiRagdollWeld"
							weldConstraint.Part0 = pinnd115
							weldConstraint.Part1 = descendant
							weldConstraint.Parent = pinnd115
							table.insert(tbl22.Welds, weldConstraint)
						end
						return
					end
					if descendant:IsA("BallSocketConstraint") or descendant:IsA("HingeConstraint") or descendant:IsA("RopeConstraint") or descendant:IsA("RodConstraint") then
						task.wait()
						pcall(function()
							descendant:Destroy()
						end)
						return
					end
					if pinndfn54(descendant) then
						local pinnd113, pinnd114, pinnd115 = pinndfn56()
						local name = descendant.Parent and descendant.Parent.Name or ""
						local flag23 = descendant.Parent == pinnd115
						local pinnd116 = pinndfn55(descendant.Name) or pinndfn55(name)
						if flag23 or pinnd116 then
							task.wait()
							pcall(function()
								descendant:Destroy()
							end)
						end
					end
				end))
				table.insert(arg.Connections, pinnd109.DescendantRemoving:Connect(function(descendant)
					if not arg.Enabled then
						return
					end
					if descendant:IsA("Motor6D") then
						task.defer(function()
							local character = pinnd89.Character
							if character then
								pinndfn62(character)
							end
						end)
					end
				end))
				table.insert(arg.Connections, pinnd89.CharacterAdded:Connect(function()
					task.wait(1)
					if arg.Enabled then
						arg:Disable()
						arg:Enable()
					end
				end))
			end
		end
	end
end
local pinndfn54
do
	do
		local AntiRagdoll
		do
			do
				do
					local function pinndfn55()
						local ragCountdownBillboard = pinnd90:FindFirstChild("RagCountdownBillboard")
						if ragCountdownBillboard then
							ragCountdownBillboard:Destroy()
						end
					end
					pinndfn55()
					tbl22.Disable = function(arg)
						arg.Enabled = false
						arg.ResetCooldown = 0
						pinndfn55()
						if arg.V2Connection then
							arg.V2Connection:Disconnect()
							arg.V2Connection = nil
						end
					end
				end
			end
			tbl22.Enable = function(arg)
				if arg.V2Connection then
					return
				end
				arg.Enabled = true
				arg.ResetCooldown = 0
				arg.V2Connection = pinnd88.Heartbeat:Connect(function()
					if not arg.Enabled then
						return
					end
					local character = pinnd89.Character
					if not character then
						return
					end
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
						return
					end
					local state = humanoid:GetState()
					local now2 = tick()
					if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown then
						if now2 - arg.ResetCooldown > 0.15 then
							arg.ResetCooldown = now2
							pcall(function()
								humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
								humanoidRootPart.Velocity = Vector3.zero
								humanoidRootPart.RotVelocity = Vector3.zero
								humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
								humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
								for _, descendant in ipairs(character:GetDescendants()) do
									if descendant:IsA("Motor6D") then
										descendant.Enabled = true
									end
									if descendant:IsA("Weld") then
										descendant.Enabled = true
									end
								end
								workspace.CurrentCamera.CameraSubject = humanoid
								local playerModule = pinnd89.PlayerScripts:FindFirstChild("PlayerModule")
								playerModule = playerModule and playerModule:FindFirstChild("ControlModule")
								if playerModule then
									local module = require(playerModule)
									if module and module.Enable then
										module:Enable()
									end
								end
								humanoid.AutoRotate = true
								humanoid.PlatformStand = false
								humanoid.Sit = false
							end)
						end
					end
				end)
			end
			_G.__AntiRagdollToggleCleanup = function()
				pcall(function()
					tbl22:Disable()
				end)
			end
			do
				local pinnd109
				AntiRagdoll, pinnd109 = pinndfn47("AntiRagdoll", 260, 180, "ANTI RAGDOLL")
				AntiRagdoll.Visible = false
				AntiRagdoll.Parent = ScreenGui
				local pinnd110 = pinndfn48("X", pinnd109)
				pinnd110.Size = UDim2.fromOffset(22, 22)
				pinnd110.Position = UDim2.new(1, -28, 0.5, -11)
				pinnd110.TextSize = 12
				pinnd110.MouseButton1Click:Connect(function()
					AntiRagdoll.Visible = false
				end)
			end
		end
		local Frame5, Frame6, pinnd109
		do
			Frame5 = pinndfn42("Frame", {
				Size = UDim2.new(1, -24, 1, -58),
				Position = UDim2.fromOffset(12, 50),
				BackgroundTransparency = 1,
				}, AntiRagdoll)
			pinndfn42("UIListLayout", {
				Padding = UDim.new(0, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				}, Frame5)
			do
				local Frame7 = pinndfn42("Frame", {
					Size = UDim2.new(1, 0, 0, 38),
					BackgroundColor3 = tbl21.panel,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					}, Frame5)
				pinndfn43(Frame7, 9)
				pinndfn44(Frame7, tbl21.line, 1, 0.3)
				Frame6 = pinndfn42("Frame", {
					Size = UDim2.fromOffset(8, 8),
					Position = UDim2.new(0, 12, 0.5, -4),
					BackgroundColor3 = tbl21.err,
					BorderSizePixel = 0,
					}, Frame7)
				pinndfn43(Frame6, 4)
				pinnd109 = pinndfn46("disabled", 12, tbl21.txt, gothamBold, Enum.TextXAlignment.Left, Frame7)
			end
		end
		local enable
		do
			pinnd109.Size = UDim2.new(1, -32, 1, 0)
			pinnd109.Position = UDim2.fromOffset(28, 0)
			enable = pinndfn49("ENABLE", Frame5)
			enable.Size = UDim2.new(1, 0, 0, 36)
			enable.LayoutOrder = 2
			enable.TextColor3 = Color3.fromRGB(0, 0, 0)
			do
				local pinnd110 = pinndfn46("rigidifies your character and strips ragdoll forces / states", 10, tbl21.sub, gothamMedium, Enum.TextXAlignment.Left, Frame5)
				pinnd110.Size = UDim2.new(1, 0, 0, 30)
				pinnd110.LayoutOrder = 3
				pinnd110.TextWrapped = true
			end
		end
		do
			local function pinndfn55()
				local enabled = tbl22.Enabled
				pinnd109.Text = enabled and "enabled - staying upright" or "disabled"
				pinnd109.TextColor3 = enabled and tbl21.ok or tbl21.sub
				Frame6.BackgroundColor3 = enabled and tbl21.ok or tbl21.err
				enable.Text = enabled and "DISABLE" or "ENABLE"
				Rag.TextColor3 = enabled and tbl21.acc or tbl21.txt
			end
			enable.MouseButton1Click:Connect(function()
				if tbl22.Enabled then
					tbl22:Disable()
				else
					tbl22:Enable()
				end
				pinndfn55()
			end)
			Rag.MouseButton1Click:Connect(function()
				if AntiRagdoll.Visible then
					AntiRagdoll.Visible = false
					return
				end
				if flag18 then
					AntiRagdoll.Position = UDim2.new(0.5, -math.floor(AntiRagdoll.AbsoluteSize.X / 2), 0.5, -math.floor(AntiRagdoll.AbsoluteSize.Y / 2))
				else
					local position = Main.Position
					AntiRagdoll.Position = UDim2.new(position.X.Scale, position.X.Offset - AntiRagdoll.AbsoluteSize.X - 10, position.Y.Scale, position.Y.Offset + 96)
				end
				AntiRagdoll.Visible = true
			end)
			pinnd89.CharacterAdded:Connect(function()
				task.wait(1)
				pinndfn55()
			end)
			pinndfn55()
		end
	end
	do
		local function pinndfn55()
			local tbl23 = { Enabled = false }
			local tbl24 = {}
			local tbl25 = { animals = nil, game = nil, mutations = nil, traits = nil, tried = false }
			local function pinndfn56(arg, arg2)
				local getupvalue_ = debug and debug.getupvalue or getupvalue
				local pinnd109, pinnd110 = getupvalue_(arg, arg2)
				return pinnd110 ~= nil and pinnd110 or pinnd109
			end
			local function pinndfn57(arg, arg2)
				for _, pinnd109 in pairs(arg) do
					if type(pinnd109) == "table" and tonumber(rawget(pinnd109, arg2)) ~= nil then
						return true
					end
				end
				return false
			end
			local function pinndfn58()
				if tbl25.tried then
					return
				end
				tbl25.tried = true
				local ok, result = pcall(require, pinnd85:FindFirstChild("Shared") and pinnd85.Shared:FindFirstChild("Animals"))
				if ok then
					local pinnd109 = "table"
					ok = type(result) == pinnd109
				end
				local value = ok and rawget(result, "GetGeneration") or nil
				if type(value) ~= "function" then
					return
				end
				for i = 1, 20 do
					local ok2, game_ = pcall(pinndfn56, value, i)
					if ok2 and type(game_) == "table" then
						local value2 = rawget(game_, "Game")
						if not tbl25.game and type(value2) == "table" and tonumber(rawget(value2, "AnimalGanerationModifier")) then
							tbl25.game = game_
						elseif not tbl25.traits and pinndfn57(game_, "MultiplierModifier") then
							tbl25.traits = game_
						elseif not tbl25.mutations and pinndfn57(game_, "Modifier") then
							tbl25.mutations = game_
						elseif not tbl25.animals and (pinndfn57(game_, "Generation") or pinndfn57(game_, "Price")) then
							tbl25.animals = game_
						end
					end
				end
			end
			local function pinndfn59(arg, arg2, arg3)
				local value = tbl25.animals and rawget(tbl25.animals, arg)
				if type(value) ~= "table" then
					return nil, nil
				end
				local num = tonumber(rawget(value, "Generation"))
				if not num then
					local game_ = tbl25.game
					if game_ then
						game_ = tonumber(rawget(rawget(tbl25.game, "Game") or {}, "AnimalGanerationModifier"))
					end
					game_ = game_ or 0
					num = (tonumber(rawget(value, "Price")) or 0) * game_
				end
				local mutations = arg2 and tbl25.mutations
				local pinndn35 = 1
				if mutations then
					local value2 = rawget(tbl25.mutations, arg2)
					if type(value2) == "table" then
						pinndn35 = 1 + (tonumber(rawget(value2, "Modifier")) or 0)
					end
				end
				local traits = type(arg3) == "table" and tbl25.traits
				local flag23 = false
				if traits then
					for _, pinnd109 in ipairs(arg3) do
						if pinnd109 == "Sleepy" then
							flag23 = true
						else
							local value2 = rawget(tbl25.traits, pinnd109)
							if type(value2) == "table" then
								pinndn35 += tonumber(rawget(value2, "MultiplierModifier")) or 0
							end
						end
					end
				end
				local pinndn36 = num * pinndn35
				local pinndn37
				if flag23 then
					pinndn37 = pinndn36 * 0.5
				else
					pinndn37 = pinndn36
				end
				return math.round(pinndn37), value
			end
			local tbl26 = {}
			local function pinndfn60(child)
				if child:IsA("Model") and child:GetAttribute("Index") ~= nil then
					tbl26[child] = true
				end
			end
			local tbl27 = {}
			local pinndfn61 = nil
			local pinndfn62 = nil
			local function pinndfn63()
				for _, pinnd109 in ipairs(tbl27) do
					pcall(function()
						pinnd109:Disconnect()
					end)
				end
				tbl27 = {}
				tbl26 = {}
				if pinndfn62 then
					pcall(pinndfn62)
				end
			end
			local function pinndfn64()
				if #tbl27 > 0 then
					return
				end
				pinndfn58()
				for _, child in ipairs(workspace:GetChildren()) do
					pinndfn60(child)
				end
				tbl27[#tbl27 + 1] = workspace.ChildAdded:Connect(pinndfn60)
				tbl27[#tbl27 + 1] = workspace.ChildRemoved:Connect(function(child)
					tbl26[child] = nil
				end)
				tbl27[#tbl27 + 1] = pinnd88.Heartbeat:Connect(function(deltaTime)
					if pinndfn61 then
						pinndfn61(deltaTime)
					end
				end)
			end
			local function pinndfn65(arg)
				local primaryPart = arg.PrimaryPart or arg:FindFirstChildWhichIsA("BasePart")
				if not primaryPart then
					return nil
				end
				local pinnd109 = primaryPart:FindFirstChildOfClass("Attachment")
				pinnd109 = pinnd109 and pinnd109:FindFirstChildOfClass("ProximityPrompt")
				if pinnd109 and pinnd109.Enabled and pinnd109.ActionText == "Purchase" then
					return pinnd109, primaryPart
				end
				return nil
			end
			local function pinndfn66()
				local character = localPlayer.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				if not character then
					return nil, nil, math.huge
				end
				local huge = math.huge
				local pinnd109 = nil
				local pinnd110 = nil
				for k in pairs(tbl26) do
					if k.Parent == workspace then
						local pinnd111, pinnd112 = pinndfn65(k)
						if pinnd111 then
							local magnitude = (character.Position - pinnd112.Position).Magnitude
							if magnitude < huge then
								huge = magnitude
								pinnd109 = k
								pinnd110 = pinnd111
							end
						end
					else
						tbl26[k] = nil
					end
				end
				return pinnd109, pinnd110, huge
			end
			local function pinndfn67(arg)
				local num = tonumber(arg)
				if not num then
					return tostring(arg or "---")
				end
				local pinndn35 = math.abs(num)
				for _, pinnd109 in ipairs({ { 1000000000000, "T" }, { 1000000000, "B" }, { 1000000, "M" }, { 1000, "K" } }) do
					if pinnd109[1] <= pinndn35 then
						local pinndn36 = num / pinnd109[1]
						return string.format(pinndn36 >= 100 and "%.0f%s" or "%.1f%s", pinndn36, pinnd109[2])
					end
				end
				if num % 1 == 0 then
					return tostring(math.floor(num))
				end
				return string.format("%.1f", num)
			end
			local function pinndfn68(arg)
				if not arg or not arg.Parent or not arg.Enabled then
					return false, "prompt gone"
				end
				local pinnd109 = "function"
				if type(fireproximityprompt) == pinnd109 then
					local ok = pcall(fireproximityprompt, arg)
					return ok, ok and nil or "fire failed"
				end
				local ok = pcall(function()
					arg:InputHoldBegin()
					local pinnd110 = 0.05
					task.wait(math.max(arg.HoldDuration, 0.05) + pinnd110)
					arg:InputHoldEnd()
				end)
				return ok, ok and nil or "hold failed"
			end
			local AutoBuy, pinnd109 = pinndfn47("AutoBuy", 300, 306, "AUTO BUY")
			AutoBuy.Visible = false
			AutoBuy.Parent = ScreenGui
			local pinnd110 = pinndfn48("X", pinnd109)
			pinnd110.Size = UDim2.fromOffset(22, 22)
			pinnd110.Position = UDim2.new(1, -28, 0.5, -11)
			pinnd110.TextSize = 12
			pinnd110.MouseButton1Click:Connect(function()
				AutoBuy.Visible = false
				if pinnd108 then
					pinnd108()
				end
			end)
			local Frame5 = pinndfn42("Frame", {
				Size = UDim2.new(1, -24, 1, -58),
				Position = UDim2.fromOffset(12, 50),
				BackgroundTransparency = 1,
				}, AutoBuy)
			pinndfn42("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, Frame5)
			local Frame6 = pinndfn42("Frame", {
				Size = UDim2.new(1, 0, 0, 32),
				BackgroundColor3 = tbl21.panel,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				}, Frame5)
			pinndfn43(Frame6, 9)
			pinndfn44(Frame6, tbl21.line, 1, 0.3)
			local Frame7 = pinndfn42("Frame", {
				Size = UDim2.fromOffset(8, 8),
				Position = UDim2.new(0, 12, 0.5, -4),
				BackgroundColor3 = tbl21.line,
				BorderSizePixel = 0,
				}, Frame6)
			pinndfn43(Frame7, 4)
			local pinnd111 = pinndfn46("idle", 12, tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame6)
			pinnd111.Size = UDim2.new(1, -32, 1, 0)
			pinnd111.Position = UDim2.fromOffset(28, 0)
			pinnd111.TextTruncate = Enum.TextTruncate.AtEnd
			local function pinndfn69(text, arg)
				pinnd111.Text = text
				local ok = arg == "ok" and tbl21.ok or arg == "err" and tbl21.err or arg == "busy" and tbl21.acc or arg == "wait" and tbl21.warn or tbl21.sub
				pinnd111.TextColor3 = ok
				Frame7.BackgroundColor3 = ok
			end
			pinndfn51(Frame5, 2, "AUTO BUY", false, function(enabled)
				tbl23.Enabled = enabled
				if enabled then
					pinndfn64()
				else
					pinndfn63()
				end
				if not enabled then
					pinndfn69("idle", nil)
				else
					pinndfn69("armed - looking for a buy...", "wait")
				end
			end)
			local nearestBuyable = pinndfn46("NEAREST BUYABLE", 9, tbl21.acc, gothamBlack, Enum.TextXAlignment.Left, Frame5)
			nearestBuyable.Size = UDim2.new(1, 0, 0, 14)
			nearestBuyable.LayoutOrder = 3
			local function pinndfn70(layoutOrder, arg, arg2, arg3)
				local pinnd112 = pinndfn46(arg, 11, arg2 or tbl21.sub, gothamBold, Enum.TextXAlignment.Left, Frame5)
				pinnd112.Size = UDim2.new(1, 0, 0, arg3 or 16)
				pinnd112.LayoutOrder = layoutOrder
				pinnd112.TextTruncate = Enum.TextTruncate.AtEnd
				return pinnd112
			end
			local pinnd112 = pinndfn70(4, "Name: ---", tbl21.txt)
			local pinnd113 = pinndfn70(5, "Income: --- /sec", tbl21.acc)
			local pinnd114 = pinndfn70(6, "Rarity: ---")
			local pinnd115 = pinndfn70(7, "Mutation: ---")
			local pinnd116 = pinndfn70(8, "Traits: ---", tbl21.sub, 30)
			pinnd116.TextWrapped = true
			pinnd116.TextYAlignment = Enum.TextYAlignment.Top
			local pinnd117 = pinndfn70(9, "Distance: ---", tbl21.sub, 14)
			pinnd117.TextSize = 9
			pinndfn62 = function()
				pinnd112.Text = "Name: ---"
				pinnd113.Text = "Income: --- /sec"
				pinnd114.Text = "Rarity: ---"
				pinnd115.Text = "Mutation: ---"
				pinnd116.Text = "Traits: ---"
				pinnd117.Text = "Distance: ---"
			end
			local function pinndfn71(arg, arg2, arg3)
				if not (arg and arg2) then
					pinndfn62()
					return
				end
				local attribute = arg:GetAttribute("Index")
				local attribute2 = arg:GetAttribute("Mutation")
				local attribute3 = arg:GetAttribute("Traits")
				local pinnd118 = "string"
				local tbl28
				if type(attribute3) == pinnd118 and attribute3 ~= "" then
					tbl28 = { attribute3 }
				else
					tbl28 = attribute3
				end
				local pinnd119, pinnd120 = pinndfn59(attribute, attribute2, tbl28)
				local value = pinnd120 and rawget(pinnd120, "Price")
				pinnd112.Text = "Name: " .. tostring(pinnd120 and rawget(pinnd120, "DisplayName") or attribute or arg2.ObjectText or "---") .. (value and " ($" .. pinndfn67(value) .. ")" or "")
				pinnd113.Text = "Income: " .. pinndfn67(pinnd119) .. " /sec"
				pinnd114.Text = "Rarity: " .. tostring(pinnd120 and rawget(pinnd120, "Rarity") or "---")
				pinnd115.Text = "Mutation: " .. tostring(attribute2 or "---")
				pinnd116.Text = "Traits: " .. (type(tbl28) == "table" and #tbl28 > 0 and table.concat(tbl28, ", ") or "---")
				pinnd117.Text = string.format("Distance: %.1f studs", arg3)
			end
			local pinnd118 = nil
			local pinnd119 = 0
			local pinnd120 = 0
			local flag23 = false
			pinndfn61 = function(arg)
				if not tbl23.Enabled then
					if flag23 then
						pinndfn62()
						flag23 = false
					end
					return
				end
				pinnd120 += arg
				if pinnd120 < 0.2 then
					return
				end
				pinnd120 = 0
				local pinnd121, pinnd122, pinnd123 = pinndfn66()
				pinndfn71(pinnd121, pinnd122, pinnd123)
				flag23 = pinnd122 ~= nil
				if pinnd122 then
					if pinnd123 > (pinnd122.MaxActivationDistance or 10) + 2 then
						pinndfn69("move closer to buy", "wait")
						return
					end
					if pinnd122 ~= pinnd118 or os.clock() - pinnd119 >= 1.2 then
						local now2 = os.clock()
						pinnd118 = pinnd122
						pinnd119 = now2
						pinndfn69("buying...", "busy")
						task.spawn(function()
							local pinnd124, pinnd125 = pinndfn68(pinnd122)
							if pinnd124 then
								pinndfn69("bought!", "ok")
							elseif tbl23.Enabled then
								pinndfn69(pinnd125 or "buy failed", "err")
							end
						end)
					end
					return
				end
				pinndfn69("no buy prompt in range", "wait")
			end
			pinndfn31 = function()
				if flag18 then
					local pinnd121 = 0.5
					AutoBuy.Position = UDim2.new(0.5, -math.floor(AutoBuy.AbsoluteSize.X / 2), pinnd121, -math.floor(AutoBuy.AbsoluteSize.Y / 2))
				else
					local position = Main.Position
					AutoBuy.Position = UDim2.new(position.X.Scale, position.X.Offset - AutoBuy.AbsoluteSize.X - 10, position.Y.Scale, position.Y.Offset)
				end
				AutoBuy.Visible = true
			end
			pinndfn32 = function()
				tbl23.Enabled = false
				pinndfn63()
				for _, pinnd121 in ipairs(tbl24) do
					pcall(function()
						pinnd121:Disconnect()
					end)
				end
				tbl24 = {}
			end
		end
		pinndfn55()
	end
	do
		local str8, pinndn35
		do
			str8 = ""
			pinndn35 = 0
			do
				local function pinndfn55(descendant)
					task.defer(function()
						if not descendant.Parent then
							return
						end
						local descendants = descendant:IsA("TextLabel") and { descendant } or descendant:GetDescendants()
						for _, descendant2 in ipairs(descendants) do
							if descendant2:IsA("TextLabel") and descendant2.Text ~= "" then
								local str9 = pinndfn33(descendant2.Text):lower()
								local now2 = os.clock()
								str8 = str9
								pinndn35 = now2
								return
							end
						end
					end)
				end
				local function pinndfn56(arg)
					if not arg then
						return
					end
					arg.DescendantAdded:Connect(pinndfn55)
					for _, descendant in ipairs(arg:GetDescendants()) do
						if descendant:IsA("TextLabel") then
							descendant:GetPropertyChangedSignal("Text"):Connect(function()
								if descendant.Text ~= "" then
									local str9 = pinndfn33(descendant.Text):lower()
									local now2 = os.clock()
									str8 = str9
									pinndn35 = now2
								end
							end)
						end
					end
				end
				pinndfn56(pinnd87:FindFirstChild("Notification"))
				pinndfn56(pinnd87:FindFirstChild("Notifications"))
				pinndfn56(pinnd87:FindFirstChild("Announcement"))
			end
		end
		do
			local tbl23 = {
				"base is full",
				"sold out",
				"out of stock",
				"already redeemed",
				"already used",
				"code redeemed",
				"you have already",
			}
			pinndfn54 = function(arg)
				if pinndn35 <= (arg or 0) then
					return nil
				end
				if os.clock() - pinndn35 > 3 then
					return nil
				end
				for _, pinnd109 in ipairs(tbl23) do
					if str8:find(pinnd109, 1, true) then
						return pinnd109
					end
				end
			end
		end
	end
end
local pinndfn55, pinndfn56, pinndfn57, pinndfn58, pinndfn59, pinndfn60, pinndfn61, pinndfn62, pinndfn63, pinndfn64
do
	do
		pinndfn55 = function(arg, arg2)
			local pinnd109 = pinndfn34(arg)
			if pinnd109 == "" then
				pinndfn50("nothing to redeem", "err")
				return false, false
			end
			arg2 = arg2 and arg2 .. " " or ""
			pinndfn50(("%sredeeming: %s"):format(arg2, pinnd109), "busy")
			local pinnd110, pinnd111 = pinndfn41(pinnd109)
			local flag23 = pinnd110 and type(pinnd111) == "table"
			if flag23 and (pinnd111.success or pinnd111.Success) and true then
				pinndfn50(("%sredeemed: %s"):format(arg2, pinnd109), "ok")
			elseif flag23 then
				pinndfn50(("%srejected: %s"):format(arg2, pinnd109), "err")
			elseif pinnd110 then
				pinndfn50(("%ssent: %s"):format(arg2, pinnd109), "busy")
			else
				pinndfn50(("%sfailed to send: %s"):format(arg2, pinnd109), "err")
			end
			return pinnd110, flag23
		end
		pinndfn52 = function(text)
			TextBox.Text = text
			pinndfn55(text)
		end
		do
			local pinndfn65 = nil
			local function pinndfn66(arg)
				local pinnd109 = pinndfn34(arg or "")
				if pinnd109 == "" then
					return false
				end
				pinndn32 += 1
				local pinnd110, pinnd111 = pinndfn55(pinnd109)
				local progress = tostring(math.min(pinndn32, pinndn33)) .. "/" .. tostring(pinndn33)
				if pinnd110 and pinnd111 then
					pinndfn50(("word %s - redeemed: %s"):format(progress, pinnd109), "ok")
				elseif pinnd110 then
					pinndfn50(("word %s - sent: %s"):format(progress, pinnd109), "busy")
				else
					pinndfn50(("word %s - failed: %s"):format(progress, pinnd109), "err")
				end
				return pinnd110
			end
			pinndfn56 = function(arg)
				if flag20 and flag19 then
					pinndfn66(arg)
				end
			end
			local function pinndfn67()
				while flag21 and flag20 do
					if flag19 then
						if pinndn32 == 0 then
							pinndfn50("spam - redeem on every word", "wait")
						end
						task.wait(0.1)
					else
						if pinndfn34(TextBox.Text) == "" then
							pinndfn50("spam - waiting for a code...", "wait")
						else
							pinndfn66(TextBox.Text)
						end
						task.wait(max)
					end
				end
				if flag21 then
					pinndfn65(false)
				end
			end
			pinndfn65 = function(arg)
				if arg and not flag20 then
					pinndfn50("turn LISTEN on first", "err")
					return
				end
				if arg == flag21 then
					return
				end
				flag21 = arg
				start.Text = arg and "STOP" or "START"
				start.TextColor3 = arg and tbl21.acc or tbl21.txt
				pinndfn45(pinnd107, 0.16, { BackgroundColor3 = arg and tbl21.acc or tbl21.line })
				pinndfn45(pinnd106, 0.16, { TextColor3 = arg and tbl21.txt or tbl21.sub })
				pinndfn45(pinnd105, 0.16, { Color = arg and tbl21.acc or tbl21.line, Transparency = arg and 0.15 or 0.3 })
				if arg then
					pinndn32 = 0
					thread = task.spawn(pinndfn67)
				else
					thread = nil
					if flag20 then
						pinndfn50("spam stopped", "wait")
					end
				end
			end
			start.MouseButton1Click:Connect(function()
				pinndfn65(not flag21)
			end)
			redeem.MouseButton1Click:Connect(function()
				redeem.Text = "..."
				pinndfn55(TextBox.Text)
				redeem.Text = "REDEEM"
			end)
			TextBox.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					pinndfn55(TextBox.Text)
				end
			end)
			pinnd100.MouseButton1Click:Connect(function()
				local copied = pinndfn34(TextBox.Text)
				if copied == "" then
					pinndfn50("nothing to copy", "err")
					return
				end
				local pinnd109 = pinndfn35(copied)
				pinndfn50(pinnd109 and "copied: " .. copied or "copy failed", pinnd109 and "ok" or "err")
			end)
			clear.MouseButton1Click:Connect(function()
				TextBox.Text = ""
				pinnd93 = nil
				tbl19 = {}
				pinndfn50(flag20 and "listening... (cleared)" or "cleared", flag20 and "wait" or "idle")
			end)
			pinndfn57 = function(text)
				pinnd93 = text
				TextBox.Text = text
			end
			pinndfn58 = function()
				if not (not keyboardEnabled or not listenKey) then
					return "press " .. listenKey.Name .. " to fire"
				end
				return "tap LISTEN to fire"
			end
			pinndfn59 = function()
				if not keyboardEnabled then
					return "idle - tap LISTEN to start"
				end
				return listenKey and "idle - press " .. listenKey.Name .. " to listen" or "idle - no listen key bound"
			end
			pinndfn60 = function(arg)
				flag20 = arg
				if not arg and flag21 then
					pinndfn65(false)
				end
				pinndfn45(Frame2, 0.16, { BackgroundColor3 = arg and tbl21.acc or tbl21.line })
				pinndfn45(Frame3, 0.16, { Position = UDim2.new(0, arg and 20 or 2, 0.5, -7) }, Enum.EasingStyle.Back)
				pinndfn45(listen, 0.16, { TextColor3 = arg and tbl21.txt or tbl21.sub })
				if arg then
					tbl19 = {}
					pinndn32 = 0
					if pinnd95 and not flag21 then
						if pinnd93 and TextBox.Text == pinnd93 then
							pinndfn57("")
						end
						pinndfn65(true)
					end
					if manual then
						pinndfn50("listening... " .. pinndfn58(), "wait")
					else
						local pinnd109 = "wait"
						pinndfn50(("listening... 0/%d"):format(pinndn33), pinnd109)
					end
				else
					pinndfn50(pinndfn59(), "idle")
				end
			end
		end
	end
	do
		pinndfn61 = function(arg)
			if autoType then
				pinndfn57(arg)
			end
			if autoRedeem then
				pinndfn55(arg, "[FULL]")
			else
				pinndfn50("captured: " .. arg .. " (auto-redeem off)", "ok")
			end
		end
		pinndfn62 = function(arg)
			local pinnd109 = pinndfn34(arg or "")
			if pinnd109 == "" then
				return
			end
			local now2 = os.clock()
			task.spawn(function()
				for i = 1, 3 do
					task.wait(pinnd92)
					local pinnd110 = pinndfn54(now2)
					if pinnd110 then
						local pinnd111 = "wait"
						pinndfn50(("%s - stopped retrying"):format(pinnd110), pinnd111)
						break
					else
						pinndn32 += 1
						local pinnd111, pinnd112 = pinndfn55(pinnd109, "[FULL]")
						pinndfn50(("confirm %d/%d - %s%s"):format(i, 3, pinnd111 and "sent: " or "retry: ", pinnd109), pinnd111 and "ok" or "busy")
						if not (pinnd111 and pinnd112) then
							continue
						end
					end
					break
				end
			end)
		end
		do
			local function pinndfn65()
				local str8 = table.concat(tbl19)
				local pinnd109 = flag21
				pinndfn60(false)
				if str8 ~= "" then
					pinndfn61(str8)
					if pinnd109 then
						pinndfn62(str8)
					end
				end
			end
			pinndfn63 = function()
				if flag20 then
					if manual then
						pinndfn65()
					else
						pinndfn60(false)
					end
				else
					pinndfn60(true)
				end
			end
		end
	end
	TextButton.MouseButton1Click:Connect(pinndfn63)
	pinnd101.MouseButton1Click:Connect(function()
		str7 = "listen"
		pinnd101.Text = "..."
		pinnd101.TextColor3 = tbl21.warn
	end)
	pinnd102.MouseButton1Click:Connect(function()
		listenKey = nil
		str7 = nil
		pinnd101.Text = "-"
		pinnd101.TextColor3 = tbl21.txt
		if not flag20 then
			pinndfn50(pinndfn59(), "idle")
		end
	end)
	pinnd103.MouseButton1Click:Connect(function()
		str7 = "redeem"
		pinnd103.Text = "..."
		pinnd103.TextColor3 = tbl21.warn
	end)
	pinnd104.MouseButton1Click:Connect(function()
		g = nil
		str7 = nil
		pinnd103.Text = "-"
		pinnd103.TextColor3 = tbl21.txt
	end)
	TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		if flag20 and TextBox.Text ~= pinnd93 then
			tbl19 = {}
		end
	end)
	tbl18.positions = {
		Top = true,
		Bottom = true,
		Center = true,
		Middle = true,
		Left = true,
		Right = true,
		TopRight = true,
		TopLeft = true,
		BottomRight = true,
		BottomLeft = true,
	}
	do
		local function pinndfn65(arg)
			return pinndfn33(tostring(arg or "")):lower():gsub("[^%w]", "")
		end
		local tbl23 = {
			phrases = {
				"code is",
				"use code",
				"font color",
				"fontcolour",
				"fontcolor",
				"font colour",
				"sammy has activated bubblegum machine",
				"sammy activated 2x luck",
				"sammy activated 6x luck",
				"sammy activated 8x luck",
				"sammy activated 10x luck",
				"sammy activated 12x luck",
				"sammy activated 15x luck",
				"sammy activated 20x luck",
				"sammy activated 25x luck",
				"sammy activated 30x luck",
				"sammy activated 35x luck",
				"sammy activated",
				"coins shop",
				"brainrot trader",
				"robux shop",
				"robuxshop",
				"spin wheel",
				"spinwheel",
				"trade plaza",
				"tradeplaza",
				"event has started",
				"eventhasstarted",
				"allowfriends",
				"setcreatorid",
				"to buy this",
				"tobuythis",
				"your base is already locked",
				"your base is full",
				"request failed",
				"you locked your base for",
				"you got a free spin",
				"broke into your base",
				"someone is stealing",
				"trade has been completed",
				"tradehasbeencompleted",
				"event has been activated",
				"has been activated",
				"has activated",
				"base is already locked",
				"you locked your base",
				"you have locked your base",
				"locked your base",
				"brainrot express has arrived",
				"brainrot express has arrv",
				"brainrot express leaving in",
			},
			prefixes = { "sammy:", "spydersammy:" },
			compact = {},
		}
		local tbl24 = {}
		for _, phrase in ipairs(tbl23.phrases) do
			local pinnd109 = pinndfn65(phrase)
			if pinnd109 ~= "" and not tbl24[pinnd109] then
				tbl24[pinnd109] = true
				tbl23.compact[#tbl23.compact + 1] = { phrase = phrase, compact = pinnd109 }
			end
		end
		pinndfn64 = function(arg)
			if not pinnd96 or not flag20 then
				return false
			end
			local str8 = pinndfn33(tostring(arg or "")):lower()
			local str9 = str8:gsub("%s+", "")
			for _, prefixe in ipairs(tbl23.prefixes) do
				if str9:find(prefixe, 1, true) then
					return true, prefixe
				end
			end
			local pinnd109 = pinndfn65(str8)
			for _, pinnd110 in ipairs(tbl23.compact) do
				if pinnd109:find(pinnd110.compact, 1, true) then
					return true, pinnd110.phrase
				end
			end
			return false
		end
	end
end
do
	do
		local function pinndfn65(...)
			local pinnd109 = table.pack(...)
			if pinnd109.n == 0 or typeof(pinnd109[1]) ~= "string" then
				return false
			end
			if pinnd96 then
				return pinnd109[4] == "Top"
			end
			for i = 2, pinnd109.n do
				local pinnd110 = pinnd109[i]
				if typeof(pinnd110) == "string" and (pinnd110:find("Sounds%.") or pinnd110:find("rbxassetid") or tbl18.positions[pinnd110]) then
					return true
				end
			end
			return false
		end
		pinndfn30 = function(...)
			local pinnd109 = table.pack(...)
			if not pinndfn65(...) then
				return
			end
			local pinnd110 = pinndfn33(tostring(pinnd109[1] or ""))
			if pinnd110 ~= "" then
				if pinndfn64(pinnd110) then
					return
				end
				if _G.__RdmDuo and _G.__RiddlerDuo then
					local pinnd111 = _G.__SabClassifyDrop(pinnd110)
					if pinnd111 == "riddle" then
						_G.__SabDropClaim = { text = pinnd110, kind = "riddle", at = os.clock() }
						pinndfn50("riddle - left to the AI riddler", "wait")
						pinndfn53(pinnd110, nil)
						return
					end
					if pinnd111 == "code" then
						_G.__SabDropClaim = { text = pinnd110, kind = "code", at = os.clock() }
					end
				end
				local pinnd111 = pinndfn37(pinnd110)
				local pinnd112
				if autoListen and not flag20 then
					pinnd112 = pinndfn38(pinnd110)
					if pinnd112 then
						pinndfn60(true)
						if pinnd112 == "" then
							pinndfn50("trigger heard - waiting for the code...", "busy")
							pinndfn53(pinnd110, pinnd111)
							return
						end
					else
						pinnd112 = pinnd110
					end
				else
					pinnd112 = pinnd110
				end
				if flag20 then
					for _, pinnd113 in ipairs(pinndfn36(pinnd112)) do
						tbl19[#tbl19 + 1] = pinnd113
						if flag19 then
							if manual then
								pinndfn56(table.concat(tbl19))
							else
								local tbl23 = {}
								for i = 1, math.min(#tbl19, pinndn33) do
									tbl23[i] = tbl19[i]
								end
								pinndfn56(table.concat(tbl23))
							end
						end
						if not manual and #tbl19 >= pinndn33 then
							break
						end
					end
					if manual then
						local str8 = table.concat(tbl19)
						pinndfn57(str8)
						pinndfn40(str8)
						local pinnd113 = "wait"
						pinndfn50(("listening... %d words - %s"):format(#tbl19, pinndfn58()), pinnd113)
					else
						local pinnd113 = pinndn33
						local tbl23 = {}
						for i = 1, math.min(#tbl19, pinnd113) do
							tbl23[i] = tbl19[i]
						end
						local str8 = table.concat(tbl23)
						pinndfn57(str8)
						pinndfn40(str8)
						if pinnd113 <= #tbl19 then
							local pinnd114 = flag21
							local pinnd115 = flag19

							tbl19 = {}
							pinndfn60(false)
							if not pinnd115 then
								pinndfn61(str8)
								if pinnd114 then
									pinndfn62(str8)
								end
							end
							pinnd111 = str8
						else
							pinndfn50(("listening... %d/%d"):format(#tbl19, pinnd113), "wait")
						end
					end
				end
				pinndfn53(pinnd110, pinnd111)
				return
			end
		end
	end
end
if getgenv and getgenv().StopTraced then
	pcall(getgenv().StopTraced)
end
do
	local tbl23 = {}
	local pinnd109 = nil
	local pinndn35 = 0
	local function pinndfn65(...)
		local pinnd110 = table.pack(...)
		local str8 = tostring(...)
		local now2 = os.clock()
		if str8 == pinnd109 and now2 - pinndn35 < 0.25 then
			return
		end
		pinnd109 = str8
		pinndn35 = now2
		pcall(pinndfn30, table.unpack(pinnd110, 1, pinnd110.n))
	end
	pinnd94 = pinndfn39()
	if pinnd94 then
		Frame.BackgroundColor3 = tbl21.ok
		Frame4.BackgroundColor3 = tbl21.ok
		tbl23[#tbl23 + 1] = pinnd94.OnClientEvent:Connect(pinndfn65)
	else
		do
			local pinndn36 = 0
			for _, child in ipairs(net:GetChildren()) do
				if child:IsA("RemoteEvent") or child:IsA("UnreliableRemoteEvent") then
					pinndn36 += 1
					tbl23[#tbl23 + 1] = child.OnClientEvent:Connect(pinndfn65)
					if not (pinndn36 >= 400) then
						continue
					end
				else
					continue
				end
				break
			end
			tbl23[#tbl23 + 1] = net.ChildAdded:Connect(function(child)
				if child:IsA("RemoteEvent") or child:IsA("UnreliableRemoteEvent") then
					tbl23[#tbl23 + 1] = child.OnClientEvent:Connect(pinndfn65)
				end
			end)
			flag22 = pinndn36 > 0
		end
		local warn_ = flag22 and tbl21.warn or tbl21.err
		Frame.BackgroundColor3 = warn_
		Frame4.BackgroundColor3 = warn_
	end
	if flag18 then
		local currentCamera = workspace.CurrentCamera
		local function refit()
			pinnd91 = pinndfn29()
			for _, descendant in ipairs(ScreenGui:GetDescendants()) do
				if descendant:IsA("UIScale") and descendant.Name == "WinScale" then
					descendant.Scale = pinnd91
				end
			end
			Main.Position = UDim2.new(1, -math.floor(316 * pinnd91) - 8, 0.5, -math.floor(pinndn34 * pinnd91 / 2))
		end
		if currentCamera then
			currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(refit)
		end
		tbl18.refit = refit
		refit()
	end
	pinnd86.InputBegan:Connect(function(input, gameProcessed)
		local userInputType = input.UserInputType
		if not (userInputType == Enum.UserInputType.Keyboard or userInputType == Enum.UserInputType.Gamepad1) then
			if str7 and userInputType == Enum.UserInputType.Touch then
				local rebinding = str7
				str7 = nil
				if rebinding == "listen" then
					pinnd101.Text = listenKey and listenKey.Name or "-"
					pinnd101.TextColor3 = tbl21.txt
				else
					pinnd103.Text = g and g.Name or "-"
					pinnd103.TextColor3 = tbl21.txt
				end
			end
			return
		end
		if str7 == "listen" then
			str7 = nil
			if input.KeyCode ~= Enum.KeyCode.Escape then
				listenKey = input.KeyCode
			end
			pinnd101.Text = listenKey and listenKey.Name or "-"
			pinnd101.TextColor3 = tbl21.txt
			if not flag20 then
				pinndfn50(pinndfn59(), "idle")
			end
			return
		end
		if str7 == "redeem" then
			str7 = nil
			if input.KeyCode ~= Enum.KeyCode.Escape then
				g = input.KeyCode
			end
			pinnd103.Text = g and g.Name or "-"
			pinnd103.TextColor3 = tbl21.txt
			return
		end
		if gameProcessed then
			return
		end
		if listenKey and input.KeyCode == listenKey then
			pinndfn63()
		end
		if g and input.KeyCode == g then
			pinndfn55(TextBox.Text)
		end
	end)
	if getgenv then
		getgenv().TracedAnnounce = function(...)
			pinndfn30(...)
		end
		getgenv().TracedStatus = function()
			return pinnd99.Text
		end
		getgenv().StopTraced = function()
			flag21 = false
			flag20 = false
			pcall(function()
				tbl22:Disable()
			end)
			if pinndfn32 then
				pcall(pinndfn32)
			end
			for _, pinnd110 in ipairs(tbl23) do
				pcall(function()
					pinnd110:Disconnect()
				end)
			end
			tbl23 = {}
			if ScreenGui then
				ScreenGui:Destroy()
			end
		end
		getgenv().TracedUnblockEvents = function()
			if not tbl20.ready then
				return false, tbl20.why
			end
			return tbl20.Unblock()
		end
	end
end
pinndfn60(false)
if pinnd94 or flag22 then
	pinndfn50(keyboardEnabled and (listenKey and "ready - press " .. listenKey.Name .. " to listen" or "ready - no listen key bound") or "ready - tap LISTEN to start", "idle")
else
	pinndfn50("notify remote not found", "err")
end
