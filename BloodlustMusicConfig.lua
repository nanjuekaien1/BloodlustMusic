BloodlustMusic = { };

local function BloodlustSongObjectTableDefault()
	BloodlustSongObjectTable = {}
	for a, c in ipairs(BloodlustMusic.DefaultSongTable) do
		BloodlustSongObjectTable[a] = BloodlustMusic.DefaultSongTable[a]
	end

end

local function InputPanelCreation()
	BloodlustMusic.InputPanel = CreateFrame("Frame", "InputPanel", UIParent, "UIPanelDialogTemplate")
	BloodlustMusic.InputPanel.text = "Testing Input"
	BloodlustMusic.InputPanel:SetSize(400, 400)
	BloodlustMusic.InputPanel:SetPoint("CENTER")
	BloodlustMusic.InputPanel:SetToplevel(true)
	BloodlustMusic.InputPanel:SetFrameStrata("DIALOG")
	BloodlustMusic.InputPanel:EnableMouse(true)
	BloodlustMusic.InputPanel:SetMovable(false)
	BloodlustMusic.InputPanel:Hide()

	BloodlustMusic.InputPanel.Maintext = BloodlustMusic.InputPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BloodlustMusic.InputPanel.Maintext:SetPoint("TOP", BloodlustMusic.InputPanel, "TOP", 0 , -9)
	BloodlustMusic.InputPanel.Maintext:SetText("Bloodlust Music")

	BloodlustMusic.InputPanel.Titletext = BloodlustMusic.InputPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	BloodlustMusic.InputPanel.Titletext:SetPoint("TOP", BloodlustMusic.InputPanel, "TOP", 0 , -80)
	BloodlustMusic.InputPanel.Titletext:SetText("Change Title to: ")
	BloodlustMusic.InputPanel.Titletext:SetWordWrap(true)

	BloodlustMusic.InputPanel.TitleEditbox = CreateFrame("EditBox", "InputPanelTitleEditbox", BloodlustMusic.InputPanel, "InputBoxTemplate")
	BloodlustMusic.InputPanel.TitleEditbox:SetWidth(250)
	BloodlustMusic.InputPanel.TitleEditbox:SetHeight(20)
	BloodlustMusic.InputPanel.TitleEditbox:SetMaxLetters(50)

	BloodlustMusic.InputPanel.TitleEditbox:SetPoint("TOP", BloodlustMusic.InputPanel.Titletext, "BOTTOM", 0 , -10)
	BloodlustMusic.InputPanel.TitleEditbox:SetAutoFocus(false)
	BloodlustMusic.InputPanel.TitleEditbox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
	end);

	BloodlustMusic.InputPanel.Pathtext = BloodlustMusic.InputPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	BloodlustMusic.InputPanel.Pathtext:SetPoint("TOP", BloodlustMusic.InputPanel.TitleEditbox, "BOTTOM", 0, -50)
	BloodlustMusic.InputPanel.Pathtext:SetWidth(350)
	BloodlustMusic.InputPanel.Pathtext:SetText("Change Song filename to: \n |cFFFFD100(NB: Needs filetype in the name, .ogg is most common. Also make sure the file for any custom song is in the 'customsongs' folder, not the 'sounds' folder)|r")
	BloodlustMusic.InputPanel.Pathtext:SetWordWrap(true)

	BloodlustMusic.InputPanel.PathEditbox = CreateFrame("EditBox", "InputPanelPathEditbox", BloodlustMusic.InputPanel, "InputBoxTemplate")
	BloodlustMusic.InputPanel.PathEditbox:SetWidth(250)
	BloodlustMusic.InputPanel.PathEditbox:SetHeight(20)
	BloodlustMusic.InputPanel.PathEditbox:SetMaxLetters(50)

	BloodlustMusic.InputPanel.PathEditbox:SetPoint("TOP", BloodlustMusic.InputPanel.Pathtext, "BOTTOM", 0 , -10)
	BloodlustMusic.InputPanel.PathEditbox:SetAutoFocus(false)
	BloodlustMusic.InputPanel.PathEditbox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
	end);

	BloodlustMusic.InputPanel.DefaultButton = CreateFrame("Button", "InputPanelDefaultButton", BloodlustMusic.InputPanel, "UIPanelButtonTemplate")
	BloodlustMusic.InputPanel.DefaultButton:SetText("Reset to Default")
	BloodlustMusic.InputPanel.DefaultButton:SetWidth(128)
	BloodlustMusic.InputPanel.DefaultButton:SetPoint("BOTTOM", BloodlustMusic.InputPanel, "BOTTOM", 0, 100)

	BloodlustMusic.InputPanel.AcceptButton = CreateFrame("Button", "InputPanelAcceptButton", BloodlustMusic.InputPanel, "UIPanelButtonTemplate")
	BloodlustMusic.InputPanel.AcceptButton:SetText("Accept")
	BloodlustMusic.InputPanel.AcceptButton:SetWidth(128)
	BloodlustMusic.InputPanel.AcceptButton:SetPoint("BOTTOMLEFT", BloodlustMusic.InputPanel, "BOTTOMLEFT", 30, 30)

	BloodlustMusic.InputPanel.CancelButton = CreateFrame("Button", "InputPanelCancelButton", BloodlustMusic.InputPanel, "UIPanelButtonTemplate")
	BloodlustMusic.InputPanel.CancelButton:SetText("Cancel")
	BloodlustMusic.InputPanel.CancelButton:SetWidth(128)
	BloodlustMusic.InputPanel.CancelButton:SetPoint("BOTTOMRIGHT", BloodlustMusic.InputPanel, "BOTTOMRIGHT", -30, 30)
	BloodlustMusic.InputPanel.CancelButton:SetScript("OnClick", function()
		BloodlustMusic.InputPanel:Hide()
	end)

end

local function ConfirmPanelCreation()
	BloodlustMusic.ConfirmPanel = CreateFrame("Frame", "ConfirmPanel", UIParent, "UIPanelDialogTemplate")
	BloodlustMusic.ConfirmPanel.text = "Testing Input"
	BloodlustMusic.ConfirmPanel:SetSize(400, 400)
	BloodlustMusic.ConfirmPanel:SetPoint("CENTER")
	BloodlustMusic.ConfirmPanel:SetToplevel(true)
	BloodlustMusic.ConfirmPanel:SetFrameStrata("DIALOG")
	BloodlustMusic.ConfirmPanel:EnableMouse(true)
	BloodlustMusic.ConfirmPanel:SetMovable(false)
	BloodlustMusic.ConfirmPanel:Hide()

	BloodlustMusic.ConfirmPanel.Maintext = BloodlustMusic.ConfirmPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BloodlustMusic.ConfirmPanel.Maintext:SetPoint("TOP", BloodlustMusic.ConfirmPanel, "TOP", 0 , -9)
	BloodlustMusic.ConfirmPanel.Maintext:SetText("Bloodlust Music")

	BloodlustMusic.ConfirmPanel.Infotext = BloodlustMusic.ConfirmPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	BloodlustMusic.ConfirmPanel.Infotext:SetPoint("CENTER", 0, 50)
	BloodlustMusic.ConfirmPanel.Infotext:SetWidth(300)
	BloodlustMusic.ConfirmPanel.Infotext:SetNonSpaceWrap(true)

	BloodlustMusic.ConfirmPanel.AcceptButton = CreateFrame("Button", "InputPanelAcceptButton", BloodlustMusic.ConfirmPanel, "UIPanelButtonTemplate")
	BloodlustMusic.ConfirmPanel.AcceptButton:SetText("Accept")
	BloodlustMusic.ConfirmPanel.AcceptButton:SetWidth(128)
	BloodlustMusic.ConfirmPanel.AcceptButton:SetPoint("BOTTOMLEFT", BloodlustMusic.ConfirmPanel, "BOTTOMLEFT", 30, 30)

	BloodlustMusic.ConfirmPanel.CancelButton = CreateFrame("Button", "InputPanelCancelButton", BloodlustMusic.ConfirmPanel, "UIPanelButtonTemplate")
	BloodlustMusic.ConfirmPanel.CancelButton:SetText("Cancel")
	BloodlustMusic.ConfirmPanel.CancelButton:SetWidth(128)
	BloodlustMusic.ConfirmPanel.CancelButton:SetPoint("BOTTOMRIGHT", BloodlustMusic.ConfirmPanel, "BOTTOMRIGHT", -30, 30)
	BloodlustMusic.ConfirmPanel.CancelButton:SetScript("OnClick", function()
		BloodlustMusic.ConfirmPanel:Hide()
	end)

end

local function ConfirmPanel(index, behaviour, text)
	BloodlustMusic.ConfirmPanel:Hide()
	BloodlustMusic.ConfirmPanel.Infotext:SetText(text)

	if behaviour == "Accept" then
		BloodlustMusic.ConfirmPanel.AcceptButton:SetScript("OnClick", function()
		BloodlustSongObjectTable[index]["Title"] = tostring(BloodlustMusic.InputPanel.TitleEditbox:GetText())
		BloodlustSongObjectTable[index]["Path"] = tostring(BloodlustMusic.InputPanel.PathEditbox:GetText())
		BloodlustMusicShowPanelAfterReload = true
		ReloadUI();
		end)
	elseif behaviour == "Default" then
		BloodlustMusic.ConfirmPanel.AcceptButton:SetScript("OnClick", function()
		BloodlustSongObjectTableDefault()
		BloodlustMusicShowPanelAfterReload = true
		ReloadUI();
		end)
	elseif behaviour == "DefaultSong" then
		BloodlustMusic.ConfirmPanel.AcceptButton:SetScript("OnClick", function()
		BloodlustSongObjectTable[index]["Title"] = BloodlustMusic.DefaultSongTable[index]["Title"]
		BloodlustSongObjectTable[index]["Path"] = BloodlustMusic.DefaultSongTable[index]["Path"]
		BloodlustSongObjectTable[index]["Enabled"] = BloodlustMusic.DefaultSongTable[index]["Enabled"]
		BloodlustMusicShowPanelAfterReload = true
		ReloadUI();
		end)
	end

	BloodlustMusic.ConfirmPanel:Show()
end

local function InputPanel(index)
	BloodlustMusic.InputPanel:Hide()

	BloodlustMusic.InputPanel.TitleEditbox:SetText(BloodlustSongObjectTable[index]["Title"])
	BloodlustMusic.InputPanel.PathEditbox:SetText(BloodlustSongObjectTable[index]["Path"])

	BloodlustMusic.InputPanel.DefaultButton:SetScript("OnClick", function()
		ConfirmPanel(index, "DefaultSong", "This will set this song back to its default, hard-coded values. \n \n \n|cFFFFD100'" .. BloodlustSongObjectTable[index]["Title"] .. "'|r\n turns back to \n|cFFFFD100'" .. BloodlustMusic.DefaultSongTable[index]["Title"] .. "'|r \n \n \n|cFFFFD100'" .. BloodlustSongObjectTable[index]["Path"] .. "'|r\n turns back to \n|cFFFFD100'" .. BloodlustMusic.DefaultSongTable[index]["Path"] .. "'|r\n \n \n Accept and reload?")
	end)

	BloodlustMusic.InputPanel.AcceptButton:SetScript("OnClick", function()
		ConfirmPanel(index, "Accept", "Pending changes: \n \n \n|cFFFFD100'" .. BloodlustSongObjectTable[index]["Title"] .. "'|r\n becomes \n|cFFFFD100'" .. tostring(BloodlustMusic.InputPanel.TitleEditbox:GetText()) .. "'|r \n \n \n|cFFFFD100'" .. BloodlustSongObjectTable[index]["Path"] .. "'|r\n  becomes  \n|cFFFFD100'" .. tostring(BloodlustMusic.InputPanel.PathEditbox:GetText()) .. "'|r\n \n \n Accept and reload?")
	end)

	BloodlustMusic.InputPanel:Show()
end



local function PanelCreation()
	local SongEditButtonWidth = 35
	local scrollbarIndent = 35
	local scrollbarOffset = scrollbarIndent + 20

	--Creating the Scrollframe and Scrollchild
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
	BloodlustMusic.panel.scrollChild:SetSize(BloodlustMusic.panel.scrollFrame:GetWidth(), (BloodlustMusic.panel.scrollFrame:GetHeight() * 3.5 ));


	--Titles and descriptions
    local BloodlustTitle = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    BloodlustTitle:SetPoint("TOPLEFT", 16, -16)
    BloodlustTitle:SetText("Bloodlust Music")

    local BloodlustSubtitle = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    BloodlustSubtitle:SetPoint("TOPLEFT", BloodlustTitle, "RIGHT", 5, 3)
    BloodlustSubtitle:SetText("Version 1.1 (release)")

	local BloodlustDescription = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustDescription:SetPoint("TOPLEFT", BloodlustTitle, "BOTTOMLEFT", 0, -8)
	BloodlustDescription:SetWidth(BloodlustMusic.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustDescription:SetJustifyH("LEFT")
	BloodlustDescription:SetText("A stupid Addon to play music during Hero, Bloodlust, Primal Rage, etc. You can change a couple of settings below to your liking. Some barebones information is provided next to the corresponding option. For a more in depth explanation, please refer to the description of the addon at: https://addons.wago.io/addons/bloodlustmusic-wip . Thanks and enjoy!")


	--Volume Slider during Hero
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


	--Dropdown to select Soundchannel
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


	--Checkbox to increase the # of allowed sounds or "soundchannels"
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


	--Button to reset sound levels
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


	--Button to test a song
	local TestingPlayButtonDescription = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    TestingPlayButtonDescription:SetPoint("TOPLEFT", SoundResetButton, "BOTTOMLEFT", 0, -15)
	TestingPlayButtonDescription:SetWidth(BloodlustMusic.panel.scrollFrame:GetWidth() - scrollbarOffset)
	TestingPlayButtonDescription:SetJustifyH("LEFT")
	TestingPlayButtonDescription:SetText("Everything set? Press the button below for a 10 second test song. Enter a number between 1 and 60 to test a specific song. Want a random one? Leave it empty or place a 0. Please note: no other songs can play at the same time.")

	local TestingPlayButtonEditbox = CreateFrame("EditBox", "InputBoxTemplateTest", BloodlustMusic.panel.scrollChild, "InputBoxTemplate")
	TestingPlayButtonEditbox:SetWidth(30)
	TestingPlayButtonEditbox:SetHeight(20)
	TestingPlayButtonEditbox:SetPoint("TOPLEFT", TestingPlayButtonDescription, "BOTTOMLEFT", 140 , -15.5)
	TestingPlayButtonEditbox:SetAutoFocus(false)
	TestingPlayButtonEditbox:SetCursorPosition(0)
	TestingPlayButtonEditbox:SetNumeric(true)
	TestingPlayButtonEditbox:SetMaxLetters(2)
	TestingPlayButtonEditbox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
	end);

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
			SongPlayerPrimer(BloodlustMusic.currentSongSpellID, TestingPlayButtonEditbox:GetNumber())
			C_Timer.After(10, function() -- wait a bit
				StopSong(false)
			print(BloodlustMusic.announcerHeader .. "Test song stopped")
			end)
		end
	end)

	--Description for song list
	local BloodlustSongListButtonDescription = BloodlustMusic.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSongListButtonDescription:SetPoint("TOPLEFT", TestingPlayButton, "BOTTOMLEFT", 0, -15)
	BloodlustSongListButtonDescription:SetWidth(BloodlustMusic.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustSongListButtonDescription:SetJustifyH("LEFT")
	BloodlustSongListButtonDescription:SetText("Want to customise what songs you hear? Below you can tick the boxes to turn individual songs on or off. You can press the edit button to change the names and change the song file itself. This way you can introduce your own custom songs without digging in the code.\n \nMessed up? Each edit button has a default button. Messed up a lot? At the bottom you'll see a button to put all songs back to their hard-coded values.\n\nFor more info on the whole process, please visit the addon site.")

	--Dummy table for variable purposes
	local SongCheckboxes = { };
	for a, c in ipairs(BloodlustSongObjectTable) do
		SongCheckboxes[a] = "Checkbox" ..a

	end

	--Creates a checkbox for every song
	for a,c in ipairs(SongCheckboxes) do
		SongCheckboxes[a] = CreateFrame("CheckButton", "SongCheckbox ".. a, BloodlustMusic.panel.scrollChild, "UICheckButtonTemplate")
		if (a == 1) then
			SongCheckboxes[a]:SetPoint("TOPLEFT", BloodlustSongListButtonDescription, "BOTTOMLEFT", -10, -15)
		elseif (a == (tostring(math.ceil(table.getn(BloodlustSongObjectTable)/2))+1)) then
			SongCheckboxes[a]:SetPoint("LEFT", SongCheckboxes[1].text, "RIGHT", SongEditButtonWidth, 1.5)
		else
			SongCheckboxes[a]:SetPoint("TOPLEFT", SongCheckboxes[a-1].text, "BOTTOMLEFT", -30, (-10))
		end

		SongCheckboxes[a].text:SetFontObject("GameFontHighlight")
		SongCheckboxes[a].text:SetText(a .. ". " .. BloodlustSongObjectTable[a]["Title"])
		SongCheckboxes[a].text:SetWidth((BloodlustMusic.panel.scrollChild:GetWidth()/2) - scrollbarOffset - SongEditButtonWidth)
		SongCheckboxes[a].text:SetHeight(30)
		SongCheckboxes[a].text:SetJustifyH("LEFT")
		SongCheckboxes[a].text:SetWordWrap(true)
		SongCheckboxes[a].text:SetNonSpaceWrap(true)

		if (getglobal("SongCheckbox "..a):GetChecked() ~= BloodlustSongObjectTable[a]["Enabled"]) then
			getglobal("SongCheckbox "..a):SetChecked(BloodlustSongObjectTable[a]["Enabled"]);
		end

		SongCheckboxes[a]:SetScript("OnClick", function(self,event,arg1)
			if (self:GetChecked()) then
				BloodlustSongObjectTable[a]["Enabled"] = true;
			else
				BloodlustSongObjectTable[a]["Enabled"] = false;
			end
		end)

	end

	--Dummy table for variable purposes
	local SongEditButtons = { };
	for a, c in ipairs(BloodlustSongObjectTable) do
		SongEditButtons[a] = "TableButton" ..a
	end

	--Create Editbuttons to accompany the Checkboxes
	for a,c in ipairs(SongEditButtons) do
		SongEditButtons[a] = CreateFrame("Button", "SongEditButton ".. a, BloodlustMusic.panel.scrollChild, "UIPanelButtonTemplate")
		SongEditButtons[a]:SetPoint("TOPLEFT", SongCheckboxes[a].text, "TOPRIGHT", 0, -1.8)
		SongEditButtons[a]:SetWidth(SongEditButtonWidth)
		SongEditButtons[a].text = _G["TestingButton".."Text"]
		SongEditButtons[a]:SetText("Edit")
		SongEditButtons[a]:SetScript("OnClick", function(self, arg1)
			InputPanel(a)
		end)
	end


	--Button to set ALL songs to default
	local SongDefaultButton = CreateFrame("Button","SongDefaultButton", BloodlustMusic.panel.scrollChild,"UIPanelButtonTemplate")
	SongDefaultButton:SetWidth(170)
	SongDefaultButton:SetPoint("CENTER", SongEditButtons[(math.ceil(table.getn(BloodlustSongObjectTable)/2))], "BOTTOMRIGHT",  0, -50)
	SongDefaultButton.text = _G["SongDefaultButton".."Text"]
	SongDefaultButton:SetText("Set all songs to default")
	SongDefaultButton:SetScript("OnClick", function(self, arg1)
		ConfirmPanel(nil, "Default", "\n |cFFFFD100WARNING:|r This will set all songs back to their default, hard-coded values, even your custom songs. \n \n \n This action cannot be reversed and any change you have made to any song will have to be entered manually again. \n \n \n Accept and reload?");
	end)


	--Checkbox to mute BloodlustMusic
	local MuteCheckbox = CreateFrame("CheckButton", "MuteCheckbox", BloodlustMusic.panel.scrollChild, "UICheckButtonTemplate")
	MuteCheckbox:SetPoint("TOPRIGHT", (-scrollbarOffset - 20), -3)
	MuteCheckbox.text:SetFontObject("GameFontNormal", "Randomname")
	MuteCheckbox.text:SetText("|cFFFFD100Mute|r")
	MuteCheckbox.text:SetWidth(300)
	MuteCheckbox.text:SetJustifyH("LEFT")
	MuteCheckbox.text:SetTextColor(1, 1, 1, 1)

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
         --Checks for saved variables, if they don't exist, we create them
		if (BloodlustMusicSongEnabledTable) then
            BloodlustMusicSongEnabledTable = nil
        end
		if (not BloodlustSongObjectTable) or (table.getn(BloodlustSongObjectTable)<60) then
			BloodlustSongObjectTableDefault()
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
		if(not BloodlustMusicShowPanelAfterReload) then
			BloodlustMusicShowPanelAfterReload = false
		end

		--Create all the panels
		InputPanelCreation()
		ConfirmPanelCreation()
        PanelCreation()
     end
end

    BloodlustStartingFrame:SetScript("OnEvent", BloodlustStartingFrame_OnEvent)