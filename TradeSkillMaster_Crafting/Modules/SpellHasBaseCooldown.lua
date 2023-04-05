-- load the parent file (TSM) into a local variable
local TSM = select(2, ...)

TSM.SpellHasBaseCooldown = {
	-- Alchemy
	[11479] = true, -- Transmute: Iron to Gold
	[11480] = true, -- Transmute: Mithril to Truesilver
	[17187] = true, -- Transmute: Arcanite
	[17559] = true, -- Transmute: Air to Fire
	[17560] = true, -- Transmute: Fire to Earth
	[17561] = true, -- Transmute: Earth to Water
	[17562] = true, -- Transmute: Water to Air
	[17563] = true, -- Transmute: Undeath to Water
	[17564] = true, -- Transmute: Water to Undeath
	[17565] = true, -- Transmute: Life to Earth
	[17566] = true, -- Transmute: Earth to Life
	[25146] = true, -- Transmute: Elemental Fire
	[28566] = true, -- Transmute: Primal Air to Fire
	[28567] = true, -- Transmute: Primal Earth to Water
	[28568] = true, -- Transmute: Primal Fire to Earth
	[28569] = true, -- Transmute: Primal Water to Air
	[28580] = true, -- Transmute: Primal Shadow to Water
	[28581] = true, -- Transmute: Primal Water to Shadow
	[28582] = true, -- Transmute: Primal Mana to Fire
	[28583] = true, -- Transmute: Primal Fire to Mana
	[28584] = true, -- Transmute: Primal Life to Earth
	[28585] = true, -- Transmute: Primal Earth to Life
	[29688] = true, -- Transmute: Primal Might
	[32765] = true, -- Transmute: Earthstorm Diamond
	[32766] = true, -- Transmute: Skyfire Diamond
	[53771] = true, -- Transmute: Eternal Life to Shadow
	[53773] = true, -- Transmute: Eternal Life to Fire
	[53774] = true, -- Transmute: Eternal Fire to Water
	[53775] = true, -- Transmute: Eternal Fire to Life
	[53776] = true, -- Transmute: Eternal Air to Water
	[53777] = true, -- Transmute: Eternal Air to Earth
	[53779] = true, -- Transmute: Eternal Shadow to Earth
	[53780] = true, -- Transmute: Eternal Shadow to Life
	[53781] = true, -- Transmute: Eternal Earth to Air
	[53782] = true, -- Transmute: Eternal Earth to Shadow
	[53783] = true, -- Transmute: Eternal Water to Air
	[53784] = true, -- Transmute: Eternal Water to Fire
	[54020] = true, -- Transmute: Eternal Might
	[57425] = true, -- Transmute: Skyflare Diamond
	[57427] = true, -- Transmute: Earthsiege Diamond
	[60350] = true, -- Transmute: Titanium
	[60893] = true, -- Northrend Alchemy Research
	[66658] = true, -- Transmute: Ametrine
	[66659] = true, -- Transmute: Cardinal Ruby
	[66660] = true, -- Transmute: King's Amber
	[66662] = true, -- Transmute: Dreadstone
	[66663] = true, -- Transmute: Majestic Zircon
	[66664] = true, -- Transmute: Eye of Zul
	[966444] = true, -- Transmute: Arcanite
	[979333] = true, -- Transmute: Flourishing Nether Vine
	[979334] = true, -- Transmute: Flourishing Twisted Root
	[979335] = true, -- Transmute: Flourishing Dread Lotus
	[979336] = true, -- Transmute: Flourishing Void Bloom
	[1979333] = true, -- Transmute: Flourishing Sanguine Vine
	[1979334] = true, -- Transmute: Flourishing Core Root
	[1979335] = true, -- Transmute: Flourishing Scourge Lotus
	[1979336] = true, -- Transmute: Flourishing Demon Bloom


	-- Blacksmithing
	[1979337] = true, -- Transmute: Pure Sanguine Metal
	[1979338] = true, -- Transmute: Pure Core Metal
	[1979339] = true, -- Transmute: Pure Scourge Metal
	[1979340] = true, -- Transmute: Pure Demon Metal


	-- Enchanting
	[979341] = true, -- Transmute: Forbidding Nether Shard
	[979342] = true, -- Transmute: Forbidding Twisted Dust
	[979343] = true, -- Transmute: Forbidding Dread Dust
	[979344] = true, -- Transmute: Forbidding Void Dust
	[1979341] = true, -- Transmute: Forbidding Sanguine Shard
	[1979342] = true, -- Transmute: Forbidding Core Dust
	[1979343] = true, -- Transmute: Forbidding Scourge Dust
	[1979344] = true, -- Transmute: Forbidding Demon Dust


	-- Engineering
	[56273] = true, -- Wormhole: Gadgetzan
	[979833] = true, -- Transmute: Pure Nether Metal
	[979834] = true, -- Transmute: Pure Twisted Metal
	[979835] = true, -- Transmute: Pure Dread Metal
	[979836] = true, -- Transmute: Pure Void Metal
	[1979833] = true, -- Transmute: Pure Sanguine Metal
	[1979834] = true, -- Transmute: Pure Core Metal
	[1979835] = true, -- Transmute: Pure Scourge Metal
	[1979836] = true, -- Transmute: Pure Demon Metal


	-- Herbalism
	[55428] = true, -- Lifeblood
	[55480] = true, -- Lifeblood
	[55500] = true, -- Lifeblood
	[55501] = true, -- Lifeblood
	[55502] = true, -- Lifeblood
	[55503] = true, -- Lifeblood


	-- Inscription
	[61177] = true, -- Northrend Inscription Research
	[61288] = true, -- Minor Inscription Research


	-- Jewelcrafting
	[47280] = true, -- Brilliant Glass
	[62242] = true, -- Icy Prism
	[979837] = true, -- Transmute: Pure Nether Metal
	[979838] = true, -- Transmute: Pure Twisted Metal
	[979839] = true, -- Transmute: Pure Dread Metal
	[979840] = true, -- Transmute: Pure Void Metal


	-- Leatherworking
	[979329] = true, -- Transmute: Full Grain Nether Leather
	[979330] = true, -- Transmute: Full Grain Twisted Leather
	[979331] = true, -- Transmute: Full Grain Dread Leather
	[979332] = true, -- Transmute: Full Grain Void Leather
	[1979329] = true, -- Transmute: Full Grain Sanguine Leather
	[1979330] = true, -- Transmute: Full Grain Core Leather
	[1979331] = true, -- Transmute: Full Grain Scourge Leather
	[1979332] = true, -- Transmute: Full Grain Demon Leather


	-- Tailoring
	[18560] = true, -- Mooncloth
	[26751] = true, -- Primal Mooncloth
	[31373] = true, -- Spellcloth
	[36686] = true, -- Shadowcloth
	[56005] = true, -- Glacial Bag
	[979325] = true, -- Transmute: Reinforced Nether Thread
	[979326] = true, -- Transmute: Reinforced Twisted Thread
	[979327] = true, -- Transmute: Reinforced Dread Thread
	[979328] = true, -- Transmute: Reinforced Void Thread
	[1979325] = true, -- Transmute: Reinforced Sanguine Thread
	[1979326] = true, -- Transmute: Reinforced Core Thread
	[1979327] = true, -- Transmute: Reinforced Scourge Thread
	[1979328] = true, -- Transmute: Reinforced Demon Thread


	-- Cooking
	[979345] = true, -- Transmute: Cured Nether Charged Steak
	[979346] = true, -- Transmute: Cured Twisted Charged Steak
	[979347] = true, -- Transmute: Cured Dread Charged Steak
	[979348] = true, -- Transmute: Cured Void Charged Steak
	[1979345] = true, -- Transmute: Cured Sanguine Imbued Steak
	[1979346] = true, -- Transmute: Cured Core Imbued Steak
	[1979347] = true, -- Transmute: Cured Scourge Charged Steak
	[1979348] = true, -- Transmute: Cured Demon Imbued Steak
}
