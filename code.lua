
local Ctimer = C_Timer.After
local strmatch = string.match
local strfind = string.find

--------------------------------------------------------------------------------------------------------------------------------
--Move Frame rate
--------------------------------------------------------------------------------------------------------------------------------
local FramerateAnchorSizeX = 100
local FramerateAnchorSizeY = 2
local FramerateAnchoralpha = 0
local FramerateAnchorScale = 1.3
local yFramerateAnchor = -275
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
	FramerateLabel:ClearAllPoints()
	FramerateLabel:SetParent(FramerateAnchor)
	--FramerateLabel:SetPoint("CENTER",UIParent,"CENTER", 0, -220)
	FramerateLabel:SetPoint("CENTER",FramerateAnchor,"CENTER", 0, 0)
	FramerateText:SetPoint("LEFT",FramerateLabel,"RIGHT")
	FramerateText:SetParent(FramerateAnchor)
	FramerateText:ClearAllPoints()
	FramerateLabel:SetScale(FramerateAnchorScale)
	FramerateText:SetScale(FramerateAnchorScale)
end

FramerateText:HookScript("OnShow", function(self)
	FramerateLabel:ClearAllPoints()
	--FramerateLabel:SetPoint("CENTER",UIParenr,"CENTER", 0, -220)
	FramerateLabel:SetPoint("RIGHT",FramerateAnchor,"CENTER", 0, 0)
	FramerateLabel:SetParent(FramerateAnchor)
	FramerateText:ClearAllPoints()
	FramerateText:SetPoint("LEFT",FramerateLabel,"RIGHT")
	FramerateText:SetParent(FramerateAnchor)
	FramerateLabel:SetScale(FramerateAnchorScale)
	FramerateText:SetScale(FramerateAnchorScale)
end)



--[[FramerateFrame:SetScript("OnUpdate", function(self, elapsed)
	if ( FramerateText:IsShown() ) then
		local timeLeft = self.fpsTime - elapsed
		if ( timeLeft <= 0 ) then
			self.fpsTime = FRAMERATE_FREQUENCY;
			local framerate = GetFramerate();
			FramerateText:SetFormattedText("%.1f", framerate);
			local point, relativeTo, relativePoint, offset_x, offset_y = FramerateText:GetPoint()
			if relativeTo ~= FramerateLabels then
				FramerateLabel:ClearAllPoints()
				FramerateLabel:SetPoint("RIGHT",FramerateAnchor,"CENTER", 0, 0)
				FramerateLabel:SetParent(FramerateAnchor)
				FramerateText:ClearAllPoints()
				FramerateText:SetPoint("LEFT",FramerateLabel,"RIGHT")
				FramerateText:SetParent(FramerateAnchor)
			end
		else
			self.fpsTime = timeLeft;
		end
	end
end)]]


QueueStatusButton:HookScript("OnShow", function(self)
	FramerateLabel:ClearAllPoints()
	--FramerateLabel:SetPoint("CENTER",UIParenr,"CENTER", 0, -220)
	FramerateLabel:SetPoint("RIGHT",FramerateAnchor,"CENTER", 0, 0)
	FramerateLabel:SetParent(FramerateAnchor)
	FramerateText:ClearAllPoints()
	FramerateText:SetPoint("LEFT",FramerateLabel,"RIGHT")
	FramerateText:SetParent(FramerateAnchor)
	FramerateLabel:SetScale(FramerateAnchorScale)
	FramerateText:SetScale(FramerateAnchorScale)
end)

QueueStatusButton:HookScript("OnHide", function(self)
	FramerateLabel:ClearAllPoints()
	--FramerateLabel:SetPoint("CENTER",UIParenr,"CENTER", 0, -220)
	FramerateLabel:SetPoint("RIGHT",FramerateAnchor,"CENTER", 0, 0)
	FramerateLabel:SetParent(FramerateAnchor)
	FramerateText:ClearAllPoints()
	FramerateText:SetPoint("LEFT",FramerateLabel,"RIGHT")
	FramerateText:SetParent(FramerateAnchor)
	FramerateLabel:SetScale(FramerateAnchorScale)
	FramerateText:SetScale(FramerateAnchorScale)
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
			ArenaEnemyMatchFrame1:SetAlpha(0)
			ArenaEnemyMatchFrame2:SetAlpha(0)
			ArenaEnemyMatchFrame3:SetAlpha(0)
			ArenaEnemyMatchFrame4:SetAlpha(0)
			ArenaEnemyMatchFrame5:SetAlpha(0)
			ArenaEnemyMatchFrame1PetFrame:SetAlpha(0)
			ArenaEnemyMatchFrame2PetFrame:SetAlpha(0)
			ArenaEnemyMatchFrame3PetFrame:SetAlpha(0)
			ArenaEnemyMatchFrame4PetFrame:SetAlpha(0)
			ArenaEnemyMatchFrame5PetFrame:SetAlpha(0)
		end
	end

	ArenaEnemyMatchFrame1:SetAlpha(0)
	ArenaEnemyMatchFrame2:SetAlpha(0)
	ArenaEnemyMatchFrame3:SetAlpha(0)
	ArenaEnemyMatchFrame4:SetAlpha(0)
	ArenaEnemyMatchFrame5:SetAlpha(0)
	ArenaEnemyMatchFrame1PetFrame:SetAlpha(0)
	ArenaEnemyMatchFrame2PetFrame:SetAlpha(0)
	ArenaEnemyMatchFrame3PetFrame:SetAlpha(0)
	ArenaEnemyMatchFrame4PetFrame:SetAlpha(0)
	ArenaEnemyMatchFrame5PetFrame:SetAlpha(0)




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

	local HookedCompactRaidFrames = { }
	local AnchorFrames = {}
	local size = 62
	local alpha = 1
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

	local function SetCompactAnchor(compactRaidFrame, index)
		local icon, OmniCDFrames
		local members = GetNumGroupMembers()
		if not OmniCDFrames then
			OmniCDFrames = {}
			OmniCDFrames[1] = OmniCD1
			OmniCDFrames[2] = OmniCD2
			OmniCDFrames[3] = OmniCD3
			OmniCDFrames[4] = OmniCD4
			OmniCDFrames[5] = OmniCD5
		end
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
					if members <= 5 then
						OmniCDFrames[5]:ClearAllPoints()
						OmniCDFrames[5]:SetPoint("CENTER", "OmniCDAnchor"..index, "CENTER", 0, yPadding)
					end
				else
					for i = 1, 4 do
						local unit = "party"..i
						if UnitIsUnit(anchorUnitId, unit) then 
							icon = AnchorFrames[i]
							if members <= 5 then
								OmniCDFrames[i]:ClearAllPoints()
								OmniCDFrames[i]:SetPoint("CENTER", "OmniCDAnchor"..index, "CENTER", 0, yPadding)
							end
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
									if members <= 5 then
										OmniCDFrames[1]:ClearAllPoints()
										OmniCDFrames[1]:SetPoint("CENTER", "OmniCDAnchor"..i, "CENTER", 0, yPadding)
									end
								elseif UnitIsUnit(anchorPartyUnitId, "party2") then  
									icon = AnchorFrames[2]; compactRaidFrame = anchorPartyframe
									if members <= 5 then
										OmniCDFrames[2]:ClearAllPoints()
										OmniCDFrames[2]:SetPoint("CENTER", "OmniCDAnchor"..i, "CENTER", 0, yPadding)
									end
								elseif UnitIsUnit(anchorPartyUnitId, "party3") then 
									icon = AnchorFrames[3]; compactRaidFrame = anchorPartyframe
									if members <= 5 then
										OmniCDFrames[4]:ClearAllPoints()
										OmniCDFrames[4]:SetPoint("CENTER", "OmniCDAnchor"..i, "CENTER", 0, yPadding)
									end
								elseif UnitIsUnit(anchorPartyUnitId, "party4") then 
									icon = AnchorFrames[4]; compactRaidFrame = anchorPartyframe
									if members <= 5 then
										OmniCDFrames[4]:ClearAllPoints()
										OmniCDFrames[4]:SetPoint("CENTER", "OmniCDAnchor"..i, "CENTER", 0, yPadding)
									end
								elseif UnitIsUnit(anchorPartyUnitId, "player") then 
									icon = AnchorFrames[5]; compactRaidFrame = anchorPartyframe
									if members <= 5 then
										OmniCDFrames[5]:ClearAllPoints()
										OmniCDFrames[5]:SetPoint("CENTER", "OmniCDAnchor"..i, "CENTER", 0, yPadding)
									end
								end
							end
						end
					end
				else
					if UnitIsUnit(anchorUnitId, "player") then 
						icon = AnchorFrames[5]
						OmniCDFrames[5]:ClearAllPoints()
					else
						for i = 1, 4 do
							local unit = "party"..i
							if UnitIsUnit(anchorUnitId, unit) then 
								icon = AnchorFrames[i]
								OmniCDFrames[i]:ClearAllPoints()
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

	local function UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
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


	local BambiUI = CreateFrame("Frame", nil, UIParent)

	local iconSize = 20 -- Needs to be same size as the OmniCD Icon
	local alphaOmni = 1
	local yPadding = -10

	local OmniCDAnchor1 = CreateFrame("Frame", "OmniCDAnchor1", UIParent)
	OmniCDAnchor1:ClearAllPoints()
	OmniCDAnchor1:SetSize(iconSize, iconSize)
	OmniCDAnchor1.texture = OmniCDAnchor1:CreateTexture(nil, "BACKGROUND")
	OmniCDAnchor1.texture:SetAllPoints(true)
	OmniCDAnchor1.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCDAnchor1.t = OmniCDAnchor1:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	OmniCDAnchor1.t:SetParent(OmniCDAnchor1)
	OmniCDAnchor1.t:SetText(OmniCDAnchor1:GetName())
	OmniCDAnchor1.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	OmniCDAnchor1.t:SetPoint("BOTTOMLEFT", OmniCDAnchor1, "BOTTOMRIGHT", 2, 0)
	OmniCDAnchor1.t:SetTextColor(1, 1, 1, alphaOmni)
	--OmniCDAnchor1.yourUnitKey = "party1"

	local OmniCDAnchor2 = CreateFrame("Frame", "OmniCDAnchor2", UIParent)
	OmniCDAnchor2:ClearAllPoints()
	OmniCDAnchor2:SetSize(iconSize, iconSize)
	OmniCDAnchor2:SetPoint("TOP", OmniCDAnchor1, "BOTTOM", 0, yPadding)
	OmniCDAnchor2.texture = OmniCDAnchor2:CreateTexture(nil, "BACKGROUND")
	OmniCDAnchor2.texture:SetAllPoints(true)
	OmniCDAnchor2.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCDAnchor2.t = OmniCDAnchor2:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	OmniCDAnchor2.t:SetParent(OmniCDAnchor2)
	OmniCDAnchor2.t:SetText(OmniCDAnchor2:GetName())
	OmniCDAnchor2.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	OmniCDAnchor2.t:SetPoint("BOTTOMLEFT", OmniCDAnchor2, "BOTTOMRIGHT", 2, 0)
	OmniCDAnchor2.t:SetTextColor(1, 1, 1, alphaOmni)
	--OmniCDAnchor2.yourUnitKey = "party2"

	local OmniCDAnchor3 = CreateFrame("Frame", "OmniCDAnchor3", UIParent)
	OmniCDAnchor3:ClearAllPoints()
	OmniCDAnchor3:SetSize(iconSize, iconSize)
	OmniCDAnchor3:SetPoint("TOP", OmniCDAnchor2, "BOTTOM", 0, yPadding)
	OmniCDAnchor3.texture = OmniCDAnchor3:CreateTexture(nil, "BACKGROUND")
	OmniCDAnchor3.texture:SetAllPoints(true)
	OmniCDAnchor3.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCDAnchor3.t = OmniCDAnchor3:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	OmniCDAnchor3.t:SetParent(OmniCDAnchor3)
	OmniCDAnchor3.t:SetText(OmniCDAnchor3:GetName())
	OmniCDAnchor3.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	OmniCDAnchor3.t:SetPoint("BOTTOMLEFT", OmniCDAnchor3, "BOTTOMRIGHT", 2, 0)
	OmniCDAnchor3.t:SetTextColor(1, 1, 1, alphaOmni)
	--OmniCDAnchor3.yourUnitKey = "party3"

	local OmniCDAnchor4 = CreateFrame("Frame", "OmniCDAnchor4", UIParent)
	OmniCDAnchor4:ClearAllPoints()
	OmniCDAnchor4:SetSize(iconSize, iconSize)
	OmniCDAnchor4:SetPoint("TOP", OmniCDAnchor3, "BOTTOM", 0, yPadding)
	OmniCDAnchor4.texture = OmniCDAnchor4:CreateTexture(nil, "BACKGROUND")
	OmniCDAnchor4.texture:SetAllPoints(true)
	OmniCDAnchor4.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCDAnchor4.t = OmniCDAnchor4:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	OmniCDAnchor4.t:SetParent(OmniCDAnchor4)
	OmniCDAnchor4.t:SetText(OmniCDAnchor4:GetName())
	OmniCDAnchor4.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	OmniCDAnchor4.t:SetPoint("BOTTOMLEFT", OmniCDAnchor4, "BOTTOMRIGHT", 2, 0)
	OmniCDAnchor4.t:SetTextColor(1, 1, 1, alphaOmni)
	--OmniCDAnchor4.yourUnitKey = "party4"

	
	local OmniCDAnchor5 = CreateFrame("Frame", "OmniCDAnchor5", UIParent)
	OmniCDAnchor5:ClearAllPoints()
	OmniCDAnchor5:SetSize(iconSize, iconSize)
	OmniCDAnchor5:SetPoint("TOP", OmniCDAnchor4, "BOTTOM", 0, yPadding)
	OmniCDAnchor5.texture = OmniCDAnchor5:CreateTexture(nil, "BACKGROUND")
	OmniCDAnchor5.texture:SetAllPoints(true)
	OmniCDAnchor5.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCDAnchor5.t = OmniCDAnchor5:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	OmniCDAnchor5.t:SetParent(OmniCDAnchor5)
	OmniCDAnchor5.t:SetText(OmniCDAnchor5:GetName())
	OmniCDAnchor5.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	OmniCDAnchor5.t:SetPoint("BOTTOMLEFT", OmniCDAnchor5, "BOTTOMRIGHT", 2, 0)
	OmniCDAnchor5.t:SetTextColor(1, 1, 1, alphaOmni)
	--OmniCDAnchor5.yourUnitKey = "player"

	local OmniCD1 = CreateFrame("Frame", "OmniCD1", UIParent)
	OmniCD1:ClearAllPoints()
	OmniCD1:SetSize(iconSize, iconSize)
	OmniCD1.texture = OmniCD1:CreateTexture(nil, "BACKGROUND")
	OmniCD1.texture:SetAllPoints(true)
	OmniCD1.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCD1.t = OmniCD1:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	OmniCD1.t:SetParent(OmniCD1)
	OmniCD1.t:SetText(OmniCD1:GetName())
	OmniCD1.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	OmniCD1.t:SetPoint("TOPLEFT", OmniCD1, "TOPRIGHT", 2, 0)
	OmniCD1.t:SetTextColor(1, 1, 1, alphaOmni)
	OmniCD1.yourUnitKey = "party1"

	local OmniCD2 = CreateFrame("Frame", "OmniCD2", UIParent)
	OmniCD2:ClearAllPoints()
	OmniCD2:SetSize(iconSize, iconSize)
	OmniCD2:SetPoint("TOP", OmniCD1, "BOTTOM", 0, yPadding)
	OmniCD2.texture = OmniCD2:CreateTexture(nil, "BACKGROUND")
	OmniCD2.texture:SetAllPoints(true)
	OmniCD2.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCD2.t = OmniCD2:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	OmniCD2.t:SetParent(OmniCD2)
	OmniCD2.t:SetText(OmniCD2:GetName())
	OmniCD2.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	OmniCD2.t:SetPoint("TOPLEFT", OmniCD2, "TOPRIGHT", 2, 0)
	OmniCD2.t:SetTextColor(1, 1, 1, alphaOmni)
	OmniCD2.yourUnitKey = "party2"

	local OmniCD3 = CreateFrame("Frame", "OmniCD3", UIParent)
	OmniCD3:ClearAllPoints()
	OmniCD3:SetSize(iconSize, iconSize)
	OmniCD3:SetPoint("TOP", OmniCD2, "BOTTOM", 0, yPadding)
	OmniCD3.texture = OmniCD3:CreateTexture(nil, "BACKGROUND")
	OmniCD3.texture:SetAllPoints(true)
	OmniCD3.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCD3.t = OmniCD3:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	OmniCD3.t:SetParent(OmniCD3)
	OmniCD3.t:SetText(OmniCD3:GetName())
	OmniCD3.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	OmniCD3.t:SetPoint("TOPLEFT", OmniCD3, "TOPRIGHT", 2, 0)
	OmniCD3.t:SetTextColor(1, 1, 1, alphaOmni)
	OmniCD3.yourUnitKey = "party3"

	local OmniCD4 = CreateFrame("Frame", "OmniCD4", UIParent)
	OmniCD4:ClearAllPoints()
	OmniCD4:SetSize(iconSize, iconSize)
	OmniCD4:SetPoint("TOP", OmniCD3, "BOTTOM", 0, yPadding)
	OmniCD4.texture = OmniCD4:CreateTexture(nil, "BACKGROUND")
	OmniCD4.texture:SetAllPoints(true)
	OmniCD4.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCD4.t = OmniCD4:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	OmniCD4.t:SetParent(OmniCD4)
	OmniCD4.t:SetText(OmniCD4:GetName())
	OmniCD4.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	OmniCD4.t:SetPoint("TOPLEFT", OmniCD4, "TOPRIGHT", 2, 0)
	OmniCD4.t:SetTextColor(1, 1, 1, alphaOmni)
	OmniCD4.yourUnitKey = "party4"

	
	local OmniCD5 = CreateFrame("Frame", "OmniCD5", UIParent)
	OmniCD5:ClearAllPoints()
	OmniCD5:SetSize(iconSize, iconSize)
	OmniCD5:SetPoint("TOP", OmniCD4, "BOTTOM", 0, yPadding)
	OmniCD5.texture = OmniCD5:CreateTexture(nil, "BACKGROUND")
	OmniCD5.texture:SetAllPoints(true)
	OmniCD5.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCD5.t = OmniCD5:CreateFontString(nil, "OVERLAY", "GameTooltipText")
	OmniCD5.t:SetParent(OmniCD5)
	OmniCD5.t:SetText("Player")
	OmniCD5.t:SetFont("Fonts\\FRIZQT__.TTF", 9 )
	OmniCD5.t:SetPoint("TOPLEFT", OmniCD5, "TOPRIGHT", 2, 0)
	OmniCD5.t:SetTextColor(1, 1, 1, alphaOmni)
	OmniCD5.yourUnitKey = "player"

	local x = 1
	local y = 0
	local OmniCDAnchorFrame

	local function OmniCDAnchor()
		local units, pets, Anchor = 0, nil, nil
		local members = GetNumGroupMembers()
		if EditModeManagerFrame:UseRaidStylePartyFrames() and members <= 5 then
			for i = 1, 5 do
				local compactRaidFrame = _G["CompactPartyFrameMember"..i] --Probably will Need to Add a Pet Function Later
				if (compactRaidFrame ~= nil) then
					if UnitExists(compactRaidFrame.unit) then
						Anchor = compactRaidFrame
						units = units + 1
					end
				end
			end
			Ctimer(.001, function() 
				if UnitExists("partypet1") and PPF_P1:IsShown() then
					Anchor= PPF_P1
					pets = 1
				end
				if UnitExists("partypet2") and PPF_P2:IsShown() then
					Anchor= PPF_P2
					pets = 2
				end
				if UnitExists("partypet3") and PPF_P3:IsShown() then
					Anchor= PPF_P3
					pets = 3
				end
				if not pets and Anchor ~= OmniCDAnchorFrame then
					OmniCDAnchorFrame = Anchor
					OmniCDAnchor1:ClearAllPoints()
					OmniCDAnchor1:SetPoint("TOPLEFT", Anchor, "BOTTOMLEFT", 1, yPadding)
				elseif pets == 1 and Anchor ~= OmniCDAnchorFrame then
					OmniCDAnchorFrame = PPF_P1
					OmniCDAnchor1:ClearAllPoints()
					OmniCDAnchor1:SetPoint("TOPLEFT", PPF_P1, "BOTTOMLEFT", 1, yPadding)
				elseif pets == 2 and Anchor ~= OmniCDAnchorFrame then
					OmniCDAnchorFrame = PPF_P2
					OmniCDAnchor1:ClearAllPoints()
					OmniCDAnchor1:SetPoint("TOPLEFT", PPF_P2, "BOTTOMLEFT", 1, yPadding)
				elseif pets == 3 and Anchor ~= OmniCDAnchorFrame then
					OmniCDAnchorFrame = PPF_P3
					OmniCDAnchor1:ClearAllPoints()
					OmniCDAnchor1:SetPoint("TOPLEFT", PPF_P3, "BOTTOMLEFT", 1, yPadding)
				end
			end)
		end
	end

	--PPF_PetButton

	local function OmniCDKey(arg1)
		if arg1 == "BambiUI" or arg1 == "OmniCD" then
			if OmniCD then
				OmniCD.AddUnitFrameData("BambiUI", "OmniCD", "yourUnitKey", 1)
			end
		end
		C_Timer.After(8, function()	-- delay checking to make sure all variables of the other addons are loaded
			OmniCDKey(arg1)
		end)
	end

--------------------------------------------------------------------------------------------------------------------------------
--Handler's
--------------------------------------------------------------------------------------------------------------------------------

	EditModeManagerFrame:HookScript("OnHide", function() Ctimer(.002, function() OmniCDAnchor() UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() end) end)

	hooksecurefunc(EditModeManagerFrame, "UpdateRaidContainerFlow", function(groupMode)
		--print("EditModeManagerFrame: UpdateRaidContainerFlow")
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetGroupMode", function(groupMode)
		--print("SetGroupMode")
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetFlowFilterFunction", function(flowFilterFunc)
		--print("SetFlowFilterFunction")
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetGroupFilterFunction", function(groupFilterFunc)
		--print("SetGroupFilterFunction")
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetFlowSortFunction", function(flowSortFunc)
		--print("SetFlowSortFunction")
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc("CompactPartyFrame_SetFlowSortFunction", function()
		--print("CompactPartyFrame_SetFlowSortFunction")
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc("CompactUnitFrame_OnLoad", function(self)
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc("CompactUnitFrame_UpdateAll", function(self)
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	function BambiUI:GROUP_ROSTER_UPDATE()
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end

	function BambiUI:UNIT_PET()
		OmniCDAnchor()
	end

	function BambiUI:ADDON_LOADED(arg1)
		 OmniCDKey(arg1)
	end

	function BambiUI:PLAYER_ENTERING_WORLD()
		 ReSizeRaidFrames()
		 MoveFrameRate()
		 UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end

	function BambiUI:ARENA_OPPONENT_UPDATE()
		ArenaHide()
	end

	BambiUI:RegisterEvent("ADDON_LOADED")
	BambiUI:RegisterEvent("GROUP_ROSTER_UPDATE")
	BambiUI:RegisterEvent("PLAYER_ENTERING_WORLD")
	BambiUI:RegisterEvent("UNIT_PET")
	BambiUI:RegisterEvent("ARENA_OPPONENT_UPDATE")
	BambiUI:SetScript("OnEvent",function(self,event,...) if self[event] then self[event](self,...) end end)
