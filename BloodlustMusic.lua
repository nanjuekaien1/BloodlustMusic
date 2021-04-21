BloodlustMusic = { };

BloodlustMusic.songPathTable = {
    [[GasHero.ogg]],        --1
    [[90sHero.ogg]],        --2
    [[BrainPowerHero.ogg]], --3
    [[BirdHero.ogg]],       --4
    [[SandHero.ogg]],       --5
    [[NightHero.ogg]],      --6
    [[ElephantHero.ogg]],   --7
    [[SaiyanHero.ogg]],     --8
    [[JellyfishHero.ogg]],  --9
    [[TopHero.ogg]],        --10
    [[DDDHero.ogg]],        --11
    [[Up&DanceHero.ogg]],   --12
    [[HardcoreHero.ogg]],   --13
    [[PerfectHero.ogg]],    --14
    [[SpeedyHero.ogg]],     --15
    [[CascadaHero.ogg]],    --16
    [[SunRainHero.ogg]],    --17
    [[DontStopHero.ogg]],   --18
    [[InvadersHero.ogg]],   --19
    [[CallOnMeHero.ogg]],   --20
    [[KissKillHero.ogg]],   --21
    [[LookaHero.ogg]],      --22
    [[AnchorHero.ogg]],     --23
    [[FullMetalHero.ogg]],  --24
    [[KickstartHero.ogg]],  --25
    [[RiderHero.ogg]],      --26
    [[RisingSunHero.ogg]],  --27
    [[BloodSugarHero.ogg]], --28
    [[DejaVuHero.ogg]],     --29
    [[RumbleHero.ogg]],     --30
    [[HurricaneHero.ogg]],  --31
    [[DontTurnHero1.ogg]],  --32
    [[DontTurnHero2.ogg]],  --33
    [[EuronightHero.ogg]],  --34
    [[BeatinWildHero.ogg]], --35
    [[KingHero.ogg]],       --36
    [[SuperRiderHero.ogg]], --37
    [[PistonGoHero.ogg]],   --38
    [[DancingHero.ogg]],    --39
    [[BeatCrazyHero.ogg]],  --40
    [[SpitfireHero.ogg]],   --41
    [[ShockOutHero.ogg]],   --42
    [[SpeedLoverHero.ogg]], --43
	[[ShrekHero.ogg]],      --44
	[[BonkersHero.ogg]],    --45
    [[HyperSuperHero.ogg]], --46
    [[SuperstarHero.ogg]],  --47
	[[AdrenalineHero.ogg]], --48
	[[LoveDangerHero.ogg]]  --49

}

BloodlustMusic.songNameTable = {
    [[Manuel - GAS GAS GAS]],
    [[Max Coveri - Running in the 90's]],
    [[Noma - Brainpower]],
    [[Lynyrd Skynyrd - Freebird]],
    [[Darude - Sandstorm]],
    [[Niko - Night of Fire]],
    [[The Elephant Rave]],
    [[Fartwad - Stereo Saiyan 3D]],
    [[The Jellyfish Jam]],
    [[Ken Blast - The Top]],
    [[Mega NRG Man - DDD Initial D]],
    [[Lou Master - Up & Dance, Up & Go]],
    [[Fastway - Rockin' Hardcore]],
    [[Chris Stanton - A Perfect Hero]],
    [[Marco Polo - Speedy Speed Boy]],
    [[Cascada - Everytime we Touch]],
    [[Manuel - Sun In The Rain]],
    [[Lou Grant - Don't Stop The Music]],
    [[The Prodigy - Invaders must die]],
    [[Eric Prydz - Call On Me]],
    [[Odyssey - Kiss Me Kill Me]],
    [[Go2 - Looka Bomba]],
    [[ALESTORM - Fucked With An Anchor]],
    [[Daniel - Full Metal Cars]],
    [[Mötley Crüe - Kickstart my Heart]],
    [[Ace - Rider Of The Sky]],
    [[Dave Rodgers - Beat Of The Rising Sun]],
    [[Pendulum - Blood Sugar]],
    [[Dave Rodgers - Deja Vu]],
    [[Jock Jams - Let's Get Ready To Rumble]],
    [[Gold-Rake - Hurricane Man]],
    [[Go2 - Don't Turn It Off (Chorus)]],
    [[Go2 - Don't Turn It Off (Solo)]],
    [[Eurogroove - Euronight]],
    [[Fastway - Rock Beatin' Wild]],
    [[Jordan - King Of Eurobeat]],
    [[Mark Astley - Super Rider]],
    [[Gordon Jim - Piston Go]],
    [[Vicky Vale - Dancing]],
    [[Fastway - Go Beat Crazy]],
    [[Go2 - Spitfire]],
    [[Fastway - Shock Out]],
    [[Speedman - Speed Lover]],
	[[Jennifer Saunders - Holding Out for a Hero]],
	[[Dizzee Rascal & Armand van Helden - Bonkers]],
    [[Fastway - Hyper Super Power]],
    [[Go2 & DJ Boss - Superstar]],
	[[Ace - Adrenaline]],
	[[Priscilla - Love is in Danger]]
}

BloodlustMusic.soundChannelTable = {
    "master",
    "sfx",
    "music",
    "ambience",
    "dialog"
}
BloodlustMusic.soundVolumeTable = {
    "Sound_MasterVolume",
    "Sound_SFXVolume",
    "Sound_MusicVolume",
    "Sound_AmbienceVolume",
    "Sound_DialogVolume"


}
BloodlustMusic.soundChannelNames = {
    "Master",
    "SFX",
    "Music",
    "Ambience",
    "Dialog"
}


SLASH_BLOODLUSTMUSIC1, SLASH_BLOODLUSTMUSIC2 = '/blm', '/bloodlust';

function SlashCmdList.BLOODLUSTMUSIC(msg, editbox)
	InterfaceOptionsFrame:Show()
	InterfaceOptionsFrame_OpenToCategory(BloodlustMusic.panel);
end

--Declaring Variables
local f = CreateFrame("Frame");
local playerGUID;
local tried = 0
local randomNumber = 0
local willPlay = 0
local defaultFilePath = "interface/addons/bloodlustmusic/sounds/"
local currentFilePath = " "
local currentlyPlaying = " "
local minute = 0
local songNumber = 0
local spellIDS = {80353, 32182, 2825, 264667, 146555, 178207, 256740, 230935, 309658}
local isSongPlaying = false
local currentSongSpellID
local announcerHeader = "|cFFff2f00BloodlustMusic:|r "

C_Timer.After(.1, function() -- wait a bit
	playerGUID = UnitGUID("player");
end)

function StopSong(Showtext)
	--Stops the song when Hero ends or is cancelled
	isSongPlaying = false
	currentSongSpellID = 0
	StopSound(BloodlustSoundhandle)
	SetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber], BloodlustVolumecache)
  	SetCVar("Sound_NumChannels", BloodlustSoundchannelscache)
	if (Showtext) then
		print(announcerHeader .. "Song Stopped")
	end
end

function SongPlayerRepeatable(song)
    currentFilePath = defaultFilePath;
	currentlyPlaying = announcerHeader ..  "Now Playing: "

    if(BloodlustMusicSongEnabledTable[song])
    then
        currentlyPlaying = currentlyPlaying .. BloodlustMusic.songNameTable[song]

        currentFilePath = currentFilePath .. BloodlustMusic.songPathTable[song]
    else
        currentlyPlaying = currentlyPlaying .. "No Song"

        currentFilePath = currentFilePath .. "NoSong.ogg"
	end

	willPlay, BloodlustSoundhandle = PlaySoundFile(currentFilePath, BloodlustMusic.soundChannelTable[BloodlustSoundchannelNumber])
end

function SongPlayerPrimer(heroSpellID)
	if (not isSongPlaying) then
	--Resetting some variables
	tried = 0
	randomNumber = 0
	defaultFilePath = "interface/addons/bloodlustmusic/sounds/"
	currentFilePath = " "
	currentlyPlaying = " "
	BloodlustVolumecache = tonumber(GetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber]))

	--gets the current local time (minute)
	minute = (date("%M"))


	--makes sure songNumber is never zero and makes sure songNumber can't be higher than 47. Lua tables start at 1 and there are only 47 songs
	songNumber = minute + 1
	--songNumber = 49
	if (songNumber > table.getn(BloodlustMusicSongEnabledTable))
	then
		songNumber = songNumber - (60 - (table.getn(BloodlustMusicSongEnabledTable)))
	end

	--plays the song
	BloodlustVolumecache = tonumber(GetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber]))
	BloodlustSoundchannelscache = GetCVar("Sound_NumChannels")

	SetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber], BloodlustVolumecache < BloodlustChannelVolume and BloodlustChannelVolume or BloodlustVolumecache)


	if (BloodlustMaxSoundchannelBoolean) then
  		SetCVar("Sound_NumChannels", 128)
	end

	SongPlayerRepeatable(songNumber)

	--checks if song actually played
	if(not willPlay == true)
	then
		--if song didn't play, a random one is selected below
		repeat

			--generates a random number
			randomNumber=math.random(1,table.getn(BloodlustMusicSongEnabledTable))

			--plays the song
			SongPlayerRepeatable(randomNumber)
			tried = tried + 1

			--ends the loop if a song played or after 20 tries
		until((not willPlay == false) or (tried >= 20))
	end

	--displays the current song playing, or that it failed to play any
	if(tried >= 20)
	then
		BloodlustSoundhandle = 0
		StopSong(false)
		print(announcerHeader .. "No song was selected. Please check your Addon or Sound settings")
	else
		isSongPlaying = true
		currentSongSpellID = heroSpellID
		print(currentlyPlaying)
	end
else
	print(announcerHeader .. "A song is already playing.")
end
end

function f:OnEvent()
	local _, event, _, _, _, _, _, destinationGUID, _, _, _, spellID, spellName, _, _ = CombatLogGetCurrentEventInfo();

		if (event == "SPELL_AURA_APPLIED" and destinationGUID == playerGUID)
		then
			for key,value in pairs(spellIDS) do
				if (value == spellID)
				then
				SongPlayerPrimer(value);
				end
			end
		elseif (event == "SPELL_AURA_REMOVED" and destinationGUID == playerGUID)
		then
			for key,value in pairs(spellIDS) do
				if (value == spellID and value == currentSongSpellID)
				then
				StopSong(true);
				end
			end
		end
end


f:SetScript("OnEvent", f.OnEvent);

--Main/Options Panel
BloodlustMusic.panel = CreateFrame( "Frame", "BloodlustMusicPanel", UIParent );
BloodlustMusic.panel.name = "BloodlustMusic";
InterfaceOptions_AddCategory(BloodlustMusic.panel);

-- Song List Panel
BloodlustMusic.songpanel = CreateFrame( "Frame", "BloodlustMusicSongPanel", BloodlustMusic.panel);
BloodlustMusic.songpanel.name = "Song List";
BloodlustMusic.songpanel.parent = BloodlustMusic.panel.name;
InterfaceOptions_AddCategory(BloodlustMusic.songpanel);



local function PanelCreation()

    local BloodlustTitle = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    BloodlustTitle:SetPoint("TOPLEFT", 16, -16)
    BloodlustTitle:SetText("Bloodlust Music")

    local BloodlustSubtitle = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    BloodlustSubtitle:SetPoint("TOPLEFT", BloodlustTitle, "RIGHT", 5, 3)

    BloodlustSubtitle:SetText("Version 0.2 (alpha)")

	local BloodlustDescription = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustDescription:SetPoint("TOPLEFT", BloodlustTitle, "BOTTOMLEFT", 0, -8)
	BloodlustDescription:SetWidth(600)
	BloodlustDescription:SetJustifyH("LEFT")
	BloodlustDescription:SetText("A stupid Addon to play music during Hero, Bloodlust, Primal Rage, etc. You can change a couple of settings below to your liking. Some barebones information is provided next to the corresponding option. For a more in depth explanation, please refer to the description of the addon at: https://addons.wago.io/addons/bloodlustmusic-wip . Thanks and enjoy!")

	local BloodlustSliderDescription = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSliderDescription:SetPoint("LEFT", 16, 50)
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
	BloodlustSlider:Show()

	local BloodlustSliderLabel = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    BloodlustSliderLabel:SetPoint("LEFT", BloodlustSlider, "TOPLEFT", -1.5, 20)
    BloodlustSliderLabel:SetNonSpaceWrap(true)
	BloodlustSliderLabel:SetText(BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " volume during Hero")

	local BloodlustDropdownDescription = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustDropdownDescription:SetPoint("TOPLEFT", BloodlustDescription, "BOTTOMLEFT", 0, -30)
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
		if(isSongPlaying) then
			print(announcerHeader .. "Changing soundchannel prevented, please do so after hero has ended")
			CloseDropDownMenus()
		else
			BloodlustSoundchannelNumber = newValue
			UIDropDownMenu_SetText(BloodlustDropdown, "Current soundchannel: " .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber])
			print(announcerHeader .. "Soundchannel changed to: " .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber])
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
	BloodlustSongListButtonDescription:SetWidth(600)
	BloodlustSongListButtonDescription:SetJustifyH("LEFT")
	BloodlustSongListButtonDescription:SetText("Want to turn songs on or off? Press the button below to view all songs and click the checkboxes to turn them on or off.")

	local SongListButton = CreateFrame("Button","SongListButton", BloodlustMusic.panel,"UIPanelButtonTemplate")
	SongListButton:SetWidth(128)
	SongListButton:SetPoint("TOPLEFT", BloodlustSongListButtonDescription, "BOTTOMLEFT", 0, -8)
	SongListButton.text = _G["SongListButton".."Text"]
	SongListButton:SetText("Song List")
	SongListButton:SetScript("OnClick", function(self, arg1)
	 	InterfaceOptionsFrame_OpenToCategory(BloodlustMusic.songpanel);
	end)

	local BloodlustSoundResetDescription = BloodlustMusic.panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSoundResetDescription:SetPoint("TOPLEFT", SongListButton, "BOTTOMLEFT", 0, -15)
	BloodlustSoundResetDescription:SetWidth(600)
	BloodlustSoundResetDescription:SetJustifyH("LEFT")
	BloodlustSoundResetDescription:SetText("Sound not reset properly after Hero? Try setting your in-game volume at Main Menu -> System -> Sound to your preferred normal level, then click the button below.")

	local SoundResetButton = CreateFrame("Button","SoundResetButton", BloodlustMusic.panel,"UIPanelButtonTemplate")
	SoundResetButton:SetWidth(128)
	SoundResetButton:SetPoint("TOPLEFT", BloodlustSoundResetDescription, "BOTTOMLEFT", 0, -8)
	SoundResetButton.text = _G["SoundResetButton".."Text"]
	SoundResetButton:SetText("Sound Reset")
	SoundResetButton:SetScript("OnClick", function(self, arg1)
		if (isSongPlaying) then
			print(announcerHeader .. "Resetting prevented, please try again after Hero has ended")
		else
		BloodlustSoundchannelscache = GetCVar("Sound_NumChannels")
		BloodlustVolumecache = tonumber(GetCVar(BloodlustMusic.soundVolumeTable[BloodlustSoundchannelNumber]))
		print(announcerHeader .. "Regular volume level for "  .. BloodlustMusic.soundChannelNames[BloodlustSoundchannelNumber] .. " is now set to: " .. math.floor(BloodlustVolumecache*100) .. "%")
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
					getglobal("SongCheckbox "..a):SetChecked(BloodlustMusicSongEnabledTable[a]);
				end

				RightSongCheckbox:SetScript("OnClick", function(self,event,arg1)
					if (self:GetChecked()) then
						BloodlustMusicSongEnabledTable[a] = true;
					else
						BloodlustMusicSongEnabledTable[a] = false;
					end
				end)
			end
		end

		local BackButton = CreateFrame("Button","BackButton", BloodlustMusic.songpanel,"UIPanelButtonTemplate")
		BackButton:SetWidth(80)
		BackButton:SetPoint("BOTTOMRIGHT",-10,10)
		BackButton.text = _G["BackButton".."Text"]
		BackButton:SetText("Back")
		BackButton:SetScript("OnClick", function(self, arg1)
			 InterfaceOptionsFrame_OpenToCategory(BloodlustMusic.panel);
		end)
	
	end


--What to do on Login, Reload or Zoning
local Loading_EventFrame = CreateFrame("Frame")
Loading_EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
Loading_EventFrame:SetScript("OnEvent",
	function(self, event, isInitialLogin, isReloadingUi)
			StopSong(false)
			f:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
			C_Timer.After(1, function()
				f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
			end)
	end)

--What to do on Logout
local Logout_EventFrame = CreateFrame("Frame")
Logout_EventFrame:RegisterEvent("PLAYER_LOGOUT")
Logout_EventFrame:SetScript("OnEvent",
	function(self, event, ...)
		StopSong(false)
	end)

--What to do when Addon loads
local BloodlustStartingFrame = CreateFrame("FRAME", "BloodlustMusic"); 
BloodlustStartingFrame:RegisterEvent("ADDON_LOADED");
local function BloodlustStartingFrame_OnEvent(self, event, ...)
	if (event == "ADDON_LOADED") and (... == "BloodlustMusic") then
		-- Our saved variables are ready at this point. If a variable is missing, create defaults
		if (not BloodlustMusicSongEnabledTable) then
			BloodlustMusicSongEnabledTable = { };

			for a, c in ipairs(BloodlustMusic.songPathTable) do
				BloodlustMusicSongEnabledTable [a] = true
			end
		end

		if (table.getn(BloodlustMusicSongEnabledTable) < table.getn(BloodlustMusic.songPathTable)) then
			print(announcerHeader .. "New songs were probably added. Fixing some stuff")
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



