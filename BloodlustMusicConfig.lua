BloodlustMusic = { };

--Mega spaghetti function to create the interface
local function PanelCreation()
	--Create standard offset to account for the Scrollbar
	local scrollbarIndent = 35
	local scrollbarOffset = scrollbarIndent + 20

	--Pure spaghetti to create a scrolling frame
	BloodlustMusic.panel.scrollFrame = CreateFrame("ScrollFrame", "BloodlustMusicScrollFrame", BloodlustMusic.panel, "UIPanelScrollFrameTemplate");
	Mixin(BloodlustMusic.panel.scrollFrame, BackdropTemplateMixin)
	BloodlustMusic.panel.scrollFrame:SetPoint("TOPLEFT", 0, -5 );
    BloodlustMusic.panel.scrollFrame:SetPoint("BOTTOMRIGHT", -scrollbarIndent, 5);
	BloodlustMusic.panel.scrollFrame:SetSize(BloodlustMusic.panel:GetWidth(), BloodlustMusic.panel:GetHeight());
	BloodlustMusic.panel.scrollFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
												edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
												tile = true, tileSize = 16, edgeSize = 1,
												insets = { left = 4, right = -30, top = 0, bottom = -1 }});
	BloodlustMusic.panel.scrollFrame:SetBackdropColor(0,0,0,0.5);

	BloodlustMusic.panel.scrollFrame.scrollbar = _G["BloodlustMusicScrollFrame".."ScrollBar"];
	Mixin(BloodlustMusic.panel.scrollFrame.scrollbar, BackdropTemplateMixin)
	BloodlustMusic.panel.scrollFrame.scrollbar:SetWidth(22)
	BloodlustMusic.panel.scrollFrame.scrollbar:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
														  edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
														  tile = true, tileSize = 16, edgeSize = 10,
														  insets = { left = 1, right = 1, top = 2, bottom = 2 }});
	BloodlustMusic.panel.scrollFrame.scrollbar:SetBackdropColor(0,0,0,1)


    BloodlustMusic.panel.scrollChild = CreateFrame("Frame", "BloodlustMusicScrollChild", BloodlustMusic.panel.scrollFrame);
	BloodlustMusic.panel.scrollFrame:SetScrollChild(BloodlustMusic.panel.scrollChild);
	BloodlustMusic.panel.scrollChild:SetSize(BloodlustMusic.panel.scrollFrame:GetWidth(), (BloodlustMusic.panel.scrollFrame:GetHeight() * 3 ));

	--Title and Descriptions
    local BloodlustTitle = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    BloodlustTitle:SetPoint("TOPLEFT", 16, -16)
    BloodlustTitle:SetText("Bloodlust Music")

    local BloodlustSubtitle = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    BloodlustSubtitle:SetPoint("TOPLEFT", BloodlustTitle, "RIGHT", 5, 3)
    BloodlustSubtitle:SetText("Version 1.0 (release)")

	local BloodlustDescription = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustDescription:SetPoint("TOPLEFT", BloodlustTitle, "BOTTOMLEFT", 0, -8)
	BloodlustDescription:SetWidth(BloodlustMusic.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustDescription:SetJustifyH("LEFT")
	BloodlustDescription:SetText("A stupid Addon to play music during Hero, Bloodlust, Primal Rage, etc. You can change a couple of settings below to your liking. Some barebones information is provided next to the corresponding option. For a more in depth explanation, please refer to the description of the addon at: https://addons.wago.io/addons/bloodlustmusic-wip . Thanks and enjoy!")

	--Volume Slider
	local BloodlustSliderDescription = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSliderDescription:SetPoint("TOPLEFT", BloodlustTitle, "BOTTOMLEFT", 0, -180)
	BloodlustSliderDescription:SetWidth(BloodlustMusic.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustSliderDescription:SetJustifyH("LEFT")
	BloodlustSliderDescription:SetText("Use the Slider menu below to set how loud the music during Hero should be. Don't want the volume raised? Enter a number lower or equal to your current volume for your soundchannel. You can view this under Main menu -> System -> Sound.")


	local BloodlustSlider = CreateFrame("Slider", "BloodlustSliderGlobalName", BloodlustMusic.panel.scrollChild, "OptionsSliderTemplate")
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
    BloodlustSlider.low:SetText("0%")
    BloodlustSlider.high:SetText("100%")
	BloodlustSlider.tooltipText = "Volume of " .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " soundchannel during Hero"
	BloodlustSlider:SetScript("OnValueChanged", function(self,event,arg1)
		BloodlustChannelVolume = math.floor(BloodlustSlider:GetValue()*100)/100
		BloodlustSlider.text:SetText(math.floor(BloodlustChannelVolume*100) .. "%")

	end)
	BloodlustSlider:Show()

	local BloodlustSliderLabel = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    BloodlustSliderLabel:SetPoint("LEFT", BloodlustSlider, "TOPLEFT", -1.5, 20)
    BloodlustSliderLabel:SetNonSpaceWrap(true)
	BloodlustSliderLabel:SetText(BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " volume during Hero")

	--Sound Channel dropdown
	local BloodlustDropdownDescription = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustDropdownDescription:SetPoint("TOPLEFT", BloodlustDescription, "BOTTOMLEFT", 0, -30)
	BloodlustDropdownDescription:SetWidth(BloodlustMusic.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustDropdownDescription:SetJustifyH("LEFT")
	BloodlustDropdownDescription:SetText("Use the Dropdown menu below to set what soundchannel you want Hero to play on. Unsure? Dialog is recommended, Master is more fun.")

	local BloodlustDropdown = CreateFrame("FRAME", "BloodlustDropdown", BloodlustMusic.panel.scrollChild, "UIDropDownMenuTemplate")
	BloodlustDropdown:SetPoint("TOPLEFT", BloodlustDropdownDescription, "BOTTOMLEFT", -10, -20)
	UIDropDownMenu_SetWidth(BloodlustDropdown, 200)
	UIDropDownMenu_SetText(BloodlustDropdown, "Current soundchannel: " .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber])

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

	local BloodlustDropDownLabel = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    BloodlustDropDownLabel:SetPoint("LEFT", BloodlustDropdown, "TOPLEFT", 20, 7)
    BloodlustDropDownLabel:SetNonSpaceWrap(true)
	BloodlustDropDownLabel:SetText("Sound Channel")

	--Max Soundchannels checkbox
	local BloodlustMaxSoundchannelDescription = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustMaxSoundchannelDescription:SetPoint("TOPLEFT", BloodlustSlider, "BOTTOMLEFT", -10, -20)
	BloodlustMaxSoundchannelDescription:SetWidth(BloodlustMusic.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustMaxSoundchannelDescription:SetJustifyH("LEFT")
	BloodlustMaxSoundchannelDescription:SetText("Sometimes the music will cut out if stuff gets too busy. You can try to prevent this by checking the box below. This will make sure WoW can play more sounds at the same time, by upping the number of allowed soundchannels. Afterwards it will put it back to normal levels. Highly recommended to check the addon description for more info.")

	local MaxSoundchannelCheckbox = CreateFrame("CheckButton", "MaxSoundchannelCheckbox", BloodlustMusic.panel.scrollChild, "UICheckButtonTemplate")
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

	--Soundreset Button
	local BloodlustSoundResetDescription = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSoundResetDescription:SetPoint("TOPLEFT", MaxSoundchannelCheckbox, "BOTTOMLEFT", 0, -15)
	BloodlustSoundResetDescription:SetWidth(BloodlustMusic.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustSoundResetDescription:SetJustifyH("LEFT")
	BloodlustSoundResetDescription:SetText("Sound not reset properly after Hero? Try setting your in-game volume at Main Menu -> System -> Sound to your preferred normal level, then click the button below.")

	local SoundResetButton = CreateFrame("Button","SoundResetButton", BloodlustMusic.panel.scrollChild,"UIPanelButtonTemplate")
	SoundResetButton:SetWidth(128)
	SoundResetButton:SetPoint("TOPLEFT", BloodlustSoundResetDescription, "BOTTOMLEFT", 0, -8)
	SoundResetButton.text = _G["SoundResetButton".."Text"]
	SoundResetButton:SetText("Sound Reset")
	SoundResetButton:SetScript("OnClick", function(self, arg1)
		if (BloodlustMusic.isSongPlaying) then
			print(BloodlustMusic.announcerHeader .. "Resetting prevented, please try again after Hero has ended")
		else
			BloodlustSoundchannelscache = GetCVar("Sound_NumChannels")
			BloodlustVolumecache = tonumber(GetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber]))
			print(BloodlustMusic.announcerHeader .. "Regular volume level for "  .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " is now set to: " .. math.floor(BloodlustVolumecache*100) .. "%")
		end
	end)

	--Test Song Button
	local TestingPlayButtonDescription = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    TestingPlayButtonDescription:SetPoint("TOPLEFT", SoundResetButton, "BOTTOMLEFT", 0, -15)
	TestingPlayButtonDescription:SetWidth(BloodlustMusic.panel.scrollFrame:GetWidth() - scrollbarOffset)
	TestingPlayButtonDescription:SetJustifyH("LEFT")
	TestingPlayButtonDescription:SetText("Everything set? Press the button below for a 10 second test of a random song. No other songs can play at the same time.")

	local TestingPlayButton = CreateFrame("Button","TestingPlayButton", BloodlustMusic.panel.scrollChild,"UIPanelButtonTemplate")
	TestingPlayButton:SetWidth(128)
	TestingPlayButton:SetPoint("TOPLEFT", TestingPlayButtonDescription, "BOTTOMLEFT", 0, -15)
	TestingPlayButton.text = _G["TestingPlayButton".."Text"]
	TestingPlayButton:SetText("Play a test song")
	TestingPlayButton:SetScript("OnClick", function(self, arg1)
		if (BloodlustMusic.isSongPlaying) then
			print(BloodlustMusic.announcerHeader .. "Song test prevented. A song is already playing.")
		elseif(BloodlustMusicMute) then
			print(BloodlustMusic.announcerHeader .. "Song test prevented. BloodlustMusic is currently muted.")
		else
			print(BloodlustMusic.announcerHeader .. "Test song started");
			SongPlayerPrimer(BloodlustMusic.currentSongSpellID)
			C_Timer.After(10, function() -- wait a bit
				StopSong(false)
			print(BloodlustMusic.announcerHeader .. "Test song stopped")
			end)

		end
	end)

	--Song List checkboxes
	local BloodlustSongListButtonDescription = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSongListButtonDescription:SetPoint("TOPLEFT", TestingPlayButton, "BOTTOMLEFT", 0, -15)
	BloodlustSongListButtonDescription:SetWidth(BloodlustMusic.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustSongListButtonDescription:SetJustifyH("LEFT")
	BloodlustSongListButtonDescription:SetText("Want to turn songs on or off? Tick the boxes below if you don't want to hear a certain song. You can always turn them back on later")


	local SongCheckboxes = { };
	for a, c in ipairs(BloodlustMusicSongEnabledTable) do
		SongCheckboxes[a] = "Checkbox" ..a

	end

	for a,c in ipairs(SongCheckboxes) do
		SongCheckboxes[a] = CreateFrame("CheckButton", "SongCheckbox ".. a, BloodlustMusic.panel.scrollChild, "UICheckButtonTemplate")
		if (a == 1) then
			SongCheckboxes[a]:SetPoint("TOPLEFT", BloodlustSongListButtonDescription, "BOTTOMLEFT", -10, -15)
		elseif (a == (tostring(math.ceil(table.getn(BloodlustMusicSongEnabledTable)/2))+1)) then
			SongCheckboxes[a]:SetPoint("LEFT", SongCheckboxes[1].text, "RIGHT", 0, 1.5)
		else
			SongCheckboxes[a]:SetPoint("TOPLEFT", SongCheckboxes[a-1].text, "BOTTOMLEFT", -30, (-10))
		end

		SongCheckboxes[a].text:SetFontObject("GameFontHighlight")
		SongCheckboxes[a].text:SetText(a .. ". " .. BloodlustMusic.songNameTable[a])
		SongCheckboxes[a].text:SetWidth((BloodlustMusic.panel.scrollChild:GetWidth()/2) - scrollbarOffset)
		SongCheckboxes[a].text:SetJustifyH("LEFT")

				if (getglobal("SongCheckbox "..a):GetChecked() ~= BloodlustMusicSongEnabledTable[a]) then
					getglobal("SongCheckbox "..a):SetChecked(BloodlustMusicSongEnabledTable[a]);
				end

				SongCheckboxes[a]:SetScript("OnClick", function(self,event,arg1)
					if (self:GetChecked()) then
						BloodlustMusicSongEnabledTable[a] = true;
					else
						BloodlustMusicSongEnabledTable[a] = false;
					end
				end)
		end

	--Mute Button
	MuteCheckbox = CreateFrame("CheckButton", "MuteCheckbox", BloodlustMusic.panel.scrollChild, "UICheckButtonTemplate")
	MuteCheckbox:SetPoint("TOPRIGHT", (-scrollbarOffset - 20), -3)
	MuteCheckbox.text:SetFontObject("GameFontNormal", "Randomname")
	MuteCheckbox.text:SetText("Mute")
	MuteCheckbox.text:SetWidth(300)
	MuteCheckbox.text:SetJustifyH("LEFT")

	if (getglobal("MuteCheckbox"):GetChecked() ~= BloodlustMusicMute) then
		getglobal("MuteCheckbox"):SetChecked(BloodlustMusicMute);
	end

	MuteCheckbox:SetScript("OnClick", function(self,event,arg1)
		if (self:GetChecked()) then
			BloodlustMusicMute = true;
			print(BloodlustMusic.announcerHeader .. "The addon is now muted, no songs will play.")
		else

			BloodlustMusicMute = false;
			print(BloodlustMusic.announcerHeader .. "The addon is now unmuted, enjoy the songs :)")
		end
	end)

	end


--What to do when Addon loads
    local BloodlustStartingFrame = CreateFrame("FRAME", "BloodlustMusic");
    BloodlustStartingFrame:RegisterEvent("ADDON_LOADED");
    local function BloodlustStartingFrame_OnEvent(self, event, ...)
        if (event == "ADDON_LOADED") and (... == "BloodlustMusic") then
            print(BloodlustMusic.announcerHeader .. "Loaded");
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

			if(not BloodlustMusicMute) then
				BloodlustMusicMute = false
		    end
            PanelCreation()
        end
    end

    BloodlustStartingFrame:SetScript("OnEvent", BloodlustStartingFrame_OnEvent)