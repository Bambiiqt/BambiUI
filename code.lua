local BambiUI = CreateFrame("Frame", nil, UIParent)

local Ctimer = C_Timer.After
local strmatch = string.match
local strfind = string.find
local tblinsert = table.insert
local tremove = table.remove

local fs

--------------------------------------------------------------------------------------------------------------------------------
--Move Frame rate
--------------------------------------------------------------------------------------------------------------------------------
local FramerateAnchorSizeX = 100
local FramerateAnchorSizeY = 2
local FramerateAnchoralpha = 0
local FramerateAnchorScale = 1.3
local yFramerateAnchor = -265
local FramerateAnchoName = "FrameRateAnchor"

local FramerateAnchor = CreateFrame("Frame", FramerateAnchoName, UIParent)
FramerateAnchor:SetSize(FramerateAnchorSizeX , FramerateAnchorSizeY)
FramerateAnchor:ClearAllPoints()
FramerateAnchor:SetFrameStrata("HIGH")
FramerateAnchor:SetPoint("CENTER",UIParent,"CENTER", 0, yFramerateAnchor)
FramerateAnchor.texture = FramerateAnchor:CreateTexture(nil, "BACKGROUND")
FramerateAnchor.texture:SetAllPoints(true)
FramerateAnchor.texture:SetColorTexture(1.0, 1.0, 1.0, FramerateAnchoralpha)
FramerateAnchor.t = FramerateAnchor:CreateFontString(nil, "OVERLAY", "GameTooltipText")
FramerateAnchor.t:SetParent(FramerateAnchor)
FramerateAnchor.t:SetText(FramerateAnchoName)
FramerateAnchor.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
FramerateAnchor.t:SetPoint("TOP", FramerateAnchor, "BOTTOM", 0,0)
FramerateAnchor.t:SetTextColor(1, 1, 1, FramerateAnchoralpha)

local function MoveFrameRate()
	FramerateFrame:ClearAllPoints()
	FramerateFrame:SetParent(FramerateAnchor)
	--FramerateLabel:SetPoint("CENTER",UIParent,"CENTER", 0, -220)
	FramerateFrame:SetPoint("CENTER",FramerateAnchor,"CENTER", 0, 0)
	FramerateFrame:SetScale(FramerateAnchorScale)
end

FramerateFrame:HookScript("OnShow", function(self)
	FramerateFrame:ClearAllPoints()
	--FramerateLabel:SetPoint("CENTER",UIParenr,"CENTER", 0, -220)
	FramerateFrame:SetPoint("CENTER",FramerateAnchor,"CENTER", 0, 0)
	FramerateFrame:SetParent(FramerateAnchor)
	FramerateFrame:SetScale(FramerateAnchorScale)
end)


hooksecurefunc(FramerateFrame, "UpdatePosition", function(microMenuPosition, isMenuHorizontal)
	FramerateFrame:ClearAllPoints()
	--FramerateLabel:SetPoint("CENTER",UIParenr,"CENTER", 0, -220)
	FramerateFrame:SetPoint("CENTER",FramerateAnchor,"CENTER", 0, 0)
	FramerateFrame:SetParent(FramerateAnchor)
	FramerateFrame:SetScale(FramerateAnchorScale)
end)


--------------------------------------------------------------------------------------------------------------------------------
--Scripts and Macro
--------------------------------------------------------------------------------------------------------------------------------

	local sizeStandard = 1.1
	local sizeRaid =.65
	local yOffSet = 12

	local function RunScripts()
		if InCombatLockdown() then
			print("InCombatLockdown: Scripts")
			return
		else

		SetCVar("floatingCombatTextCombatDamageDirectionalScale", 1)
		SetCVar("floatingCombatTextCombatHealing", 1)
		SetCVar("floatingCombatTextCombatDamage", 1)
		
		SetCVar("nameplateMinAlpha",.9)
		SetCVar("nameplateSelectedScale",1)
		SetCVar("nameplateLargerScale",1)
		SetCVar("nameplateMinScale",1)
		SetCVar("nameplateShowAll",1);
		SetCVar("nameplateMaxDistance", 60)
		SetCVar("nameplateOtherTopInset", 0.05)
		SetCVar("nameplateLargeTopInset", 0.05)
		SetCVar("nameplateMotionSpeed", 0.025)
		SetCVar("nameplateOtherBottomInset", 0.15)
		SetCVar("nameplateOverlapH", 0.4)
		SetCVar("nameplateOverlapV", 0.5)
		SetCVar("NameplatePersonalShowAlways", 1)
		
		--SetCVar("SpellQueueWindow", 260)
		
		SetCVar("noBuffDebuffFilterOnTarget", 1)
		SetCVar("fstack_preferParentKey", 0)
		SetCVar("autoSelfCast", 0)
		SetCVar("weatherdensity", 2)
		SetCVar("ffxspecial", 1) --Toggles Haze effects (Borean Tundra Haze).
		SetCVar("ffxGlow", 1)
		SetCVar("ffxnetherworld", 1) --Toggles Netherworld Glow (Mage Invis Spell Effect).
		
		SetCVar("lossOfControl", 1)
		SetCVar("lossOfControlDisarm", 0)
		SetCVar("lossOfControlFull", 0)
		SetCVar("lossOfControlInterrupt", 1)
		SetCVar("lossOfControlRoot", 0)
		SetCVar("lossOfControlSilence", 0)

		print("UI Scripts Ran")
		end
	end
	BambiUI_RunScripts = CreateFrame('CheckButton', 'BambiUI_RunScripts', BambiUI_RunScripts, 'UICheckButtonTemplate')
	BambiUI_RunScripts:SetScript('OnClick', function() RunScripts()	end)

	local function nameplateMotion()
		if InCombatLockdown() then
			print("InCombatLockdown: StackingNamePlates")
			return
		else
			if GetCVar("nameplateMotion") == "1" then
				SetCVar("nameplateMotion","0");print("Stacking NamePlates: Off (Arena)")
			else
				SetCVar("nameplateMotion","1");print("Stacking NamePlates: On (M+)")
			end
		end
	end
	BambiUI_nameplateMotion = CreateFrame('CheckButton', 'BambiUI_nameplateMotion', BambiUI_nameplateMotion, 'UICheckButtonTemplate')
	BambiUI_nameplateMotion:SetScript('OnClick', function() nameplateMotion()	end)

	local function ShowEnemyGuardians()
		if InCombatLockdown() then
			print("InCombatLockdown: ShowEnemyGuardians")
			return
		else
			if GetCVar("nameplateShowEnemyGuardians") == "1" then
				SetCVar("nameplateShowEnemyGuardians","0");print("ShowEnemyGuardians: Off")
			else
				SetCVar("nameplateShowEnemyGuardians","1");print("ShowEnemyGuardians: On")
			end
		end
	end
	BambiUI_ShowEnemyGuardians = CreateFrame('CheckButton', 'BambiUI_ShowEnemyGuardians', BambiUI_ShowEnemyGuardians, 'UICheckButtonTemplate')
	BambiUI_ShowEnemyGuardians:SetScript('OnClick', function() ShowEnemyGuardians()	end)

	local function ShowEnemyMinus()
		if InCombatLockdown() then
			print("InCombatLockdown: ShowEnemyMinus")
			return
		else
			if GetCVar("nameplateShowEnemyMinus") == "1" then
				SetCVar("nameplateShowEnemyMinus","0");print("ShowEnemyMinus: Off")
			else
				SetCVar("nameplateShowEnemyMinus","1");print("ShowEnemyMinus: On")
			end
		end
	end
	BambiUI_ShowEnemyMinus = CreateFrame('CheckButton', 'BambiUI_ShowEnemyMinus', BambiUI_ShowEnemyMinus, 'UICheckButtonTemplate')
	BambiUI_ShowEnemyMinus:SetScript('OnClick', function() ShowEnemyMinus()	end)

	local function MoveRaidUpperRight()
		if InCombatLockdown() then
			print("InCombatLockdown: MoveRaid (Standard Bottom)")
			return
		else
			local f,s,p=CompactRaidFrameContainer,EditModeManagerFrame,PartyFrame
			f:SetScale(1); --Helps if Anything Happens and When ReSizing Down
			f:ClearAllPoints();
			f:SetPoint("TOPLEFT",UIParent,"TOPRIGHT",-725,-499 + yOffSet);
			p:SetScale(1);
			p:ClearAllPoints();
			p:SetPoint("TOPLEFT", UIParent,"TOPRIGHT",-727,-483.5 + yOffSet) --2, +14 offset from raid
			s:OnSystemPositionChange(f);
			s:OnSystemPositionChange(p);
			s:SaveLayoutChanges();
			f:SetClampedToScreen(false)
			p:SetClampedToScreen(false)
			f:SetScale(sizeStandard);
			p:SetScale(sizeStandard);
			print("RaidFrames Position (Standard Bottom)")
				--Would be nice to ENABLE pets here
				--2, +14 offset from raid
				--Would be nice to ENABLE pets here
			FramerateAnchor:ClearAllPoints()
			FramerateAnchor:SetPoint("CENTER",UIParent,"CENTER", 0, yFramerateAnchor)
		end
		if fs then 
			fs.Options:SetPlayerSortMode("Arena", "Bottom")
			fs.Options:SetPlayerSortMode("Dungeon", "Bottom")
			fs.Options:SetPlayerSortMode("Raid", "Bottom")
			fs.Options:SetPlayerSortMode("World", "Bottom")
		end
		BambiUI:OmniCDAnchor(true)
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end
	BambiUI_MoveRaidUpperRight = CreateFrame('CheckButton', 'BambiUI_MoveRaidUpperRight', BambiUI_MoveRaidUpperRight, 'UICheckButtonTemplate')
	BambiUI_MoveRaidUpperRight:SetScript('OnClick', function() MoveRaidUpperRight()	end)

	local function MoveRaidUpperRightTop()
		if InCombatLockdown() then
			print("InCombatLockdown: MoveRaid (Standard Top)")
			return
		else
			local f,s,p=CompactRaidFrameContainer,EditModeManagerFrame,PartyFrame
			f:SetScale(1); --Helps if Anything Happens and When ReSizing Down
			f:ClearAllPoints();
			f:SetPoint("TOPLEFT",UIParent,"TOPRIGHT",-725,-499 + yOffSet);
			p:SetScale(1);
			p:ClearAllPoints();
			p:SetPoint("TOPLEFT", UIParent,"TOPRIGHT",-727,-483.5 + yOffSet) --2, +14 offset from raid
			s:OnSystemPositionChange(f);
			s:OnSystemPositionChange(p);
			s:SaveLayoutChanges();
			f:SetClampedToScreen(false)
			p:SetClampedToScreen(false)
			f:SetScale(sizeStandard);
			p:SetScale(sizeStandard);
			print("RaidFrames Position (Standard Top)")
				--Would be nice to ENABLE pets here
				--2, +14 offset from raid
				--Would be nice to ENABLE pets here
			FramerateAnchor:ClearAllPoints()
			FramerateAnchor:SetPoint("CENTER",UIParent,"CENTER", 0, yFramerateAnchor)
		end
		if fs then 
			fs.Options:SetPlayerSortMode("Arena", "Top")
			fs.Options:SetPlayerSortMode("Dungeon", "Top")
			fs.Options:SetPlayerSortMode("Raid", "Top")
			fs.Options:SetPlayerSortMode("World", "Top")
		end
		BambiUI:OmniCDAnchor(true)
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end
	BambiUI_MoveRaidUpperRightTop = CreateFrame('CheckButton', 'BambiUI_MoveRaidUpperRightTop', BambiUI_MoveRaidUpperRightTop, 'UICheckButtonTemplate')
	BambiUI_MoveRaidUpperRightTop:SetScript('OnClick', function() MoveRaidUpperRightTop()	end)

	local function MoveRaidCenter()
		if InCombatLockdown() then
			print("InCombatLockdown: MoveRaid (Center)")
			return
		else
			local f,s,p=CompactRaidFrameContainer,EditModeManagerFrame,PartyFrame
			f:SetScale(sizeRaid);
			f:ClearAllPoints();
			f:SetPoint("CENTER",UIParent,"CENTER",0,-360 + yOffSet);
			p:SetScale(sizeRaid);
			p:ClearAllPoints();
			p:SetPoint("CENTER",UIParent,"CENTER",0,-354.5 + yOffSet);
			s:OnSystemPositionChange(f);
			s:OnSystemPositionChange(p);
			s:SaveLayoutChanges();
			print("RaidFrames Position (Center)")
				--Would be nice to DISABLE pets here
			FramerateAnchor:ClearAllPoints()
			FramerateAnchor:SetPoint("CENTER",UIParent,"CENTER", 0, -85)
		end
		if fs then 
			fs.Options:SetPlayerSortMode("Arena", "Top")
			fs.Options:SetPlayerSortMode("Dungeon", "Top")
			fs.Options:SetPlayerSortMode("Raid", "Top")
			fs.Options:SetPlayerSortMode("World", "Top")
		end
		BambiUI:OmniCDAnchor(true)
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end

	BambiUI_MoveRaidCenter = CreateFrame('CheckButton', 'BambiUI_MoveRaidCenter', BambiUI_MoveRaidCenter, 'UICheckButtonTemplate')
	BambiUI_MoveRaidCenter:SetScript('OnClick', function() MoveRaidCenter()	end)

	local function ScaleFramesRaid()
		if InCombatLockdown() then
			print("InCombatLockdown: ScaleFrames")
			return
		else
			CompactRaidFrameContainer:SetScale(sizeRaid)
			PartyFrame:SetScale(sizeRaid)
			print("FramesScaled ("..sizeRaid..")")
		end
		if fs then 
			fs.Options:SetPlayerSortMode("Arena", "Top")
			fs.Options:SetPlayerSortMode("Dungeon", "Top")
			fs.Options:SetPlayerSortMode("Raid", "Top")
			fs.Options:SetPlayerSortMode("World", "Top")
		end
		BambiUI:OmniCDAnchor(true)
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end
	BambiUI_ScaleFrames = CreateFrame('CheckButton', 'BambiUI_ScaleFrames', BambiUI_ScaleFrames, 'UICheckButtonTemplate')
	BambiUI_ScaleFrames:SetScript('OnClick', function() ScaleFramesRaid()	end)

--------------------------------------------------------------------------------------------------------------------------------
--Bottom Black UI Bar
-------------------------------------------------------------------------------------------------------------------------------

	local BottomBar = CreateFrame("Frame", nil, UIParent)
	BottomBar:SetSize(2500, 20)
	BottomBar:SetPoint("CENTER", 0, -590)
	BottomBar.texture = BottomBar:CreateTexture(nil, "BACKGROUND")
	BottomBar.texture:SetAllPoints(true)
	BottomBar.texture:SetColorTexture(0.0, 0.0, 0.0, 1)
	BottomBar:SetFrameStrata("BACKGROUND")

--------------------------------------------------------------------------------------------------------------------------------
--Hide Arena Frames
--------------------------------------------------------------------------------------------------------------------------------

	local function ArenaHide()
		local inInstance, instanceType = IsInInstance()
		if instanceType == "arena"  then
			CompactArenaFrame:Hide()
			--CompactArenaFrame:HookScript("OnShow", function() CompactArenaFrame:Hide() end)
			--hooksecurefunc(CompactArenaFrame, "UpdateVisibility", function() CompactArenaFrame:Hide() end)
		end
	end


	--CompactArenaFrame:HookScript("OnShow", function(self) CompactArenaFrame:Hide() end)
	--CompactArenaFrame:HookScript("OnEvent", function(self) CompactArenaFrame:Hide() end)

--------------------------------------------------------------------------------------------------------------------------------
--SetUI_OnLoad
--------------------------------------------------------------------------------------------------------------------------------

	local function SetUI_OnLoad()
		MoveRaidUpperRight()
		MoveFrameRate()
		CompactRaidFrameContainer:SetScale(sizeStandard) --works in combat
		PartyFrame:SetScale(sizeStandard)
		CompactRaidFrameContainer:SetClampedToScreen(false) --Allows RaidFrame to Move OffScreen
		if CompactPartyFrameTitle then --Hides Party on PartyFrame
			CompactPartyFrameTitle:SetAlpha(0)
		end
	end

--------------------------------------------------------------------------------------------------------------------------------
--LoC Anchor
--------------------------------------------------------------------------------------------------------------------------------

	local LocPlayerSize = 48
	local LoCalpha = 0
	local LoCXAnchor = -25
	local LocframeName = "LoCPlayer"
	local LoCPlayerAnchor = CreateFrame("Frame", LocframeName, UIParent)
	LoCPlayerAnchor:SetSize(LocPlayerSize, LocPlayerSize)
	LoCPlayerAnchor:SetPoint("CENTER", 0, LoCXAnchor)
	LoCPlayerAnchor.texture = LoCPlayerAnchor:CreateTexture(nil, "BACKGROUND")
	LoCPlayerAnchor.texture:SetAllPoints(true)
	LoCPlayerAnchor.texture:SetColorTexture(1.0, 1.0, 1.0, LoCalpha)
	LoCPlayerAnchor.t = LoCPlayerAnchor:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	LoCPlayerAnchor.t:SetParent(LoCPlayerAnchor)
	LoCPlayerAnchor.t:SetText(LocframeName)
	LoCPlayerAnchor.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	LoCPlayerAnchor.t:SetPoint("TOP", LoCPlayerAnchor, "BOTTOM", 0,0)
	LoCPlayerAnchor.t:SetTextColor(1, 1, 1, LoCalpha)

	hooksecurefunc("LossOfControlFrame_SetUpDisplay", function()
		LossOfControlFrame:ClearAllPoints()
		LossOfControlFrame:SetPoint("CENTER", LoCPlayerAnchor,"CENTER", 0, 0)
		--LossOfControlFrame.fadeTime = 1.5
	end)

--------------------------------------------------------------------------------------------------------------------------------
--Blizzard Spell Alert sizeScale
--------------------------------------------------------------------------------------------------------------------------------

	hooksecurefunc("SpellActivationOverlay_ShowOverlay", function(self, spellID, texturePath, position, scale, r, g, b, vFlip, hFlip)
		local sizeScale = 0.8;
		local longSide = 256 * sizeScale;
		local shortSide = 128 * sizeScale;
		local width, height;
		local overlay = SpellActivationOverlay_GetOverlay(self, spellID, position);
		if ( position == "CENTER" ) then
				width, height = longSide, longSide;
				overlay:SetPoint("CENTER", self, "CENTER", 0, 0);
			elseif ( position == "LEFT" ) then
				width, height = shortSide, longSide;
				if spellID == 114255 then --Widen Surge f Light Procs
					overlay:SetPoint("RIGHT", self, "LEFT", 127, -36);
				else
					overlay:SetPoint("RIGHT", self, "LEFT", 177.5, -42.5);
				end
			elseif ( position == "RIGHT" ) then
				width, height = shortSide, longSide;
				width, height = shortSide, longSide;
				if spellID == 128654 then --Widen Surge f Light Procs
					overlay:SetPoint("LEFT", self, "RIGHT", -127, -36);
				else
					overlay:SetPoint("LEFT", self, "RIGHT", -177.5, -42.5);
				end
			elseif ( position == "TOP" ) then
				width, height = longSide, shortSide;
				overlay:SetPoint("BOTTOM", self, "TOP");
			elseif ( position == "BOTTOM" ) then
				width, height = longSide, shortSide;
				overlay:SetPoint("TOP", self, "BOTTOM");
			elseif ( position == "TOPRIGHT" ) then
				width, height = shortSide, shortSide;
				overlay:SetPoint("BOTTOMLEFT", self, "TOPRIGHT", 0, 0);
			elseif ( position == "TOPLEFT" ) then
				width, height = shortSide, shortSide;
				overlay:SetPoint("BOTTOMRIGHT", self, "TOPLEFT", 0, 0);
			elseif ( position == "BOTTOMRIGHT" ) then
				width, height = shortSide, shortSide;
				overlay:SetPoint("TOPLEFT", self, "BOTTOMRIGHT", 0, 0);
			elseif ( position == "BOTTOMLEFT" ) then
				width, height = shortSide, shortSide;
				overlay:SetPoint("TOPRIGHT", self, "BOTTOMLEFT", 0, 0);
			else
			--GMError("Unknown SpellActivationOverlay position: "..tostring(position));
			return;
		end
		if spellID == 114255 or spellID == 128654 then --Sacle Surge of Light
			overlay:SetScale(.4);
		else
			overlay:SetScale(.35);
		end
	end)

--------------------------------------------------------------------------------------------------------------------------------
--Lose Control Anchors
--------------------------------------------------------------------------------------------------------------------------------

	local AnchorFrames = {}
	local size = 62
	local alpha = 0
	local XAnchor = -25
	local Xset, Yset = -1.5, 9

	for i = 1, 5 do
		local frameName = "PartyAnchor" .. i
		local Anchors = CreateFrame("Frame", frameName, UIParent)
		Anchors:SetSize(size, size)
		Anchors.texture = Anchors:CreateTexture(nil, "BACKGROUND")
		Anchors.texture:SetAllPoints(true)
		Anchors.texture:SetColorTexture(1.0, 1.0, 1.0, alpha)
		Anchors.t = Anchors:CreateFontString(nil, "OVERLAY", "GameTooltipText")
		Anchors.t:SetParent(Anchors)
		Anchors.t:SetText(frameName)
		Anchors.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
		Anchors.t:SetPoint("TOP", Anchors, "BOTTOM", 0,0)
		Anchors.t:SetTextColor(1, 1, 1, alpha)
		AnchorFrames[i] = Anchors
	end

	local PlayerSize = 48
	local frameName = "PartyPlayer"
	local PlayerAnchor = CreateFrame("Frame", frameName, UIParent)
	PlayerAnchor:SetSize(PlayerSize, PlayerSize)
	PlayerAnchor:SetPoint("CENTER", 53.5, XAnchor)
	PlayerAnchor.texture = PlayerAnchor:CreateTexture(nil, "BACKGROUND")
	PlayerAnchor.texture:SetAllPoints(true)
	PlayerAnchor.texture:SetColorTexture(1.0, 1.0, 1.0, alpha)
	PlayerAnchor.t = PlayerAnchor:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	PlayerAnchor.t:SetParent(PlayerAnchor)
	PlayerAnchor.t:SetText(frameName)
	PlayerAnchor.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	PlayerAnchor.t:SetPoint("TOP", PlayerAnchor, "BOTTOM", 0,0)
	PlayerAnchor.t:SetTextColor(1, 1, 1, alpha)

	local function SetCompactAnchor(compactRaidFrame)
		local icon
		local members = GetNumGroupMembers()

		if compactRaidFrame:IsForbidden() then return end
		local name = compactRaidFrame:GetName()
		if not name or not name:match("^Compact") then return end
		local anchorUnitId = compactRaidFrame.displayedUnit or compactRaidFrame.unit
		if (anchorUnitId ~= nil) then
			local isPartyFrame = (strfind(anchorUnitId, "party") or strfind(anchorUnitId, "player")) and name:match("^CompactParty")
			local isRaidFrame = (strfind(anchorUnitId, "raid") or strfind(anchorUnitId, "player"))  and name:match("^CompactRaid")
			if isPartyFrame then
				if UnitIsUnit(anchorUnitId, "player") then 
					icon = AnchorFrames[5]
				else
					for i = 1, 4 do
						local unit = "party"..i
						if UnitIsUnit(anchorUnitId, unit) then 
							icon = AnchorFrames[i]
						end
					end
				end
			elseif isRaidFrame then
				local isInInstance, instanceType = IsInInstance()
				if instanceType == "arena" then --forces party frames
					for i = 1, 5 do
						local anchorPartyframe = _G["CompactPartyFrameMember"..i]
						local anchorPartyUnitId = anchorPartyframe.displayedUnit or anchorPartyframe.unit
						if anchorPartyUnitId then
							if anchorPartyUnitId == anchorUnitId or UnitIsUnit(anchorUnitId, anchorPartyUnitId) then
								if UnitIsUnit(anchorPartyUnitId, "party1") then 
									icon = AnchorFrames[1]; compactRaidFrame = anchorPartyframe
								elseif UnitIsUnit(anchorPartyUnitId, "party2") then  
									icon = AnchorFrames[2]; compactRaidFrame = anchorPartyframe
								elseif UnitIsUnit(anchorPartyUnitId, "party3") then 
									icon = AnchorFrames[3]; compactRaidFrame = anchorPartyframe
								elseif UnitIsUnit(anchorPartyUnitId, "party4") then 
									icon = AnchorFrames[4]; compactRaidFrame = anchorPartyframe
								elseif UnitIsUnit(anchorPartyUnitId, "player") then 
									icon = AnchorFrames[5]; compactRaidFrame = anchorPartyframe
								end
							end
						end
					end
				else
					if UnitIsUnit(anchorUnitId, "player") then 
						icon = AnchorFrames[5]
					else
						for i = 1, 4 do
							local unit = "party"..i
							if UnitIsUnit(anchorUnitId, unit) then 
								icon = AnchorFrames[i]
							end
						end
					end
				end
			end
			if icon ~= nil then
				icon:SetParent(compactRaidFrame:GetParent()) --if you set to compactRaidFrame will inherit the alpha
				icon:ClearAllPoints()
				icon:SetPoint("BOTTOMRIGHT", compactRaidFrame, "BOTTOMLEFT", Xset, Yset)
				icon:SetFrameStrata("MEDIUM")
				--icon:SetIgnoreParentAlpha(true)
			end
		end
	end

	function BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
		if not EditModeManagerFrame:ShouldRaidFrameShowSeparateGroups() then
			for i = 1, 80 do
				local compactRaidFrame = _G["CompactRaidFrame"..i]
				if compactRaidFrame and compactRaidFrame.unit then
					SetCompactAnchor(compactRaidFrame, i)
				end
			end
		elseif EditModeManagerFrame:ShouldRaidFrameShowSeparateGroups() then
			for i = 1, 8 do
				for j = 1, 5 do
					local compactRaidFrame = _G["CompactRaidGroup"..i.."Member"..j]
					if compactRaidFrame and compactRaidFrame.unit then
						SetCompactAnchor(compactRaidFrame, j)
					end
				end
			end
		end
		if EditModeManagerFrame:UseRaidStylePartyFrames() then
			for i = 1, 5 do
				local compactRaidFrame = _G["CompactPartyFrameMember"..i]
				if (compactRaidFrame ~= nil) then
					if compactRaidFrame and compactRaidFrame.unit then
						SetCompactAnchor(compactRaidFrame, i)
					end
				end
			end
		end
	end


--------------------------------------------------------------------------------------------------------------------------------
--OmniCD Anchors
--------------------------------------------------------------------------------------------------------------------------------


	local iconSize = 20 -- Needs to be same size as the OmniCD Icon
	local alphaOmni = 0
	local yPadding = -10
	local raidplayerpadding = -7
	local raidpetpadding = -8
	local playerpadding = -10
	local petpadding = -11
	local RaidiconSize = 10


	local OmniCDAnchor = {}

	for i = 1, 80 do
		OmniCDAnchor["CompactRaidFrame"..i] = CreateFrame("Frame", "OmniCDRaid"..i, UIParent)
		local OmniCDAnchor = OmniCDAnchor["CompactRaidFrame"..i]
		OmniCDAnchor:ClearAllPoints()
		OmniCDAnchor:SetFrameStrata("LOW")
		OmniCDAnchor:SetSize(RaidiconSize, RaidiconSize)
		OmniCDAnchor.texture = OmniCDAnchor:CreateTexture(nil, "BACKGROUND")
		OmniCDAnchor.texture:SetAllPoints(true)
		OmniCDAnchor.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
		OmniCDAnchor.t = OmniCDAnchor:CreateFontString(nil, "OVERLAY", "GameTooltipText")
		OmniCDAnchor.t:SetParent(OmniCDAnchor)
		OmniCDAnchor.t:SetText("CompactRaidFrame"..i)
		OmniCDAnchor.t:SetFont("Fonts\\FRIZQT__.TTF", 6)
		OmniCDAnchor.t:SetPoint("BOTTOMLEFT", OmniCDAnchor, "BOTTOMRIGHT", 2, 0)
		OmniCDAnchor.t:SetTextColor(1, 1, 1, alphaOmni)
		
	end

	for i = 1, 8 do
		for j = 1, 5 do
			OmniCDAnchor["CompactRaidGroup"..i.."Member"..j] = CreateFrame("Frame", "OmniCDRaid"..i.."Member"..j, UIParent)
			local OmniCDAnchor = OmniCDAnchor["CompactRaidGroup"..i.."Member"..j]
			OmniCDAnchor:ClearAllPoints()
			OmniCDAnchor:SetSize(RaidiconSize, RaidiconSize)
			OmniCDAnchor.texture = OmniCDAnchor:CreateTexture(nil, "BACKGROUND")
			OmniCDAnchor.texture:SetAllPoints(OmniCDAnchor)
			OmniCDAnchor.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
			OmniCDAnchor.t = OmniCDAnchor:CreateFontString(nil, "OVERLAY", "GameTooltipText")
			OmniCDAnchor.t:SetParent(OmniCDAnchor)
			OmniCDAnchor.t:SetText("CompactRaidGroup"..i.."Member"..j)
			OmniCDAnchor.t:SetFont("Fonts\\FRIZQT__.TTF", 6 )
			OmniCDAnchor.t:SetPoint("BOTTOMLEFT", OmniCDAnchor, "BOTTOMRIGHT", 2, 0)
			OmniCDAnchor.t:SetTextColor(1, 1, 1, alphaOmni)
		end
	end

	for i = 1, 5 do
		OmniCDAnchor["CompactPartyFrameMember"..i] = CreateFrame("Frame", "OmniCDParty"..i, UIParent)
		local OmniCDAnchor = OmniCDAnchor["CompactPartyFrameMember"..i]
		OmniCDAnchor:ClearAllPoints()
		OmniCDAnchor:SetSize(iconSize, iconSize)
		OmniCDAnchor.texture = OmniCDAnchor:CreateTexture(nil, "BACKGROUND")
		OmniCDAnchor.texture:SetAllPoints(OmniCDAnchor)
		OmniCDAnchor.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
		OmniCDAnchor.t = OmniCDAnchor:CreateFontString(nil, "OVERLAY", "GameTooltipText")
		OmniCDAnchor.t:SetParent(OmniCDAnchor)
		OmniCDAnchor.t:SetText("PartyFrame"..i)
		OmniCDAnchor.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
		OmniCDAnchor.t:SetPoint("BOTTOMLEFT", OmniCDAnchor, "BOTTOMRIGHT", 2, 0)
		OmniCDAnchor.t:SetTextColor(1, 1, 1, alphaOmni)
	end

	local OmniCDKey  = {}

	for i = 1, 40 do 
		OmniCDKey["raid"..i] = CreateFrame("Frame", "BambiUI"..i, UIParent)
		local OmniCDKey = OmniCDKey["raid"..i]
		OmniCDKey:ClearAllPoints()
		OmniCDKey.texture = OmniCDKey:CreateTexture(nil, "BACKGROUND")
		OmniCDKey.texture:SetAllPoints(true)
		OmniCDKey.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
		OmniCDKey.t = OmniCDKey:CreateFontString(nil, "OVERLAY", "GameTooltipText")
		OmniCDKey.t:SetParent(OmniCDKey)
		OmniCDKey.t:SetText("raid"..i)
		OmniCDKey.t:SetPoint("TOPLEFT", OmniCDKey, "TOPRIGHT", 2, 0)
		OmniCDKey.t:SetTextColor(1, 1, 1, alphaOmni)
		OmniCDKey.yourUnitKey = "raid"..i
	end

	for i = 1, 5 do 
		if i == 5 then 
			OmniCDKey["player"] = CreateFrame("Frame", "BambiUI"..45, UIParent)
			local OmniCDKey = OmniCDKey["player"]
			OmniCDKey:ClearAllPoints()
			OmniCDKey.texture = OmniCDKey:CreateTexture(nil, "BACKGROUND")
			OmniCDKey.texture:SetAllPoints(OmniCDKey)
			OmniCDKey.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
			OmniCDKey.t = OmniCDKey:CreateFontString(nil, "OVERLAY", "GameTooltipText")
			OmniCDKey.t:SetParent(OmniCDKey)
			OmniCDKey.t:SetText("player")
			OmniCDKey.t:SetPoint("TOPLEFT", OmniCDKey, "TOPRIGHT", 2, 0)
			OmniCDKey.t:SetTextColor(1, 1, 1, alphaOmni)
			OmniCDKey.yourUnitKey = "player"
		else	
			local x = 40 + i
			OmniCDKey["party"..i] = CreateFrame("Frame", "BambiUI"..x, UIParent)
			local OmniCDKey = OmniCDKey["party"..i]
			OmniCDKey:ClearAllPoints()
			OmniCDKey.texture = OmniCDKey:CreateTexture(nil, "BACKGROUND")
			OmniCDKey.texture:SetAllPoints(OmniCDKey)
			OmniCDKey.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
			OmniCDKey.t = OmniCDKey:CreateFontString(nil, "OVERLAY", "GameTooltipText")
			OmniCDKey.t:SetParent(OmniCDKey)
			OmniCDKey.t:SetText("party"..i)
			OmniCDKey.t:SetPoint("TOPLEFT", OmniCDKey, "TOPRIGHT", 2, 0)
			OmniCDKey.t:SetTextColor(1, 1, 1, alphaOmni)
			OmniCDKey.yourUnitKey = "party"..i
		end
	end

	local lastPartyanchorFrame
	local lastgroupAnchor = {}
	local lastparty = {}
	local partyFrames = {
		CompactPartyFrameMember1,
		CompactPartyFrameMember2,
		CompactPartyFrameMember3,
		CompactPartyFrameMember4,
		CompactPartyFrameMember5,
	}

	function  BambiUI:OmniCDAnchor(forced)

		local fsPartyframes
		local fsRaidframes

		--[[if fs then 
			fsPartyframes = fs.Sorting:GetPartyFrames()
			fsRaidframes = fs.Sorting:GetRaidFrames()
		end
		if fsRaidframes then 
			for i, frame in ipairs(fsRaidframes) do
				if frame then 
					print(i..":"..frame:GetName())
				end
			end
		end
		if fsPartyframes  then 
			for i, frame in ipairs(fsPartyframes) do
				if frame then 
					print(i..":"..frame:GetName())
				end
			end
		end]]


		local frames = {}
		local party = {}
		local groups = {}
	
		if EditModeManagerFrame:UseRaidStylePartyFrames() then
			local inInstance, instanceType = IsInInstance()

			if not EditModeManagerFrame:ShouldRaidFrameShowSeparateGroups() then
				for i = 1, 80 do
					local compactRaidFrame = _G["CompactRaidFrame"..i]
					if compactRaidFrame and compactRaidFrame.unit and compactRaidFrame:IsVisible() then
						tblinsert(frames, compactRaidFrame)
					end
				end
			elseif EditModeManagerFrame:ShouldRaidFrameShowSeparateGroups() then
				for i = 1, 8 do
					for j = 1, 5 do
						local compactRaidFrame = _G["CompactRaidGroup"..i.."Member"..j]
						if  compactRaidFrame and compactRaidFrame.unit and compactRaidFrame:IsVisible() then
							tblinsert(frames, compactRaidFrame)
						end
					end
				end
			end

			for i = 1, 5 do
				local compactRaidFrame = _G["CompactPartyFrameMember"..i]
				if compactRaidFrame and compactRaidFrame.unit and compactRaidFrame:IsVisible() then
					tblinsert(party, compactRaidFrame)
				end
			end

			for i = 1, 5 do
				local compactRaidFrame = _G["CompactPartyFramePet"..i]
				if  compactRaidFrame and compactRaidFrame.unit and compactRaidFrame:IsVisible() then
					tblinsert(party, compactRaidFrame)
				end
			end

			table.sort(frames, function(x, y)
				if x:GetLeft() and y:GetLeft() then 
					if x:GetLeft() ~= y:GetLeft() then
						return x:GetLeft() < y:GetLeft()
					end
						return x:GetLeft() > y:GetLeft()
				end
			end)


			local CRFC = _G["CompactRaidFrameContainer"]
			local cols = CRFC.flowMaxPerLine

			if cols then
				local n = 40/cols
				local numberofgroups = ceil(n)

				for i = 1 , numberofgroups do 
					groups[i] = {}
				end
				
				for i, frame in ipairs(frames) do
					local name = frame:GetName()
					local unit = frame.unit
					local unitName = UnitName(unit)
					if EditModeManagerFrame:ShouldRaidFrameShowSeparateGroups() and strfind(name, "CompactRaidGroup") then
						if strfind(name, "CompactRaidGroup1") then
							tblinsert(groups[1], frame)
						elseif strfind(name, "CompactRaidGroup2") then
							tblinsert(groups[2], frame)
						elseif strfind(name, "CompactRaidGroup3") then
							tblinsert(groups[3], frame)
						elseif strfind(name, "CompactRaidGroup4") then
							tblinsert(groups[4], frame)
						elseif strfind(name, "CompactRaidGroup5") then
							tblinsert(groups[5], frame)
						elseif strfind(name, "CompactRaidGroup6") then
							tblinsert(groups[6], frame)
						elseif strfind(name, "CompactRaidGroup7") then
							tblinsert(groups[7], frame)
						elseif strfind(name, "CompactRaidGroup8") then
							tblinsert(groups[8], frame)
						end
					elseif not EditModeManagerFrame:ShouldRaidFrameShowSeparateGroups() and strfind(name, "CompactRaidFrame") then
						--print(i.." "..name.." "..unitName)
						if i <= cols then
							tblinsert(groups[1], frame)
						elseif (i > cols and i <= cols*2) and groups[2]  then
							tblinsert(groups[2], frame)
						elseif (i > cols*2 and i <= cols*3) and groups[3]  then
							tblinsert(groups[3], frame)
						elseif (i > cols*3 and i <= cols*4) and groups[4]  then
							tblinsert(groups[4], frame)
						elseif (i > cols*4  and i <= cols*5) and groups[5]  then
							tblinsert(groups[5], frame)
						elseif (i > cols*5 and i <= cols*6) and groups[6]  then
							tblinsert(groups[6], frame)
						elseif (i > cols*6  and i <= cols*7) and groups[7]  then 
							tblinsert(groups[7], frame)
						elseif (i > cols*7 and i <= cols*8) and groups[8] then 
							tblinsert(groups[8], frame)
						elseif (i > cols*8 and i <= cols*9) and groups[9]  then 
							tblinsert(groups[9], frame)
						elseif (i > cols*9 and i <= cols*10) and groups[10]  then 
							tblinsert(groups[10], frame)
						elseif (i > cols*10 and i <= cols*11) and groups[11]  then 
							tblinsert(groups[11], frame)
						elseif (i > cols*11 and i <= cols*12) and groups[12]  then 
							tblinsert(groups[12], frame)
						elseif (i > cols*12 and i <= cols*13) and groups[13]  then 
							tblinsert(groups[13], frame)
						elseif (i > cols*13 and i <= cols*14) and groups[14]  then 
							tblinsert(groups[14], frame)
						elseif (i > cols*14 and i <= cols*15) and groups[15]  then 
							tblinsert(groups[15], frame)
						elseif (i > cols*15 and i <= cols*16) and groups[16]  then 
							tblinsert(groups[16], frame)
						elseif (i > cols*16 and i <= cols*17) and groups[17]  then 
							tblinsert(groups[17], frame)
						elseif (i > cols*17 and i <= cols*18) and groups[18]  then 
							tblinsert(groups[18], frame)
						elseif (i > cols*18 and i <= cols*19) and groups[19]  then 
							tblinsert(groups[19], frame)
						elseif (i > cols*19 and i <= cols*20) and groups[20]  then 
							tblinsert(groups[20], frame)
						elseif (i > cols*20 and i <= cols*21) and groups[21]  then 
							tblinsert(groups[21], frame)
						end
					end
				end

				local groupChangesAll
				local groupChangesTable = {}


				-- for Raid Frames
				for i = 1, numberofgroups do 	
					local group = groups[i]
					local x = cols 
					if #group > 0 then 
						table.sort(group, function(x, y)
							if x:GetTop() and y:GetTop() then
								return x:GetTop() > y:GetTop()
							end
						end)
					end

				-- finds if anything changed in the group	
					for k = 1, x do 
						local name, unitId, oldname, oldunitId
						if group and group[k] then name = group[k]:GetName(); unitId = group[k].unit end
						if lastgroupAnchor[i] and lastgroupAnchor[i][k] then oldname = lastgroupAnchor[i][k][1]; oldunitId = lastgroupAnchor[i][k][2] end
						if (name and oldname and name ~= oldname) or (unitId and oldunitId and unitId ~= oldunitId) or (group and lastgroupAnchor[i] and #group ~= #lastgroupAnchor[i]) or not lastgroupAnchor[i] then 
							--groupChangesAll = true
							groupChangesTable[i] = true
						end
					end

					if (forced or groupChangesAll or groupChangesTable[i]) and lastgroupAnchor[i] then 
						for _, frame in ipairs(lastgroupAnchor[i]) do
							local name = frame[1]
							local unitId = frame[2]
							local frame = frame[3]
							if not frame:IsVisible() then 
								local anchorFrame = OmniCDAnchor[name]
								if anchorFrame then anchorFrame:ClearAllPoints(); anchorFrame:Hide() end
								local keyFrame = OmniCDKey[unitId]
								if keyFrame then keyFrame:ClearAllPoints(); keyFrame:Hide() end
							end
						end
						lastgroupAnchor[i] = nil
					end

					local anchor = group[#group]
					
					local lastanchorFrame
		
	
					if GetNumGroupMembers() <= 5 then 
						if anchor and strfind(anchor:GetName(), "pet") then
							yPadding = petpadding
						else
							yPadding = playerpadding
						end
					else
						if anchor and strfind(anchor:GetName(), "pet") then
							yPadding = raidpetpadding
						else
							yPadding = raidplayerpadding
						end
					end

			

					if forced or groupChangesAll or groupChangesTable[i] then
						for j, frame in ipairs(group) do
							local name = frame:GetName()
							local unitId = frame.unit
							if not lastgroupAnchor[i] then
								lastgroupAnchor[i] = {} 
							end
							lastgroupAnchor[i][j] = { name, unitId, frame }
							if anchor and not strfind(unitId, "pet") then 
								local anchorFrame = OmniCDAnchor[name]
								local keyFrame = OmniCDKey[unitId]
								anchorFrame:ClearAllPoints()
								keyFrame:ClearAllPoints()
								if j == 1 then 
									--print(i..":"..j.." "..name.." "..anchorFrame:GetName().." - "..(UnitName(unitId) or "").." "..unitId)
									anchorFrame:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 1, yPadding)
								elseif lastanchorFrame then
									--print(i..":"..j.." "..name.." "..anchorFrame:GetName().." - "..(UnitName(unitId) or "").." "..unitId.." "..(lastanchorFrame:GetName() or ""))
									anchorFrame:SetPoint("TOPLEFT", lastanchorFrame , "BOTTOMLEFT", 0, yPadding)
								end
								lastanchorFrame = anchorFrame
								keyFrame:SetParent(anchorFrame)
								keyFrame:SetPoint("CENTER", anchorFrame, "CENTER", 0, nil)
								if GetNumGroupMembers() <= 5 then 
									keyFrame.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
									anchorFrame.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
									keyFrame:SetSize(iconSize, iconSize)
									anchorFrame:SetSize(iconSize, iconSize)
								else
									keyFrame.t:SetFont("Fonts\\FRIZQT__.TTF", 6 )
									anchorFrame.t:SetFont("Fonts\\FRIZQT__.TTF", 6 )
									keyFrame:SetSize(RaidiconSize, RaidiconSize)
									anchorFrame:SetSize(RaidiconSize, RaidiconSize)
								end
									keyFrame:Show()
									anchorFrame:Show()
								--print(frame:GetName() .. " = " .. frame.unit)
							end
						end
					end
				end
			end



			if party then 
				table.sort(party, function(x, y)
					if x:GetTop() and y:GetTop() then
						return x:GetTop() > y:GetTop()
					end
				end)			

				local anchor = party[#party]
				local redoAnchor

				if anchor and strfind(anchor:GetName(), "pet") then
					yPadding = petpadding
				else
					yPadding = playerpadding
				end
				
				for k = 1, 10 do 
					local name, unitId, oldname, oldunitId
					if party and party[k] then name = party[k]:GetName(); unitId = party[k].unit end

					if lastparty and lastparty[k] then oldname = lastparty[k][1]; oldunitId = lastparty[k][2] end
					if (name and oldname and name ~= oldname) or (unitId and oldunitId and unitId ~= oldunitId) or (party and lastparty and #party ~= #lastparty) or not lastparty or (lastPartyanchorFrame and lastPartyanchorFrame ~= anchor) then 
						redoAnchor = true
					end
				end

				if redoAnchor or not lastPartyanchorFrame or forced  then 
					for _, frame in ipairs(partyFrames) do
						local name = frame:GetName()
						local anchorFrame = OmniCDAnchor[name]
						if not frame:IsVisible() then 
							anchorFrame:ClearAllPoints()
							anchorFrame:Hide()
						end
					end
					if lastparty then
						for i = 1, #lastparty do 
							if lastparty[i] then
								lastparty[i] = nil
							end
						end
					end
				end

				


				lastPartyanchorFrame = anchor

				local lastanchorFrame
				if redoAnchor or forced then
					for j, frame in ipairs(party) do
						local name = frame:GetName()
						local unitId = frame.unit
						if not lastparty[j] then
							lastparty[j] = {} 
						end
						lastparty[j] = { name, unitId, frame }
						if anchor and not strfind(unitId, "pet") then 
							local anchorFrame = OmniCDAnchor[name]
							local keyFrame = OmniCDKey[unitId]
							anchorFrame:ClearAllPoints()
							keyFrame:ClearAllPoints()
							if j == 1 then 
								--print(j.." "..name.." "..anchorFrame:GetName().." - "..(UnitName(unitId) or "").." "..unitId)
								anchorFrame:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 1, yPadding)
							elseif lastanchorFrame then
								--print(j.." "..name.." "..anchorFrame:GetName().." - "..(UnitName(unitId) or "").." "..unitId.." "..(lastanchorFrame:GetName() or ""))
								anchorFrame:SetPoint("TOPLEFT", lastanchorFrame , "BOTTOMLEFT", 0, yPadding)
							end
							lastanchorFrame = anchorFrame
							anchorFrame:Show()
							keyFrame:SetParent(anchorFrame)
							keyFrame:SetPoint("CENTER", anchorFrame, "CENTER", 0, nil)
							keyFrame.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
							keyFrame:SetSize(iconSize, iconSize)
							keyFrame:Show()
							--print(frame:GetName() .. " = " .. frame.unit)
						end
					end
				end
			end
		end
	end




	local function OmniCDKey(arg1)
		if arg1 == "OmniCD" then
				--OmniCD.AddUnitFrameData("BambiUI", "BambiUI", "yourUnitKey", 1, 45)
		end
		C_Timer.After(8, function()	-- delay checking to make sure all variables of the other addons are loaded
			OmniCDKey(arg1)
		end)
	end

--------------------------------------------------------------------------------------------------------------------------------
--Handler's
--------------------------------------------------------------------------------------------------------------------------------

	EditModeManagerFrame:HookScript("OnHide", function() 	 
		--print("EditModeManagerFrame_OnHide")
		Ctimer(.1, function() 
			BambiUI:OmniCDAnchor(true)
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end)
	end)

	EditModeManagerFrame:HookScript("OnShow", function() 	 
		--print("EditModeManagerFrame_OnShow")
		BambiUI:OmniCDAnchor(true)
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		hooksecurefunc("CompactUnitFrame_UpdateAll", function()
			if EditModeManagerFrame:IsVisible() then
				Ctimer(.1, function()
					BambiUI:OmniCDAnchor(true)
					BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
				end)
			end
		end)
	end)


	hooksecurefunc(CompactRaidFrameContainer, "SetGroupMode", function(groupMode)
		--print("SetGroupMode")
		BambiUI:OmniCDAnchor()
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetFlowFilterFunction", function(flowFilterFunc)
		--print("SetFlowFilterFunction")
		BambiUI:OmniCDAnchor()
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetGroupFilterFunction", function(groupFilterFunc)
		--print("SetGroupFilterFunction")
		BambiUI:OmniCDAnchor()
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetFlowSortFunction", function(flowSortFunc)
		--print("SetFlowSortFunction")
		BambiUI:OmniCDAnchor()
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
	end)

	hooksecurefunc(CompactPartyFrame, "SetFlowSortFunction", function()
		--print("CompactPartyFrame_SetFlowSortFunction")
		BambiUI:OmniCDAnchor()
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
	end)


	function BambiUI:GROUP_ROSTER_UPDATE()	 
		--print("GROUP_ROSTER_UPDATE")
		BambiUI:OmniCDAnchor()
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
	end

	function BambiUI:UNIT_PET() 
		--print("UNIT_PET")
		BambiUI:OmniCDAnchor()
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
	end

	function BambiUI:ADDON_LOADED(arg1)
		if arg1 == "FrameSort" then
			Ctimer(1, function() 	
				fs = FrameSortApi.v1
				if fs then 
					-- register some code to run after sorting
					fs.Sorting:RegisterPostSortCallback(function()
						BambiUI:OmniCDAnchor()
						BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
					end)

					fs.Options:SetPlayerSortMode("Arena", "Bottom")
					fs.Options:SetPlayerSortMode("Dungeon", "Bottom")
					fs.Options:SetPlayerSortMode("Raid", "Bottom")
					fs.Options:SetPlayerSortMode("World", "Bottom")
				end
			end)
		end
		 OmniCDKey(arg1)
	end

	BambiOmni = CreateFrame("Frame", nil, UIParent)
	function BambiOmni:Omni()
		BambiUI:OmniCDAnchor()
	end

	function BambiUI:PLAYER_ENTERING_WORLD()
		SetUI_OnLoad()
		 Ctimer(1, function() 	
			SetUI_OnLoad()	 
			--ArenaHide()
			BambiUI:OmniCDAnchor(true)
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end

	function BambiUI:ARENA_OPPONENT_UPDATE()
		--ArenaHide()
	end

	function BambiUI:ARENA_PREP_OPPONENT_SPECIALIZATIONS()
		--ArenaHide()
	end

	function BambiUI:ZONE_CHANGED_NEW_AREA()
		--ArenaHide()
		BambiUI:OmniCDAnchor(true)
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
	end

	BambiUI:RegisterEvent("ADDON_LOADED")
	BambiUI:RegisterEvent("GROUP_ROSTER_UPDATE")
	BambiUI:RegisterEvent("PLAYER_ENTERING_WORLD")
	BambiUI:RegisterEvent("UNIT_PET")
	BambiUI:RegisterEvent("ARENA_OPPONENT_UPDATE")
	BambiUI:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")
	BambiUI:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	BambiUI:SetScript("OnEvent",function(self,event,...) if self[event] then self[event](self,...) end end)

