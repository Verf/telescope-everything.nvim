local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local conf = require("telescope.config").values
local make_entry = require("telescope.make_entry")

local M = {}

local es_opts = {}

function M.setup(opts)
	es_opts.case_sensitive = opts.case_sensitive or false
	es_opts.regex = opts.regex or false
	es_opts.whole_word = opts.whole_word or false
	es_opts.match_path = opts.match_path or false
	es_opts.offset = opts.offset or 0
	es_opts.max_results = opts.max_results or 100
	es_opts.sort = opts.sort or false
end

function M.everything(opts)
	local find_command = { "es" }
	if es_opts.case_sensitive then
		table.insert(find_command, "-case")
	end
	if es_opts.regex then
		table.insert(find_command, "-regex")
	end
	if es_opts.whole_word then
		table.insert(find_command, "-whole-word")
	end
	if es_opts.match_path then
		table.insert(find_command, "-match-path")
	end
	if es_opts.sort then
		table.insert(find_command, "-s")
	end
	if es_opts.offset then
		table.insert(find_command, "-offset")
		table.insert(find_command, tostring(es_opts.offset))
	end
	if es_opts.max_results then
		table.insert(find_command, "-max-results")
		table.insert(find_command, tostring(es_opts.max_results))
	end
	pickers.new(opts, {
		prompt_title = "Everything",
		finder = finders.new_job(find_command, opts.entry_maker or make_entry.gen_from_string),
		previewer = conf.grep_previewer(opts),
		sorter = sorters.highlighter_only(opts),
	}):find()
end

return require("telescope").register_extension({
	setup = M.setup,
	exports = {
		everything = M.everything,
	},
})
