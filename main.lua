
lockedAddOn = {};
local mod = lockedAddOn;

mod.dungeonNames = {
    "De Other Side",
    "Halls of Atonement",
    "Mists of Tirna Scithe",
    "Plaguefall",
    "Sanguine Depths",
    "Spires of Ascension",
    "The Necrotic Wake",
    "Theater of Pain"
}

mod.frame = CreateFrame("Frame", "MYFRAME", CharacterFrame)
mod.frame:SetFrameStrata("BACKGROUND")
mod.frame:SetWidth(1)
mod.frame:SetHeight(1)
mod.frame:SetPoint("TOPLEFT", CharacterFrame, "TOPRIGHT")

mod.frame:SetScript("OnShow",
    function(self, event)
        for i, val in pairs(mod.dungeonNames) do
            local name, locked, isFound
            for ii=1, GetNumSavedInstances() do
                name, _, _, _, locked = GetSavedInstanceInfo(ii)
                if val == name then
                    isFound = true
                    break
                end
            end
            
            local s = mod.frame:CreateFontString()
            s:SetFontObject(GameFontNormalLarge)
            s:SetPoint("TOPLEFT", 10, 10 -  i*20)
            s:SetText('|cffffff00' .. val .. '|r   |cffff0000' .. (isFound and locked and 'locked' or '') .. '|r')
        end
    end
)
