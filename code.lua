--On GitHUb
local BottomBar = CreateFrame("Frame", nil, UIParent)
BottomBar:SetSize(2500, 20)
BottomBar:SetPoint("CENTER", 0, -590)
BottomBar.texture = BottomBar:CreateTexture(nil, "BACKGROUND")
BottomBar.texture:SetAllPoints(true)
BottomBar.texture:SetColorTexture(0.0, 0.0, 0.0, 1)
BottomBar:SetFrameStrata("BACKGROUND")

local Anchors = CreateFrame("Frame", "PlayerAnchor", UIParent)
Anchors:SetSize(48, 48)
Anchors:SetPoint("CENTER", 53.5, -22.5)
Anchors.texture = Anchors:CreateTexture(nil, "BACKGROUND")
Anchors.texture:SetAllPoints(true)
Anchors.texture:SetColorTexture(1.0, 1.0, 1.0, 0)

local Anchors = CreateFrame("Frame", "Party1Anchor", CompactRaidFrameContainer)
Anchors:SetSize(64, 64)
Anchors:SetPoint("TOPLEFT", -65, -2)
Anchors.texture = Anchors:CreateTexture(nil, "BACKGROUND")
Anchors.texture:SetAllPoints(true)
Anchors.texture:SetColorTexture(1.0, 1.0, 1.0, 0)

local Anchors = CreateFrame("Frame", "Party2Anchor", CompactRaidFrameContainer)
Anchors:SetSize(64, 64)
Anchors:SetPoint("TOPLEFT", -65., -77)
Anchors.texture = Anchors:CreateTexture(nil, "BACKGROUND")
Anchors.texture:SetAllPoints(true)
Anchors.texture:SetColorTexture(1.0, 1.0, 1.0, 0)

local Anchors = CreateFrame("Frame", "Party3Anchor", CompactRaidFrameContainer)
Anchors:SetSize(64, 64)
Anchors:SetPoint("TOPLEFT", -65, -152)
Anchors.texture = Anchors:CreateTexture(nil, "BACKGROUND")
Anchors.texture:SetAllPoints(true)
Anchors.texture:SetColorTexture(1.0, 1.0, 1.0, 0)

local Anchors = CreateFrame("Frame", "Party4Anchor", CompactRaidFrameContainer)
Anchors:SetSize(64, 64)
Anchors:SetPoint("TOPLEFT", -65, -227)
Anchors.texture = Anchors:CreateTexture(nil, "BACKGROUND")
Anchors.texture:SetAllPoints(true)
Anchors.texture:SetColorTexture(1.0, 1.0, 1.0, 0)

local Anchors = CreateFrame("Frame", "Party5Anchor", CompactRaidFrameContainer)
Anchors:SetSize(64, 64)
Anchors:SetPoint("TOPLEFT", -65, -302)
Anchors.texture = Anchors:CreateTexture(nil, "BACKGROUND")
Anchors.texture:SetAllPoints(true)
Anchors.texture:SetColorTexture(1.0, 1.0, 1.0, 0)

FramerateLabel:ClearAllPoints()
FramerateLabel:SetPoint("RIGHT",UIParent,"CENTER", 0, -225)
FramerateLabel.SetPoint = function()
end

local PF = CreateFrame("Frame","PF",CompactRaidFrameContainer)
hooksecurefunc("CompactRaidFrameContainer_SetFlowSortFunction", function(_,_)
		PF:UpdateBars()
end)

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
end

function PF:GROUP_ROSTER_UPDATE()
	PF:UpdateBars()
end

local function PF_OnLoad(self)
	self:RegisterEvent("GROUP_ROSTER_UPDATE")
	self:SetScript("OnEvent",function(self,event,...) if self[event] then self[event](self,...) end end)
	PF:UpdateBars()
	self:SetScript("OnUpdate",PF_OnUpdate)
end

PF:RegisterEvent("VARIABLES_LOADED")
PF:RegisterEvent("PLAYER_ENTERING_WORLD")
PF:SetScript("OnEvent",PF_OnLoad)
