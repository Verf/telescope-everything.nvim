local has_telescope, _ = pcall(require, "telescope")
if not has_telescope then
	error("This plugin requires nvim-telescope/telescope.nvim")
end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local make_entry = require("telescope.make_entry")

local flatten = vim.tbl_flatten

local es_config = {
	max_results = 100,
}

local function es_setup(ext_config)
	for k, v in pairs(ext_config) do
		es_config[k] = v
	end
end

local run = function(opts)
	opts = vim.tbl_deep_extend("force", es_config, opts or {})
	local find_command = { "es" }
	if opts.case_sensitive then
		table.insert(find_command, "-case")
	end
	if opts.whole_word then
		table.insert(find_command, "-whole-word")
	end
	if opts.match_path then
		table.insert(find_command, "-match-path")
	end
	if opts.sort then
		table.insert(find_command, "-s")
	end
	if opts.offset then
		table.insert(find_command, "-offset")
		table.insert(find_command, tostring(opts.offset))
	end
	if opts.max_results then
		table.insert(find_command, "-max-results")
		table.insert(find_command, tostring(opts.max_results))
	end
	pickers.new(opts, {
		prompt_title = "Everything",
		finder = finders.new_job(function(prompt)
			if prompt then
				return flatten({ find_command, prompt })
			end
			return find_command
		end, opts.entry_maker or make_entry.gen_from_file(opts)),
		previewer = conf.file_previewer(opts),
		sorter = conf.file_sorter(opts),
	}):find()
end

return require("telescope").register_extension({
	setup = es_setup,
	exports = {
		everything = run,
	},
})
