local Ctimer = C_Timer.After
local strmatch = string.match
--------------------------------------------------------------------------------------------------------------------------------
--Scripts and Macro
--------------------------------------------------------------------------------------------------------------------------------
		local sizeStandard = 1.04
		local sizeRaid =.65

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
			SetCVar("nameplateOtherTopInset", 0.06)
			SetCVar("nameplateLargeTopInset", 0.06)
			SetCVar("nameplateMotionSpeed", 0.025)
			SetCVar("nameplateOtherBottomInset", 0.15)
			SetCVar("nameplateOverlapH", 0.6)
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
			SetCVar("lossOfControlInterrupt", 2)
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

		local function MoveParty()
			if InCombatLockdown() then
				print("InCombatLockdown: MoveParty (Standard)")
				return
			else
				local f,s=PartyFrame,EditModeManagerFrame
				f:SetScale(sizeStandard);
				f:ClearAllPoints()
				f:SetPoint("TOPLEFT", UIParent,"TOPRIGHT",-719,-485)
				s:OnSystemPositionChange(f)
				s:SaveLayoutChanges()
				--2, +14 offset from raid
				--Would be nice to ENABLE pets here
				print("PartyFrames Position (Standard)")
			end
		end
		BambiUI_MoveParty = CreateFrame('CheckButton', 'BambiUI_MoveParty', BambiUI_MoveParty, 'UICheckButtonTemplate')
		BambiUI_MoveParty:SetScript('OnClick', function() MoveParty()	end)

		local function MoveRaidUpperRight()
		if InCombatLockdown() then
			print("InCombatLockdown: MoveRaid (Standard)")
			return
		else
			local f,s=CompactRaidFrameContainer,EditModeManagerFrame;
			f:SetScale(sizeStandard);
			f:ClearAllPoints();
			f:SetPoint("TOPLEFT",UIParent,"TOPRIGHT",-717,-499);
			s:OnSystemPositionChange(f);
			s:SaveLayoutChanges();
			CompactRaidFrameContainer:SetClampedToScreen(false)
			print("RaidFrames Position (Standard)")
				--Would be nice to ENABLE pets here
			end
		end
		BambiUI_MoveRaidUpperRight = CreateFrame('CheckButton', 'BambiUI_MoveRaidUpperRight', BambiUI_MoveRaidUpperRight, 'UICheckButtonTemplate')
		BambiUI_MoveRaidUpperRight:SetScript('OnClick', function() MoveRaidUpperRight()	end)

		local function MoveRaidCenter()
			if InCombatLockdown() then
				print("InCombatLockdown: MoveRaid (Standard)")
				return
			else
				local f,s=CompactRaidFrameContainer,EditModeManagerFrame;
				f:SetScale(sizeRaid);
				f:ClearAllPoints();
				f:SetPoint("CENTER",UIParent,"CENTER",0,-355);
				s:OnSystemPositionChange(f);
				s:SaveLayoutChanges();
				print("RaidFrames Position (Center)")
					--Would be nice to DISABLE pets here
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
		--Sort Party Group
		--------------------------------------------------------------------------------------------------------------------------------

		local function SortParty() --SortBottomDescending
			local inInstance, instanceType = IsInInstance()
    	if (IsInGroup() and GetNumGroupMembers() <= 5 and HasLoadedCUFProfiles() and not InCombatLockdown()) then --and not IsInRaid()
				for i = 1, 5 do
					local compactRaidFrame = _G["CompactPartyFrameMember"..i]
					if (compactRaidFrame ~= nil) then
						if strmatch(compactRaidFrame.unit, "party") or (strmatch(compactRaidFrame.unit, "raid") and instanceType =="arena") then
						  local CRFSort_Bottom = function(t1, t2)
								if not UnitExists(t1) then
										return false;
								elseif not UnitExists(t2) then
										return true
								elseif UnitIsUnit(t1, 'player') then
										return false;
								elseif UnitIsUnit(t2, 'player') then
										return true;
								elseif UnitGroupRolesAssigned(t1) == "TANK" then
										return true;
								elseif UnitGroupRolesAssigned(t2) == "TANK" then
										return false;
								else
										return t1 < t2;
								end
							end
							CompactPartyFrame_SetFlowSortFunction(CRFSort_Bottom)
							print("SortParty Successfull")
							break
						elseif strmatch(compactRaidFrame.unit, "raid") then
							print("Using Raid Frames: SortParty Unsuccessfull")
							break
						end
					end
				end
			elseif IsInRaid() and InCombatLockdown() then
				print("IsInRaid & InCombatLockdown: SortParty")
			elseif IsInRaid() then
				print("IsInRaid: SortParty")
			elseif InCombatLockdown() then
			 	print("InCombatLockdown: SortParty")
			end
			if CompactPartyFrameTitle then
			 CompactPartyFrameTitle:SetAlpha(0);
			end
		end
		BambiUI_sortParty = CreateFrame('CheckButton', 'BambiUI_sortParty', BambiUI_sortParty, 'UICheckButtonTemplate');
		BambiUI_sortParty:SetScript('OnClick', function()	SortParty()	end);

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

	--/run ArenaEnemyFrame1:Hide()
	--/run ArenaEnemyFrame2:Hide()
	--/run ArenaEnemyFrame3:Hide()

--------------------------------------------------------------------------------------------------------------------------------
--Move Frame rate
--------------------------------------------------------------------------------------------------------------------------------
	local function MoveFrameRate()
		FramerateLabel:ClearAllPoints()
		FramerateLabel:SetPoint("RIGHT",UIParent,"CENTER", 0, -220)
		FramerateText:ClearAllPoints()
		FramerateText:SetPoint("LEFT",FramerateLabel,"RIGHT")
	end

	FramerateText:HookScript("OnShow", function(self)
		FramerateLabel:ClearAllPoints()
		FramerateLabel:SetPoint("RIGHT",UIParent,"CENTER", 0, -220)
		FramerateText:ClearAllPoints()
		FramerateText:SetPoint("LEFT",FramerateLabel,"RIGHT")
	end)
--------------------------------------------------------------------------------------------------------------------------------
--Move Frame rate
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
--Blizzard SPell Alert sizeScale
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
				if spellID == 114255 then --Widen Surge f Light Procs
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
		if spellID == 114255 then --Sacle Surge of Light
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
		if UnitIsUnit(compactRaidFrame.unit, "party1") then icon = 1 end
		if UnitIsUnit(compactRaidFrame.unit, "party2") then icon = 2 end
		if UnitIsUnit(compactRaidFrame.unit, "party3") then icon = 3 end
		if UnitIsUnit(compactRaidFrame.unit, "party4") then icon = 4 end
		if UnitIsUnit(compactRaidFrame.unit, "player") then icon = 5 end
		if icon ~= nil then
			icon = AnchorFrames[icon]
			icon:SetParent(compactRaidFrame:GetParent()) --if you set to compactRaidFrame will inherit the alpha
			icon:ClearAllPoints()
			icon:SetPoint("BOTTOMRIGHT",	compactRaidFrame, "BOTTOMLEFT", Xset, Yset)
			icon:SetFrameStrata("MEDIUM")
		end
	end

	local function UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
		if CompactRaidFrameManager.container.groupMode == "flush" then
			for i = 1, 80 do
				local compactRaidFrame = _G["CompactRaidFrame"..i]
				if compactRaidFrame and compactRaidFrame.unit then
					SetCompactAnchor(compactRaidFrame)
				end
			end
		elseif CompactRaidFrameManager.container.groupMode == "discrete" then
			for i = 1, 8 do
				for j = 1, 5 do
					local compactRaidFrame = _G["CompactRaidGroup"..i.."Member"..j]
					if compactRaidFrame and compactRaidFrame.unit then
						SetCompactAnchor(compactRaidFrame)
					end
				end
			end
		end
		if EditModeManagerFrame:UseRaidStylePartyFrames() then
			for i = 1, 5 do
				local compactRaidFrame = _G["CompactPartyFrameMember"..i]
				if (compactRaidFrame ~= nil) then
					if compactRaidFrame and compactRaidFrame.unit then
						SetCompactAnchor(compactRaidFrame)
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
	local alphaOmni = 0
	local yPadding = -2

	local OmniCD1 = CreateFrame("Frame", "OmniCD1", UIParent)
	OmniCD1:ClearAllPoints()
	OmniCD1:SetSize(iconSize, iconSize)
	OmniCD1.texture = OmniCD1:CreateTexture(nil, "BACKGROUND")
	OmniCD1.texture:SetAllPoints(true)
	OmniCD1.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCD1.yourUnitKey = "party1"

	local OmniCD2 = CreateFrame("Frame", "OmniCD2", UIParent)
	OmniCD2:ClearAllPoints()
	OmniCD2:SetSize(iconSize, iconSize)
	OmniCD2.texture = OmniCD2:CreateTexture(nil, "BACKGROUND")
	OmniCD2.texture:SetAllPoints(true)
	OmniCD2.texture:SetColorTexture(1.0, 1.0, 1.0, alphaOmni)
	OmniCD2:SetPoint("TOP", OmniCD1, "BOTTOM", 0, yPadding)
	OmniCD2.yourUnitKey = "party2"

	local x = 1
	local y = 0

	local function OmniCDAnchor()
		if EditModeManagerFrame:UseRaidStylePartyFrames() then
			for i = 1, 8 do
				local compactRaidFrame = _G["CompactPartyFrameMember"..i] --Probably will Need to Add a Pet Function Later
				if (compactRaidFrame ~= nil) then
					if UnitExists(compactRaidFrame.unit) then
				  	OmniCD1:SetPoint("TOPLEFT", compactRaidFrame, "BOTTOMLEFT", 1, yPadding)
					end
				end
			end
		end
	end

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

	EditModeManagerFrame:HookScript("OnHide", function() Ctimer(.001, function() OmniCDAnchor() UpdateAndHookAllRaidIconsAnchorCompactRaidFrame() end) end)

	hooksecurefunc(EditModeManagerFrame, "UpdateRaidContainerFlow", function(groupMode)
		print("EditModeManagerFrame: UpdateRaidContainerFlow")
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetGroupMode", function(groupMode)
		print("SetGroupMode")
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetFlowFilterFunction", function(flowFilterFunc)
		print("SetFlowFilterFunction")
	  OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetGroupFilterFunction", function(groupFilterFunc)
		print("SetGroupFilterFunction")
	  OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc(CompactRaidFrameContainer, "SetFlowSortFunction", function(flowSortFunc)
		print("SetFlowSortFunction")
		OmniCDAnchor()
		UpdateAndHookAllRaidIconsAnchorCompactRaidFrame()
	end)

	hooksecurefunc("CompactPartyFrame_SetFlowSortFunction", function()
		print("CompactPartyFrame_SetFlowSortFunction")
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
	end

	BambiUI:RegisterEvent("ADDON_LOADED")
	BambiUI:RegisterEvent("GROUP_ROSTER_UPDATE")
	BambiUI:RegisterEvent("PLAYER_ENTERING_WORLD")
	BambiUI:RegisterEvent("UNIT_PET")
	BambiUI:SetScript("OnEvent",function(self,event,...) if self[event] then self[event](self,...) end end)
