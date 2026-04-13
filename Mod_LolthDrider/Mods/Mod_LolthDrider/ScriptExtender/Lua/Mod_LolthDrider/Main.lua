-- DialogEnded((DIALOGRESOURCE)_Dialog, (INTEGER)_InstanceID)
Ext.Osiris.RegisterListener("DialogEnded", 2, "before", function(dialog, instanceID)
	if (dialog == "UND_SwordInStone_210ffd6c-63e7-02c1-cd28-e27207511638" and GetFlag("Mod_LlothDrider_Transformation_d271f5bf-6c5d-46cf-82cd-af265ff0ecbc", "NULL_00000000-0000-0000-0000-000000000000") == 1) then
		ClearFlag("Mod_LlothDrider_Transformation_d271f5bf-6c5d-46cf-82cd-af265ff0ecbc", "NULL_00000000-0000-0000-0000-000000000000")
		local c = Ext.Entity.Get(Osi.GetHostCharacter())
		
		Osi.Transform(Osi.GetHostCharacter(), "8b5dd41b-73a5-4d1a-9d00-7be4f28184f2", "3f12cca0-6173-4bcc-96f3-bffa4dd919ba")
		
		--[[
		local bt = c:GetComponent("BodyType")
		bt["BodyType"] = 0
		bt["BodyType2"] = 0
		c:Replicate("BodyType")
		
		local ccs = c:GetComponent("CharacterCreationStats")
		ccs["BodyShape"] = 0
		ccs["BodyType"] = 0
		ccs["Race"] = "b5e411bd-a0ed-45ca-a679-b4b3ba571f3e"		
        ccs["SubRace"] = "00000000-0000-0000-0000-000000000000"
		c:Replicate("CharacterCreationStats")
		
		local gov = c:GetComponent("GameObjectVisual")
		gov["Icon"] = "d912f485-5fb8-ce4e-beb5-b836bebb16b3-_(Icon_Spider_Normal)"
		gov["RootTemplateId"] = "8b5dd41b-73a5-4d1a-9d00-7be4f28184f2"
		c:Replicate("GameObjectVisual")
		
		local r = c:GetComponent("Race")
		r["Race"] = "b5e411bd-a0ed-45ca-a679-b4b3ba571f3e"		
		c:Replicate("Race")
		
		local cca = c:GetComponent("CharacterCreationAppearance")
		cca["Elements"] = {}
		cca["Visuals"] = {}
		cca["EyeColor"] = "00000000-0000-0000-0000-000000000000"
		cca["HairColor"] = "00000000-0000-0000-0000-000000000000"
		cca["SecondEyeColor"] = "00000000-0000-0000-0000-000000000000"
		cca["SkinColor"] = "00000000-0000-0000-0000-000000000000"
		c:Replicate("CharacterCreationAppearance")
		
		local sc = c:GetComponent("ServerCharacter")
		local ot = sc["OriginalTemplate"]
		ot["Icon"] = "d912f485-5fb8-ce4e-beb5-b836bebb16b3-_(Icon_Spider_Normal)"
		ot["Id"] = "8b5dd41b-73a5-4d1a-9d00-7be4f28184f2"
		ot["Name"] = "RACE_ArachneDrider"
		ot["Race"] = "b5e411bd-a0ed-45ca-a679-b4b3ba571f3e"
		--]]
	end
end)

Ext.Osiris.RegisterListener("UsingSpell", 5, "after", function(uuid, name, _, _, _, _)
	if name == "Mod_LlothDrider_Spell_Transformation" then
		Osi.Transform(Osi.GetHostCharacter(), "8b5dd41b-73a5-4d1a-9d00-7be4f28184f2", "3f12cca0-6173-4bcc-96f3-bffa4dd919ba")
	elseif name == "Mod_LlothDrider_Spell_Transformation_Reset" then
		RemoveTransforms(Osi.GetHostCharacter())
	end
end)

Ext.Osiris.RegisterListener("CharacterJoinedParty", 1, "after", function(character)
    local c = Osi.GetHostCharacter()
    local Spell = "Mod_LlothDrider_Spell_Container"
    if (Osi.HasSpell(c, Spell) == 0) then
		Osi.AddSpell(c, Spell, 0, 1)
    end
end)

Ext.Osiris.RegisterListener("CharacterLeftParty", 1, "after", function(character)
    local c = Osi.GetHostCharacter()
    local Spell = "Mod_LlothDrider_Spell_Container"
    if (Osi.HasSpell(c, Spell) == 1) then
		Osi.RemoveSpell(c, Spell, 1)
    end
end)