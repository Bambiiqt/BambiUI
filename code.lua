--------------------------------------------------------------------------------------------------------------------------------
--Scripts and Macro
--------------------------------------------------------------------------------------------------------------------------------

	CompactRaidFrameContainer:SetClampedToScreen(false) --Allows RaidFrame to Move OffScreen

	if CompactPartyFrameTitle then --Hides Party on PartyFrame
		CompactPartyFrameTitle:SetAlpha(0)
	end

		local function getName(funct) --Returns a functions name
			for i,v in pairs(getfenv()) do
				if v == funct then
					return i
				end
			end
		end

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
			SetCVar("nameplateOverlapH", 0.7)
			SetCVar("nameplateOverlapV", 0.6)
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
				print("InCombatLockdown: MoveParty")
				return
			else
				local f,s=PartyFrame,EditModeManagerFrame
				f:SetScale(1);f:ClearAllPoints()
				f:SetPoint("TOPLEFT", UIParent,"TOPRIGHT",-719,-485)
				s:OnSystemPositionChange(f)
				s:SaveLayoutChanges()
				--2, +14 offset from raid
				--Would be nice to ENABLE pets here
				print("PartyFrmes (Standard)")
			end
		end
		BambiUI_MoveParty = CreateFrame('CheckButton', 'BambiUI_MoveParty', BambiUI_MoveParty, 'UICheckButtonTemplate')
		BambiUI_MoveParty:SetScript('OnClick', function() MoveParty()	end)

		local function MoveRaidUpperRight()
			if InCombatLockdown() then
				print("InCombatLockdown: MoveRaidUpperRight")
				return
			else
				local f,s=CompactRaidFrameContainer,EditModeManagerFrame;
				f:SetScale(1);
				f:ClearAllPoints();
				f:SetPoint("TOPLEFT",UIParent,"TOPRIGHT",-717,-499);
				s:OnSystemPositionChange(f);
				s:SaveLayoutChanges();
				CompactRaidFrameContainer:SetClampedToScreen(false)
				print("RaidFrames (Standard)")
					--Would be nice to ENABLE pets here
				end
		end
		BambiUI_MoveRaidUpperRight = CreateFrame('CheckButton', 'BambiUI_MoveRaidUpperRight', BambiUI_MoveRaidUpperRight, 'UICheckButtonTemplate')
		BambiUI_MoveRaidUpperRight:SetScript('OnClick', function() MoveRaidUpperRight()	end)

		local function MoveRaidCenter()
			if InCombatLockdown() then
				print("InCombatLockdown: MoveRaidCenter")
				return
			else
				local f,s=CompactRaidFrameContainer,EditModeManagerFrame;
				f:SetScale(.65);
				f:ClearAllPoints();
				f:SetPoint("CENTER",UIParent,"CENTER",0,-355);
				s:OnSystemPositionChange(f);
				s:SaveLayoutChanges();
				print("RaidFrames (Center)")
					--Would be nice to DISABLE pets here
		 end
 		end
		BambiUI_MoveRaidCenter = CreateFrame('CheckButton', 'BambiUI_MoveRaidCenter', BambiUI_MoveRaidCenter, 'UICheckButtonTemplate')
		BambiUI_MoveRaidCenter:SetScript('OnClick', function() MoveRaidCenter()	end)

		local function ScaleFrames()
			if InCombatLockdown() then
				print("InCombatLockdown: ScaleFrames")
				return
			else
				local size =.65
				CompactRaidFrameContainer:SetScale(size)
				PartyFrame:SetScale(size)
				print("FramesScaled ("..size..")")
		 end
		end
		BambiUI_ScaleFrames = CreateFrame('CheckButton', 'BambiUI_ScaleFrames', BambiUI_ScaleFrames, 'UICheckButtonTemplate')
		BambiUI_ScaleFrames:SetScript('OnClick', function() ScaleFrames()	end)

		--------------------------------------------------------------------------------------------------------------------------------
		--Sort Raid Group
		--------------------------------------------------------------------------------------------------------------------------------

--[[hooksecurefunc("CompactRaidFrameManager_ToggleGroupFilter", function(group)
			print(group)
		end)

		hooksecurefunc(CompactRaidFrameContainer, "SetFlowSortFunction", function(flowSortFunc)
			print(getName(flowSortFunc))
		end)

		hooksecurefunc(CompactRaidFrameContainer, "AddPlayers", function(self)
			print(getName(self.flowSortFunc))
		end)]]

		--------------------------------------------------------------------------------------------------------------------------------
		--Sort Party Group
		--------------------------------------------------------------------------------------------------------------------------------

		local function SortParty() --SortBottomDescending
			local inInstance, instanceType = IsInInstance()
	    if (IsInGroup() and GetNumGroupMembers() <= 5 and HasLoadedCUFProfiles() and not InCombatLockdown()) then --and not IsInRaid()
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
			RunScripts()
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
--Raid Frame Options for Slider (Scale Larger)
--------------------------------------------------------------------------------------------------------------------------------

	EditModeSettingDisplayInfoManager.systemSettingDisplayInfo[Enum.EditModeSystem.UnitFrame][8].minValue = 150
	EditModeSettingDisplayInfoManager.systemSettingDisplayInfo[Enum.EditModeSystem.UnitFrame][8].maxValue = 150.5
	EditModeSettingDisplayInfoManager.systemSettingDisplayInfo[Enum.EditModeSystem.UnitFrame][9].minValue = 75
	EditModeSettingDisplayInfoManager.systemSettingDisplayInfo[Enum.EditModeSystem.UnitFrame][9].maxValue = 75.5
	EditModeSettingDisplayInfoManager.systemSettingDisplayInfo[Enum.EditModeSystem.UnitFrame][8].stepValue = .5
	EditModeSettingDisplayInfoManager.systemSettingDisplayInfo[Enum.EditModeSystem.UnitFrame][9].stepValue = .5
	EditModeSettingDisplayInfoManager.systemSettingDisplayInfo[Enum.EditModeSystem.UnitFrame][8].hideValue = false
	EditModeSettingDisplayInfoManager.systemSettingDisplayInfo[Enum.EditModeSystem.UnitFrame][9].hideValue = false

--------------------------------------------------------------------------------------------------------------------------------
--Move Frame rate
--------------------------------------------------------------------------------------------------------------------------------

	FramerateLabel:ClearAllPoints()
	FramerateLabel:SetPoint("RIGHT",UIParent,"CENTER", 0, -220)
	FramerateLabel.SetPoint = function() end

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
--[[
local AnchorFrames = {}
local hieght = {-2, -77, -152, -227, -302}

hooksecurefunc("CompactRaidFrameContainer_SetFlowSortFunction", function(_,_)
		PF:UpdateBars()
end)

for i = 1, 5 do
	local frameName = "PartyAnchor" .. i
	local Anchors = CreateFrame("Frame", frameName, UIParent)
	if i == 5 then
		Anchors:SetPoint("CENTER", 53.5, -22.5)
		Anchors:SetSize(48, 48)
	else
		Anchors:SetParent(CompactRaidFrameContainer)
		Anchors:SetPoint("TOPLEFT", -65, hieght[i])
		Anchors:SetSize(64, 64)
	end

	-- this is needed for the addon to identify your frame-to-unit association
--	Anchors.yourUnitKey = i == 5 and "player" or "party" .. i
	Anchors.texture = Anchors:CreateTexture(nil, "BACKGROUND")
	Anchors.texture:SetAllPoints(true)
	--Anchors.texture:SetColorTexture(1.0, 1.0, 1.0, 0)

	AnchorFrames[i] = Anchors
end


function PF:UpdateBars()
  --  print (GetNumGroupMembers())
				if (GetNumGroupMembers() == 0) then
				PF:ClearAllPoints()
				PF:SetSize(64, 64)
				PF:SetPoint("TOPLEFT", -65, -2)
				PF.texture = PF:CreateTexture(nil, "BACKGROUND")
				PF.texture:SetAllPoints(true)
				PF.texture:SetColorTexture(1.0, 1.0, 1.0, 0)
			  end
				  if (GetNumGroupMembers() == 2) then
				PF:ClearAllPoints()
				PF:SetSize(64, 64)
				PF:SetPoint("TOPLEFT", -65., -77)
				PF.texture = PF:CreateTexture(nil, "BACKGROUND")
				PF.texture:SetAllPoints(true)
				PF.texture:SetColorTexture(1.0, 1.0, 1.0, 0)
			  end
			  if (GetNumGroupMembers() == 3) then
				PF:ClearAllPoints()
				PF:SetSize(64, 64)
				PF:SetPoint("TOPLEFT", -65, -152)
				PF.texture = PF:CreateTexture(nil, "BACKGROUND")
				PF.texture:SetAllPoints(true)
				PF.texture:SetColorTexture(1.0, 1.0, 1.0, 0)
			  end
			  if (GetNumGroupMembers() == 4) then
				PF:ClearAllPoints()
				PF:SetSize(64, 64)
				PF:SetPoint("TOPLEFT", -65, -227)
				PF.texture = PF:CreateTexture(nil, "BACKGROUND")
				PF.texture:SetAllPoints(true)
				PF.texture:SetColorTexture(1.0, 1.0, 1.0, 0)
			  end
			  if (GetNumGroupMembers() == 5) then
				PF:ClearAllPoints()
				PF:SetSize(64, 64)
				PF:SetPoint("TOPLEFT", -65, -302)
				PF.texture = PF:CreateTexture(nil, "BACKGROUND")
				PF.texture:SetAllPoints(true)
				PF.texture:SetColorTexture(1.0, 1.0, 1.0, 0)
			  end
			  if (GetNumGroupMembers() > 5) then
				PF:ClearAllPoints()
				PF:SetSize(64, 64)
				PF:SetPoint("TOPLEFT", -65, -302)
				PF.texture = PF:CreateTexture(nil, "BACKGROUND")
				PF.texture:SetAllPoints(true)
				PF.texture:SetColorTexture(1.0, 1.0, 1.0, 0)
			  end

				if InCombatLockdown() then
				else
		  	end
end
]]
--------------------------------------------------------------------------------------------------------------------------------
--OmniCD Anchors
--------------------------------------------------------------------------------------------------------------------------------
--[[

local OmniCD1 = CreateFrame("Frame","OmniCD1",CompactRaidFrameContainer)
hooksecurefunc("CompactRaidFrameContainer_SetFlowSortFunction", function(_,_)
		PF:OmniCD1()
end)
local OmniCD2 = CreateFrame("Frame","OmniCD2",CompactRaidFrameContainer)
hooksecurefunc("CompactRaidFrameContainer_SetFlowSortFunction", function(_,_)
		PF:OmniCD2()
end)

local x = 1
local y = 0
function PF:OmniCD1()
		    OmniCD1:ClearAllPoints()
				OmniCD1:SetSize(64, 64)
				OmniCD1.texture = OmniCD1:CreateTexture(nil, "BACKGROUND")
				OmniCD1.texture:SetAllPoints(true)
				OmniCD1.texture:SetColorTexture(1.0, 1.0, 1.0, 0)
				if (GetNumGroupMembers() == 0) then
				OmniCD1:SetPoint("TOPLEFT", -67, -77 - x )
			  end
			  if UnitExists("party1") and not UnitExists("party2") then
				OmniCD1:SetPoint("TOPLEFT", -67., -152 - x)
			  end
			  if UnitExists("party1") and UnitExists("party2") then
				OmniCD1:SetPoint("TOPLEFT", -67, -227 - x)
			  end
			  if (UnitExists("partypet1") or UnitExists("partypet2")) and UnitExists("party1") and not UnitExists("party2") then --Party one w/ one pet
				OmniCD1:SetPoint("TOPLEFT", -67, -152 - 37.5 - x)
			  end
				if (UnitExists("partypet1") and UnitExists("partypet2")) and UnitExists("party1") and not UnitExists("party2") then --Party one w/ two pets
				OmniCD1:SetPoint("TOPLEFT", -67, -152 - 37.5 - 37.5 - x)
				end
			  if (UnitExists("partypet1") or UnitExists("partypet2")) and UnitExists("party1") and UnitExists("party2") then --Party one & Party two  w/ one pet
				OmniCD1:SetPoint("TOPLEFT", -67, -227 - 37.5 - x)
			  end
				if (UnitExists("partypet1") and UnitExists("partypet2")) and UnitExists("party1") and UnitExists("party2") then --Party one & Party two  w/ one pet
				OmniCD1:SetPoint("TOPLEFT", -67, -227 - 37.5 - 37.5 - x)
			  end
				OmniCD1.yourUnitKey = "party1"
				AnchorFrames[1] = OmniCD1
end
function PF:OmniCD2()
		    OmniCD2:ClearAllPoints()
				OmniCD2:SetSize(64, 64)
				OmniCD2.texture = OmniCD2:CreateTexture(nil, "BACKGROUND")
				OmniCD2.texture:SetAllPoints(true)
				OmniCD2.texture:SetColorTexture(1.0, 1.0, 1.0, 0)
				if (GetNumGroupMembers() == 0) then
				OmniCD2:SetPoint("TOPLEFT", -67, -77 - 31.5 - y)
			  end
			  if not UnitExists("party1") and UnitExists("party2") then
				OmniCD2:SetPoint("TOPLEFT", -67., -152 - 31.5 - y)
			  end
			  if UnitExists("party1") and UnitExists("party2") then
				OmniCD2:SetPoint("TOPLEFT", -67, -227 - 31.5 - y)
			  end
			  if UnitExists("partypet1") or UnitExists("partypet2") and UnitExists("party1") and UnitExists("party2") then
				OmniCD2:SetPoint("TOPLEFT", -67, -227 - 37.5 - 31.5 - y)
			  end
				if UnitExists("partypet1") and UnitExists("partypet2") and UnitExists("party1") and UnitExists("party2") then
				OmniCD2:SetPoint("TOPLEFT", -67, -227 - 37.5 - 37.5 - 31.5 - y)
			  end
				OmniCD2.yourUnitKey = "party2"
				AnchorFrames[2] = OmniCD2
end


function PF:GROUP_ROSTER_UPDATE()
	PF:UpdateBars()
	PF:OmniCD1()
	PF:OmniCD2()
end

function PF:UNIT_PET()
	PF:OmniCD1()
	PF:OmniCD2()
end

function PF:ADDON_LOADED(arg1)
	if arg1 == "BambiUI" or arg1 == "OmniCD" then
		if OmniCD then
			OmniCD.AddUnitFrameData("BambiUI", "OmniCD", "yourUnitKey", 1)
		end
	end
	C_Timer.After(8, function()	-- delay checking to make sure all variables of the other addons are loaded
		self:ADDON_LOADED()
	end)
end

PF:RegisterEvent("ADDON_LOADED")
PF:RegisterEvent("GROUP_ROSTER_UPDATE")
PF:RegisterEvent("PLAYER_ENTERING_WORLD")
PF:RegisterEvent("UNIT_PET")
PF:SetScript("OnEvent",function(self,event,...) if self[event] then self[event](self,...) end end)]]
