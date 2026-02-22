if not scrimblomod then
	scrimblomod = {}
end

local mod_path = "" .. SMODS.current_mod.path
scrimblomod.path = mod_path

--enable optional contexts
SMODS.current_mod.optional_features = {
  retrigger_joker = true,
}

--gc member pool
SMODS.ObjectType({
    key = "gcmember",
    default = "j_scring_scrimblojoker",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
    end,
})

--scrimblo addition normal pool
SMODS.ObjectType({
  key = "normalscring",
  default = "j_scring_selfone",
  cards = {},
  inject = function(self)
    SMODS.ObjectType.inject(self)
  end
})

--scrimblo addition pool
SMODS.ObjectType({
  key = "scrimbloaddition",
  default = "j_scring_zazu",
  cards = {},
  inject = function(self)
    SMODS.ObjectType.inject(self)
  end
})

--load files
local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
	print("[scrimblo mod] loading lua file " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) 
	end
	f()
end