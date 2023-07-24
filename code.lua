local BambiUI = CreateFrame("Frame", nil, UIParent)

local Ctimer = C_Timer.After
local strmatch = string.match
local strfind = string.find
local tblinsert = table.insert
local tremove = table.remove

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
		COMBAT_TEXT_HEIGHT = 25;
		COMBAT_TEXT_STAGGER_RANGE = 0;
		COMBAT_TEXT_SPACING = 5;
		COMBAT_TEXT_MAX_OFFSET = 35;
		NUM_COMBAT_TEXT_LINES = 10;
		COMBAT_TEXT_X_ADJUSTMENT = 80;
		OMBAT_TEXT_CRIT_MAXHEIGHT = 45;
		MAX_TARGET_DEBUFFS = 32;
		MAX_TARGET_BUFFS = 32;

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

		SetCVar("SpellQueueWindow", 170)
		SetCVar("noBuffDebuffFilterOnTarget", 1)
		SetCVar("fstack_preferParentKey", 0)
		SetCVar("autoSelfCast", 0)
		SetCVar("weatherdensity", 1)
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
		print("InCombatLockdown: MoveRaid (Standard)")
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
		print("RaidFrames Position (Standard)")
			--Would be nice to ENABLE pets here
			--2, +14 offset from raid
			--Would be nice to ENABLE pets here
		FramerateAnchor:ClearAllPoints()
		FramerateAnchor:SetPoint("CENTER",UIParent,"CENTER", 0, yFramerateAnchor)
		end
		BambiUI:OmniCDAnchor(true)
		BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end
	BambiUI_MoveRaidUpperRight = CreateFrame('CheckButton', 'BambiUI_MoveRaidUpperRight', BambiUI_MoveRaidUpperRight, 'UICheckButtonTemplate')
	BambiUI_MoveRaidUpperRight:SetScript('OnClick', function() MoveRaidUpperRight()	end)

	local function MoveRaidCenter()
		if InCombatLockdown() then
			print("InCombatLockdown: MoveRaid (Standard)")
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
		end
	end

	--CompactArenaFrame:HookScript("OnShow", function(self) CompactArenaFrame:Hide() end)
	--CompactArenaFrame:HookScript("OnEvent", function(self) CompactArenaFrame:Hide() end)

--------------------------------------------------------------------------------------------------------------------------------
--ReSizeRaidFrames
--------------------------------------------------------------------------------------------------------------------------------

	local function ReSizeRaidFrames()
		Ctimer(1, function()
			CompactRaidFrameContainer:SetScale(sizeStandard) --works in combat
			PartyFrame:SetScale(sizeStandard)
			CompactRaidFrameContainer:SetClampedToScreen(false) --Allows RaidFrame to Move OffScreen
			if CompactPartyFrameTitle then --Hides Party on PartyFrame
				CompactPartyFrameTitle:SetAlpha(0)
			end
		end)
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
	local alphaOmni = 1
	local yPadding = -10
	local playerpadding = -10
	local petpadding = -11


	local OmniCDAnchor = {}

	for i = 1, 40 do
		OmniCDAnchor["CompactRaidFrame"..i] = CreateFrame("Frame", "OmniCDRaid"..i, UIParent)
		local OmniCDAnchor = OmniCDAnchor["CompactRaidFrame"..i]
		OmniCDAnchor:ClearAllPoints()
		OmniCDAnchor:SetSize(iconSize, iconSize)
		OmniCDAnchor.texture = OmniCDAnchor:CreateTexture(nil, "BACKGROUND")
		OmniCDAnchor.texture:SetAllPoints(true)
		OmniCDAnchor.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
		OmniCDAnchor.t = OmniCDAnchor:CreateFontString(nil, "OVERLAY", "GameTooltipText")
		OmniCDAnchor.t:SetParent(OmniCDAnchor)
		OmniCDAnchor.t:SetText(OmniCDAnchor:GetName())
		OmniCDAnchor.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
		OmniCDAnchor.t:SetPoint("BOTTOMLEFT", OmniCDAnchor, "BOTTOMRIGHT", 2, 0)
		OmniCDAnchor.t:SetTextColor(1, 1, 1, alphaOmni)
		
	end

	for i = 1, 8 do
		for j = 1, 5 do
			OmniCDAnchor["CompactRaidGroup"..i.."Member"..j] = CreateFrame("Frame", "OmniCDRaid"..i.."Member"..j, UIParent)
			local OmniCDAnchor = OmniCDAnchor["CompactRaidGroup"..i.."Member"..j]
			OmniCDAnchor:ClearAllPoints()
			OmniCDAnchor:SetSize(iconSize, iconSize)
			OmniCDAnchor.texture = OmniCDAnchor:CreateTexture(nil, "BACKGROUND")
			OmniCDAnchor.texture:SetAllPoints(OmniCDAnchor)
			OmniCDAnchor.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
			OmniCDAnchor.t = OmniCDAnchor:CreateFontString(nil, "OVERLAY", "GameTooltipText")
			OmniCDAnchor.t:SetParent(OmniCDAnchor)
			OmniCDAnchor.t:SetText(OmniCDAnchor:GetName())
			OmniCDAnchor.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
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
		OmniCDAnchor.t:SetText(OmniCDAnchor:GetName())
		OmniCDAnchor.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
		OmniCDAnchor.t:SetPoint("BOTTOMLEFT", OmniCDAnchor, "BOTTOMRIGHT", 2, 0)
		OmniCDAnchor.t:SetTextColor(1, 1, 1, alphaOmni)
	end

	local OmniCDKey  = {}

	for i = 1, 40 do 
		OmniCDKey["raid"..i] = CreateFrame("Frame", "BambiUI"..i, UIParent)
		local OmniCDKey = OmniCDKey["raid"..i]
		OmniCDKey:ClearAllPoints()
		OmniCDKey:SetSize(iconSize, iconSize)
		OmniCDKey.texture = OmniCDKey:CreateTexture(nil, "BACKGROUND")
		OmniCDKey.texture:SetAllPoints(true)
		OmniCDKey.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
		OmniCDKey.t = OmniCDKey:CreateFontString(nil, "OVERLAY", "GameTooltipText")
		OmniCDKey.t:SetParent(OmniCDKey)
		OmniCDKey.t:SetText(OmniCDKey:GetName())
		OmniCDKey.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
		OmniCDKey.t:SetPoint("TOPLEFT", OmniCDKey, "TOPRIGHT", 2, 0)
		OmniCDKey.t:SetTextColor(1, 1, 1, alphaOmni)
		OmniCDKey.yourUnitKey = "raid"..i
	end

	for i = 1, 5 do 
		if i == 5 then 
			OmniCDKey["player"] = CreateFrame("Frame", "BambiUI"..45, UIParent)
			local OmniCDKey = OmniCDKey["player"]
			OmniCDKey:ClearAllPoints()
			OmniCDKey:SetSize(iconSize, iconSize)
			OmniCDKey.texture = OmniCDKey:CreateTexture(nil, "BACKGROUND")
			OmniCDKey.texture:SetAllPoints(OmniCDKey)
			OmniCDKey.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
			OmniCDKey.t = OmniCDKey:CreateFontString(nil, "OVERLAY", "GameTooltipText")
			OmniCDKey.t:SetParent(OmniCDKey)
			OmniCDKey.t:SetText(OmniCDKey:GetName())
			OmniCDKey.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
			OmniCDKey.t:SetPoint("TOPLEFT", OmniCDKey, "TOPRIGHT", 2, 0)
			OmniCDKey.t:SetTextColor(1, 1, 1, alphaOmni)
			OmniCDKey.yourUnitKey = "player"
		else	
			local x = 40 + i
			OmniCDKey["party"..i] = CreateFrame("Frame", "BambiUI"..x, UIParent)
			local OmniCDKey = OmniCDKey["party"..i]
			OmniCDKey:ClearAllPoints()
			OmniCDKey:SetSize(iconSize, iconSize)
			OmniCDKey.texture = OmniCDKey:CreateTexture(nil, "BACKGROUND")
			OmniCDKey.texture:SetAllPoints(OmniCDKey)
			OmniCDKey.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
			OmniCDKey.t = OmniCDKey:CreateFontString(nil, "OVERLAY", "GameTooltipText")
			OmniCDKey.t:SetParent(OmniCDKey)
			OmniCDKey.t:SetText(OmniCDKey:GetName())
			OmniCDKey.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
			OmniCDKey.t:SetPoint("TOPLEFT", OmniCDKey, "TOPRIGHT", 2, 0)
			OmniCDKey.t:SetTextColor(1, 1, 1, alphaOmni)
			OmniCDKey.yourUnitKey = "party"..i
		end
	end

	local lastPartyAnchor

	function  BambiUI:OmniCDAnchor(forced)
		local frames = {}
		local groups = {}
		local RaidFrameShown

		local inInstance, instanceType = IsInInstance()

		if EditModeManagerFrame:UseRaidStylePartyFrames() then

			if not EditModeManagerFrame:ShouldRaidFrameShowSeparateGroups() then
				for i = 1, 40 do
					local compactRaidFrame = _G["CompactRaidFrame"..i]
					OmniCDAnchor["CompactRaidFrame"..i]:ClearAllPoints()
					OmniCDAnchor["CompactRaidFrame"..i]:Hide()
					if instanceType ~= "arena" and IsInRaid() and compactRaidFrame and compactRaidFrame.unit and compactRaidFrame:IsShown() then
						tblinsert(frames, compactRaidFrame)
						RaidFrameShown = true
					end
				end
			elseif EditModeManagerFrame:ShouldRaidFrameShowSeparateGroups() then
				for i = 1, 8 do
					for j = 1, 5 do
						local compactRaidFrame = _G["CompactRaidGroup"..i.."Member"..j]
						OmniCDAnchor["CompactRaidGroup"..i.."Member"..j]:ClearAllPoints()
						OmniCDAnchor["CompactRaidGroup"..i.."Member"..j]:Hide()
						if instanceType ~= "arena" and IsInRaid() and compactRaidFrame and compactRaidFrame.unit and compactRaidFrame:IsShown() then
							tblinsert(frames, compactRaidFrame)
							RaidFrameShown = true
						end
					end
				end
			end

			for i = 1, 5 do
				local compactRaidFrame = _G["CompactPartyFrameMember"..i]
				if not RaidFrameShown and compactRaidFrame and compactRaidFrame.unit and compactRaidFrame:IsShown() then
					tblinsert(frames, compactRaidFrame)
				else
					OmniCDAnchor["CompactPartyFrameMember"..i]:ClearAllPoints()
					OmniCDAnchor["CompactPartyFrameMember"..i]:Hide()
				end
			end

			for i = 1, 5 do
				local compactRaidFrame = _G["CompactPartyFramePet"..i]
				if not RaidFrameShown and compactRaidFrame and compactRaidFrame.unit and compactRaidFrame:IsShown() then
					tblinsert(frames, compactRaidFrame)
				end
			end

			table.sort(frames, function(x, y)
				if x:GetLeft() ~= y:GetLeft() then
					return x:GetLeft() < y:GetLeft()
				end
					return x:GetLeft() > y:GetLeft()
			end)

			for i = 1 , 8 do 
				groups[i] = {}
			end
			
			for i, frame in ipairs(frames) do
				if RaidFrameShown and EditModeManagerFrame:ShouldRaidFrameShowSeparateGroups() then
					if strfind(frame:GetName(), "CompactRaidGroup1") then
						tblinsert(groups[1], frame)
					end
					if strfind(frame:GetName(), "CompactRaidGroup2") then
						tblinsert(groups[2], frame)
					end
					if strfind(frame:GetName(), "CompactRaidGroup3") then
						tblinsert(groups[3], frame)
					end
					if strfind(frame:GetName(), "CompactRaidGroup4") then
						tblinsert(groups[4], frame)
					end
					if strfind(frame:GetName(), "CompactRaidGroup5") then
						tblinsert(groups[5], frame)
					end
					if strfind(frame:GetName(), "CompactRaidGroup6") then
						tblinsert(groups[6], frame)
					end
					if strfind(frame:GetName(), "CompactRaidGroup7") then
						tblinsert(groups[7], frame)
					end
					if strfind(frame:GetName(), "CompactRaidGroup8") then
						tblinsert(groups[8], frame)
					end
				elseif RaidFrameShown and not EditModeManagerFrame:ShouldRaidFrameShowSeparateGroups() then
					if i <= 5 then
						tblinsert(groups[1], frame)
					end
					if i > 5 and i <= 10 then
						tblinsert(groups[2], frame)
					end
					if i > 10 and i <= 15 then
						tblinsert(groups[3], frame)
					end
					if i > 15 and i <= 20 then
						tblinsert(groups[4], frame)
					end
					if i > 20 and i <= 25 then
						tblinsert(groups[5], frame)
					end
					if i > 25 and i <= 30 then
						tblinsert(groups[6], frame)
					end
					if i > 30 and i <= 35 then 
						tblinsert(groups[7], frame)
					end
					if i > 35 and i <= 40 then 
						tblinsert(groups[8], frame)
					end
				elseif not RaidFrameShown then 
					tblinsert(groups[1], frame)
				end
			end

			for i = 1 , 8 do 	
				if #groups[i] > 0 then 
					table.sort(groups[i], function(x, y)
						return x:GetTop() > y:GetTop()
					end)

					local Anchor = groups[i][#groups[i]]
					print(groups[i][#groups[i]]:GetName())
		
					if strfind(Anchor:GetName(), "pet") then
						yPadding = petpadding
					else
						yPadding = playerpadding
					end

					local count = 1 
					local lastanchorFrame
					if RaidFrameShown or forced or lastPartyAnchor ~= Anchor then
						for _, frame in ipairs(groups[i]) do
							if frame and frame.unit and not strfind(frame.unit, "pet") then 
								local anchorFrame = OmniCDAnchor[frame:GetName()]
								local keyFrame = OmniCDKey[frame.unit]
								anchorFrame:ClearAllPoints()
								keyFrame:ClearAllPoints()
								if count == 1 then 
									anchorFrame:SetPoint("TOPLEFT", Anchor, "BOTTOMLEFT", 1, yPadding)
									lastPartyAnchor = Anchor
								else
									anchorFrame:SetPoint("TOPLEFT", lastanchorFrame , "BOTTOMLEFT", 0, yPadding)
								end
								anchorFrame:Show()
								keyFrame:SetParent(anchorFrame)
								keyFrame:SetPoint("CENTER", anchorFrame, "CENTER", 0, nil)
								count = count + 1
								lastanchorFrame = anchorFrame
								--print(frame:GetName() .. " = " .. frame.unit)
							end
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
		Ctimer(1, function() 		 
			BambiUI:OmniCDAnchor()
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end)

	hooksecurefunc(EditModeManagerFrame, "UpdateRaidContainerFlow", function(groupMode)
		--print("EditModeManagerFrame: UpdateRaidContainerFlow")
		Ctimer(1, function() 		 
			BambiUI:OmniCDAnchor()
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetGroupMode", function(groupMode)
		--print("SetGroupMode")
		Ctimer(1, function() 		 
			BambiUI:OmniCDAnchor()
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetFlowFilterFunction", function(flowFilterFunc)
		--print("SetFlowFilterFunction")
		Ctimer(1, function() 		 
			BambiUI:OmniCDAnchor()
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetGroupFilterFunction", function(groupFilterFunc)
		--print("SetGroupFilterFunction")
		Ctimer(1, function() 		 
			BambiUI:OmniCDAnchor()
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetFlowSortFunction", function(flowSortFunc)
		--print("SetFlowSortFunction")
		Ctimer(1, function() 		 
			BambiUI:OmniCDAnchor()
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end)

	hooksecurefunc(CompactPartyFrame, "SetFlowSortFunction", function()
		--print("CompactPartyFrame_SetFlowSortFunction")
		Ctimer(1, function() 		 
			BambiUI:OmniCDAnchor()
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end)

	hooksecurefunc("CompactUnitFrame_OnLoad", function(self)
		Ctimer(1, function() 		 
			BambiUI:OmniCDAnchor()
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end)

	

	function BambiUI:GROUP_ROSTER_UPDATE()
		Ctimer(1, function() 		 
			BambiUI:OmniCDAnchor()
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end

	function BambiUI:UNIT_PET()
		Ctimer(1, function() 		 
			BambiUI:OmniCDAnchor()
			--BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end

	function BambiUI:ADDON_LOADED(arg1)
		 OmniCDKey(arg1)
	end

	function BambiUI:PLAYER_ENTERING_WORLD()
		 ReSizeRaidFrames()
		 MoveFrameRate()
		 Ctimer(2, function() 		 
			BambiUI:OmniCDAnchor(true)
			BambiUI:UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() 
		end) 
	end

	function BambiUI:ARENA_OPPONENT_UPDATE()
		ArenaHide()
	end

	function BambiUI:ARENA_PREP_OPPONENT_SPECIALIZATIONS()
		--ArenaHide()
	end

	BambiUI:RegisterEvent("ADDON_LOADED")
	BambiUI:RegisterEvent("GROUP_ROSTER_UPDATE")
	BambiUI:RegisterEvent("PLAYER_ENTERING_WORLD")
	BambiUI:RegisterEvent("UNIT_PET")
	BambiUI:RegisterEvent("ARENA_OPPONENT_UPDATE")
	BambiUI:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")
	BambiUI:SetScript("OnEvent",function(self,event,...) if self[event] then self[event](self,...) end end)

