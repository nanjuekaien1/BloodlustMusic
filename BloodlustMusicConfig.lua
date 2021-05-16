BloodlustMusic = { };


local function PanelCreation()
	print("Inside PanelCreation")
    local BloodlustTitle = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    BloodlustTitle:SetPoint("TOPLEFT", 16, -16)
    BloodlustTitle:SetText("Bloodlust Music")

    local BloodlustSubtitle = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    BloodlustSubtitle:SetPoint("TOPLEFT", BloodlustTitle, "RIGHT", 5, 3)
    --BloodlustSubtitle:SetNonSpaceWrap(true)
    --BloodlustSubtitle:SetJustifyH("LEFT")
    --BloodlustSubtitle:SetJustifyV("TOP")
    BloodlustSubtitle:SetText("Version 0.2 (alpha)")

	local BloodlustDescription = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustDescription:SetPoint("TOPLEFT", BloodlustTitle, "BOTTOMLEFT", 0, -8)
	--BloodlustDescription:SetWordWrap(true)
	BloodlustDescription:SetWidth(600)
	BloodlustDescription:SetJustifyH("LEFT")
	BloodlustDescription:SetText("A stupid Addon to play music during Hero, Bloodlust, Primal Rage, etc. You can change a couple of settings below to your liking. Some barebones information is provided next to the corresponding option. For a more in depth explanation, please refer to the description of the addon at: https://addons.wago.io/addons/bloodlustmusic-wip . Thanks and enjoy!")


	local PrintButton = CreateFrame("Button","PrintButton", BloodlustMusic.panel,"UIPanelButtonTemplate")
	PrintButton:SetWidth(128)
	PrintButton:SetPoint("BOTTOMRIGHT",-10,10)
	PrintButton.text = _G["PrintButton".."Text"]
	PrintButton:SetText("Test Print")
	PrintButton:SetScript("OnClick", function(self, arg1)
		print("Print Button is pressed");
		--print(BloodlustMusicSongEnabledTable[1])
		--print(BloodlustMusicSongEnabledTable[2])
	--	print(BloodlustMusicSongEnabledTable[3])
		--print(table.getn(BloodlustMusicSongEnabledTable))
		if (tonumber(GetCVar("Sound_EnableAllSound")) == 0) then
			print("Muted")
		else
			print("Not Muted")
		end
		print("All sounds: " .. GetCVar("Sound_EnableAllSound"))
		print("Ambience: " .. GetCVar("Sound_EnableAmbience"))
		print("Dialog: " .. GetCVar("Sound_EnableDialog"))
		print("Music: " .. GetCVar("Sound_EnableMusic"))
		print("SFX: " .. GetCVar("Sound_EnableSFX"))
		print("Current volume level = " .. tonumber(GetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber])))
		print("Volume during Hero should be: " .. math.floor(BloodlustChannelVolume*100) .. "%")
		print("Normal Volume level should be: " .. math.floor(BloodlustVolumecache*100) .. "%")
		--print("BloodlustMusic.isSongPlaying  = " .. tostring(BloodlustMusic.isSongPlaying))
		--print("currentSongSpellID = " .. tostring(currentSongSpellID))
	end)

	local BloodlustSliderDescription = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSliderDescription:SetPoint("LEFT", 16, 50)
	--BloodlustDropdownDescription:SetWordWrap(true)
	BloodlustSliderDescription:SetWidth(600)
	BloodlustSliderDescription:SetJustifyH("LEFT")
	BloodlustSliderDescription:SetText("Use the Slider menu below to set how loud the music during Hero should be. Don't want the volume raised? Enter a number lower or equal to your current volume for your soundchannel. You can view this under Main menu -> System -> Sound.")


	local BloodlustSlider = CreateFrame("Slider", "BloodlustSliderGlobalName", BloodlustMusic.panel, "OptionsSliderTemplate")
	BloodlustSlider:SetPoint("TOPLEFT", BloodlustSliderDescription, "BOTTOMLEFT", 10, -35)
	BloodlustSlider:SetMinMaxValues(0, 1)
    BloodlustSlider:SetValueStep(0.1)
	BloodlustSlider:SetObeyStepOnDrag(true)
	BloodlustSlider:SetOrientation('HORIZONTAL')
	BloodlustSlider.text = _G[BloodlustSlider:GetName() .. "Text"]
    BloodlustSlider.low = _G[BloodlustSlider:GetName() .. "Low"]
    BloodlustSlider.high = _G[BloodlustSlider:GetName() .. "High"]

    BloodlustSlider.text:SetText(math.floor(BloodlustChannelVolume*100) .. "%")
	BloodlustSlider:SetValue(BloodlustChannelVolume)
    BloodlustSlider.low:SetText("0")
    BloodlustSlider.high:SetText("1")
	BloodlustSlider.tooltipText = "Volume of " .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " soundchannel during Hero"
	BloodlustSlider:SetScript("OnValueChanged", function(self,event,arg1)
		BloodlustChannelVolume = math.floor(BloodlustSlider:GetValue()*100)/100
		BloodlustSlider.text:SetText(math.floor(BloodlustChannelVolume*100) .. "%")

	end)
	print("create slider")
	BloodlustSlider:Show()

	local BloodlustSliderLabel = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    BloodlustSliderLabel:SetPoint("LEFT", BloodlustSlider, "TOPLEFT", -1.5, 20)
    BloodlustSliderLabel:SetNonSpaceWrap(true)
	BloodlustSliderLabel:SetText(BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " volume during Hero")

	local BloodlustDropdownDescription = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustDropdownDescription:SetPoint("TOPLEFT", BloodlustDescription, "BOTTOMLEFT", 0, -30)
	--BloodlustDropdownDescription:SetWordWrap(true)
	BloodlustDropdownDescription:SetWidth(600)
	BloodlustDropdownDescription:SetJustifyH("LEFT")
	BloodlustDropdownDescription:SetText("Use the Dropdown menu below to set what soundchannel you want Hero to play on. Unsure? Dialog is recommended, Master is more fun.")


	-- Create the dropdown, and configure its appearance
	local BloodlustDropdown = CreateFrame("FRAME", "BloodlustDropdown", BloodlustMusic.panel, "UIDropDownMenuTemplate")
	BloodlustDropdown:SetPoint("TOPLEFT", BloodlustDropdownDescription, "BOTTOMLEFT", -10, -20)
	UIDropDownMenu_SetWidth(BloodlustDropdown, 200)
	UIDropDownMenu_SetText(BloodlustDropdown, "Current soundchannel: " .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber])

	-- Create and bind the initialization function to the dropdown menu
	UIDropDownMenu_Initialize(BloodlustDropdown, function(self, level, menuList)
		local info = UIDropDownMenu_CreateInfo()
		if (level or 1) == 1 then
			for a, c in ipairs(BloodlustMusic.soundChannelTable) do
				info.text = BloodlustMusic.soundChannelNames[a]
				info.func = self.SetValue
				info.arg1, info.checked = a, a == BloodlustSoundchannelNumber
				UIDropDownMenu_AddButton(info)
			end
		end
	end)

	--Implement function to change Soundchannel via dropdown menu
	function BloodlustDropdown:SetValue(newValue)
		if(BloodlustMusic.isSongPlaying) then
			print(BloodlustMusic.announcerHeader .. "Changing soundchannel prevented, please do so after hero has ended")
			CloseDropDownMenus()
		else
			BloodlustSoundchannelNumber = newValue
			UIDropDownMenu_SetText(BloodlustDropdown, "Current soundchannel: " .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber])
			print(BloodlustMusic.announcerHeader .. "Soundchannel changed to: " .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber])
			BloodlustVolumecache = tonumber(GetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber]))
			BloodlustSlider.tooltipText = "Volume of " .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " soundchannel during Hero"
			BloodlustSliderLabel:SetText(BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " volume during Hero")
			CloseDropDownMenus()
		end
	end

	local BloodlustDropDownLabel = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    BloodlustDropDownLabel:SetPoint("LEFT", BloodlustDropdown, "TOPLEFT", 20, 7)
    BloodlustDropDownLabel:SetNonSpaceWrap(true)
	BloodlustDropDownLabel:SetText("Sound Channel")

	local BloodlustMaxSoundchannelDescription = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustMaxSoundchannelDescription:SetPoint("TOPLEFT", BloodlustSlider, "BOTTOMLEFT", -10, -20)
	--BloodlustMaxSoundchannelDescription:SetWordWrap(true)
	BloodlustMaxSoundchannelDescription:SetWidth(600)
	BloodlustMaxSoundchannelDescription:SetJustifyH("LEFT")
	BloodlustMaxSoundchannelDescription:SetText("Sometimes the music will cut out if stuff gets too busy. You can try to prevent this by checking the box below. This will make sure WoW can play more sounds at the same time, by upping the number of allowed soundchannels. Afterwards it will put it back to normal levels. Highly recommended to check the addon description for more info.")

	local MaxSoundchannelCheckbox = CreateFrame("CheckButton", "MaxSoundchannelCheckbox", BloodlustMusic.panel, "UICheckButtonTemplate")
	MaxSoundchannelCheckbox:SetPoint("TOPLEFT", BloodlustMaxSoundchannelDescription, "BOTTOMLEFT", -0, -10)
	MaxSoundchannelCheckbox:SetSize(27, 27)
	MaxSoundchannelCheckbox.text:SetFontObject("GameFontNormal")
	MaxSoundchannelCheckbox.text:SetText("Set Max number of soundchannels during Hero to 128?")
	MaxSoundchannelCheckbox.text:SetTextColor(1, 1, 1, 1)
	if (getglobal("MaxSoundchannelCheckbox"):GetChecked() ~= BloodlustMaxSoundchannelBoolean) then
		getglobal("MaxSoundchannelCheckbox"):SetChecked(BloodlustMaxSoundchannelBoolean);
	end
	MaxSoundchannelCheckbox:SetScript("OnClick", function(self,event,arg1)
		if (self:GetChecked()) then
			BloodlustMaxSoundchannelBoolean = true;
		else
			BloodlustMaxSoundchannelBoolean = false;
		end
	end)

	local BloodlustSongListButtonDescription = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSongListButtonDescription:SetPoint("TOPLEFT", MaxSoundchannelCheckbox, "BOTTOMLEFT", 0, -15)
	--BloodlustMaxSoundchannelDescription:SetWordWrap(true)
	BloodlustSongListButtonDescription:SetWidth(600)
	BloodlustSongListButtonDescription:SetJustifyH("LEFT")
	BloodlustSongListButtonDescription:SetText("Want to turn songs on or off? Press the button below to view all songs and click the checkboxes to turn them on or off.")

	local SongListButton = CreateFrame("Button","SongListButton", BloodlustMusic.panel,"UIPanelButtonTemplate")
	SongListButton:SetWidth(128)
	SongListButton:SetPoint("TOPLEFT", BloodlustSongListButtonDescription, "BOTTOMLEFT", 0, -8)
	SongListButton.text = _G["SongListButton".."Text"]
	SongListButton:SetText("Song List")
	SongListButton:SetScript("OnClick", function(self, arg1)
		print("songListButton is pressed");
	 	InterfaceOptionsFrame_OpenToCategory(BloodlustMusic.songpanel);
	end)

	local BloodlustSoundResetDescription = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSoundResetDescription:SetPoint("TOPLEFT", SongListButton, "BOTTOMLEFT", 0, -15)
	--BloodlustMaxSoundchannelDescription:SetWordWrap(true)
	BloodlustSoundResetDescription:SetWidth(600)
	BloodlustSoundResetDescription:SetJustifyH("LEFT")
	BloodlustSoundResetDescription:SetText("Sound not reset properly after Hero? Try setting your in-game volume at Main Menu -> System -> Sound to your preferred normal level, then click the button below.")

	local SoundResetButton = CreateFrame("Button","SoundResetButton", BloodlustMusic.panel,"UIPanelButtonTemplate")
	SoundResetButton:SetWidth(128)
	SoundResetButton:SetPoint("TOPLEFT", BloodlustSoundResetDescription, "BOTTOMLEFT", 0, -8)
	SoundResetButton.text = _G["SoundResetButton".."Text"]
	SoundResetButton:SetText("Sound Reset")
	SoundResetButton:SetScript("OnClick", function(self, arg1)
		print("SoundResetButton is pressed");
		if (BloodlustMusic.isSongPlaying) then
			print(BloodlustMusic.announcerHeader .. "Resetting prevented, please try again after Hero has ended")
		else
		BloodlustSoundchannelscache = GetCVar("Sound_NumChannels")
		BloodlustVolumecache = tonumber(GetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber]))
		print(BloodlustMusic.announcerHeader .. "Regular volume level for "  .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " is now set to: " .. math.floor(BloodlustVolumecache*100) .. "%")
		end
	end)

	--Create Checkbuttons
	for a,c in ipairs(BloodlustMusicSongEnabledTable) do
			if (a < 31) then
				local LeftSongCheckbox = CreateFrame("CheckButton", "SongCheckbox ".. a, BloodlustMusic.songpanel, "UICheckButtonTemplate")
				LeftSongCheckbox:SetPoint("TOPLEFT", BloodlustMusic.songpanel, "TOPLEFT", 5, ((a-1)* -18.6))
				LeftSongCheckbox:SetSize(27, 27)
				LeftSongCheckbox.text:SetFontObject("GameFontNormal")
				LeftSongCheckbox.text:SetText(BloodlustMusic.songNameTable[a])
				LeftSongCheckbox.text:SetTextColor(1, 1, 1, 1)

				if (getglobal("SongCheckbox "..a):GetChecked() ~= BloodlustMusicSongEnabledTable[a]) then
					getglobal("SongCheckbox "..a):SetChecked(BloodlustMusicSongEnabledTable[a]);
				end

				LeftSongCheckbox:SetScript("OnClick", function(self,event,arg1)
					if (self:GetChecked()) then
						BloodlustMusicSongEnabledTable[a] = true;
					else
						BloodlustMusicSongEnabledTable[a] = false;
					end
				end)
			else
				local RightSongCheckbox = CreateFrame("CheckButton", "SongCheckbox ".. a, BloodlustMusic.songpanel, "UICheckButtonTemplate")
				RightSongCheckbox:SetPoint("TOPLEFT", BloodlustMusic.songpanel, "TOPLEFT", 290, ((a-31)* -18.6))
				RightSongCheckbox:SetSize(27, 27)
				RightSongCheckbox.text:SetFontObject("GameFontNormal")
				RightSongCheckbox.text:SetText(BloodlustMusic.songNameTable[a])
				RightSongCheckbox.text:SetTextColor(1, 1, 1, 1)

				if (getglobal("SongCheckbox "..a):GetChecked() ~= BloodlustMusicSongEnabledTable[a]) then
					--print("inside getglobal");
					getglobal("SongCheckbox "..a):SetChecked(BloodlustMusicSongEnabledTable[a]);
				end

				RightSongCheckbox:SetScript("OnClick", function(self,event,arg1)
					if (self:GetChecked()) then
						--print("set to true");
						BloodlustMusicSongEnabledTable[a] = true;
					else
						--print("set to false");
						BloodlustMusicSongEnabledTable[a] = false;
					end
				end)
			end
		end

		local BackButton = CreateFrame("Button","BackButton", BloodlustMusic.songpanel,"UIPanelButtonTemplate") --frameType, frameName, frameParent, frameTemplate
		BackButton:SetWidth(80)
		BackButton:SetPoint("BOTTOMRIGHT",-10,10)
		BackButton.text = _G["BackButton".."Text"]
		BackButton:SetText("Back")
		BackButton:SetScript("OnClick", function(self, arg1)
			print("BackButton is pressed");
			 InterfaceOptionsFrame_OpenToCategory(BloodlustMusic.panel);
		end)

	local TestingButton = CreateFrame("Button","TestingButton", BloodlustMusic.testpanel,"UIPanelButtonTemplate") --frameType, frameName, frameParent, frameTemplate
	TestingButton:SetWidth(80)
	TestingButton:SetPoint("BOTTOMRIGHT",-10,10)
	TestingButton.text = _G["TestingButton".."Text"]
	TestingButton:SetText("Testing")
	TestingButton:SetScript("OnClick", function(self, arg1)
		print("TestingButton is pressed");
	end)

	end


--What to do when Addon loads
    local BloodlustStartingFrame = CreateFrame("FRAME", "BloodlustMusic"); 
    BloodlustStartingFrame:RegisterEvent("ADDON_LOADED");
    local function BloodlustStartingFrame_OnEvent(self, event, ...)
        if (event == "ADDON_LOADED") and (... == "BloodlustMusic") then
            print("Bloodlust Music Ready");
            -- Our saved variables are ready at this point. If a variable is missing, create defaults
            if (not BloodlustMusicSongEnabledTable) then
                BloodlustMusicSongEnabledTable = { };
    
                for a, c in ipairs(BloodlustMusic.songPathTable) do
                    BloodlustMusicSongEnabledTable [a] = true
                end
            end
    
            if (table.getn(BloodlustMusicSongEnabledTable) < table.getn(BloodlustMusic.songPathTable)) then
                print(BloodlustMusic.announcerHeader .. "New songs were probably added. Fixing some stuff")
                for a, c in ipairs(BloodlustMusic.songPathTable) do
                    if (a > table.getn(BloodlustMusicSongEnabledTable)) then
                        BloodlustMusicSongEnabledTable [a] = true
                    end
                end
            end
    
            if (not BloodlustSoundchannelNumber) then
                BloodlustSoundchannelNumber = 5
            end
    
            if(not BloodlustVolumecache) then
                BloodlustVolumecache = tonumber(GetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber]))
            end
    
            if (not BloodlustSoundhandle) then
                BloodlustSoundhandle = 0
            end
    
            if(not BloodlustChannelVolume) then
                BloodlustChannelVolume = 1
            end
    
            if(not BloodlustMaxSoundchannelBoolean) then
                BloodlustMaxSoundchannelBoolean = false
            end
    
            if(not BloodlustSoundchannelscache) then
                BloodlustSoundchannelscache = 64
            end
    
            PanelCreation()
        end
    end
    
    BloodlustStartingFrame:SetScript("OnEvent", BloodlustStartingFrame_OnEvent)