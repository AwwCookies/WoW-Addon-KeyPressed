-- is addon is enabled
local enabled = true

-- https://www.wowhead.com/icon=450908/misc-arrowright
local iconTexture = "450908"

local KeyPressedFrame = CreateFrame("Frame", "KeyPressedFrame", UIParent)
KeyPressedFrame:SetSize(32, 32)
KeyPressedFrame:ClearAllPoints()
KeyPressedFrame:SetPoint("CENTER")
KeyPressedFrame:Show()


local shift = KeyPressedFrame:CreateTexture()
shift:SetSize(32, 32)
shift:SetTexture(iconTexture)
shift:SetPoint("BOTTOMRIGHT", MainMenuBar.EndCaps, "BOTTOMLEFT", -5, 112)
shift:Hide()

local ctrl = KeyPressedFrame:CreateTexture()
ctrl:SetSize(32, 32)
ctrl:SetTexture(iconTexture)
ctrl:SetPoint("BOTTOMRIGHT", MainMenuBar.EndCaps, "BOTTOMLEFT", -5, 64)
ctrl:Hide()

local alt = KeyPressedFrame:CreateTexture()
alt:SetSize(32, 32)
alt:SetTexture(iconTexture)
alt:SetPoint("BOTTOMRIGHT", MainMenuBar.EndCaps, "BOTTOMLEFT", -5, 160)
alt:Hide()

-- Hide all arrows
local function hideArrows ()
    shift:Hide()
    ctrl:Hide()
    alt:Hide()
end


-- hook onto update function
KeyPressedFrame:SetScript("OnUpdate", function()
    if (enabled and IsModifierKeyDown()) then
        hideArrows()
        if (IsControlKeyDown()) then
            ctrl:Show()
        end
        if(IsShiftKeyDown()) then
            shift:Show()
        end
        if(IsAltKeyDown()) then
            alt:Show()
        end
    else
        hideArrows()
    end
end)

-- Register slash commands

-- /kpenable true
-- /kpenable false

SLASH_KPENABLE1= "/kpenable"
SlashCmdList["KPENABLE"] = function(msg)
   if (msg == "on") then
    enabled = true
   elseif (msg == "off") then
    enabled = false
   end
   print("KeyPressed enabled: ", enabled)
end