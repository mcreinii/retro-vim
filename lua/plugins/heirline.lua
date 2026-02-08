-- [ Statusline - heirline.nvim ]
local conditions = require('heirline.conditions')

local nvim_modes = {
	init = function(self) self.mode = vim.fn.mode(1) end,
	static = {
		mode_names = {
			n = '[ NORMAL ]',
			no = '[ OP-PENDING ]',
			nov = '[ OP-PENDING (char) ]',
			noV = '[ OP-PENDING (line) ]',
			['no\22'] = '[ OP-PENDING (block) ]',
			niI = '[ NORMAL (insert) ]',
			niR = '[ NORMAL (replace) ]',
			niV = '[ NORMAL (virtual-replace) ]',
			nt = '[ TERMINAL-NORMAL ]',

			v = '[ VISUAL ]',
			vs = '[ VISUAL (select) ]',
			V = '[ VISUAL-LINE ]',
			Vs = '[ VISUAL-LINE (select) ]',
			['\22'] = '[ VISUAL-BLOCK ]',
			['\22s'] = '[ VISUAL-BLOCK (select) ]',

			s = '[ SELECT ]',
			S = '[ SELECT-LINE ]',
			['\19'] = '[ SELECT-BLOCK ]',

			i = '[ INSERT ]',
			ic = '[ INSERT (compl-generic) ]',
			ix = '[ INSERT (compl-menu) ]',

			R = '[ REPLACE ]',
			Rc = '[ REPLACE (compl-generic) ]',
			Rx = '[ REPLACE (compl-menu) ]',
			Rv = '[ VIRTUAL-REPLACE ]',
			Rvc = '[ VIRTUAL-REPLACE (compl-generic) ]',
			Rvx = '[ VIRTUAL-REPLACE (compl-menu) ]',

			c = '[ COMMAND ]',
			cv = '[ EX-MODE ]',
			r = '[ HIT-ENTER ]',
			rm = '[ --MORE-- ]',
			['r?'] = '[ CONFIRM ]',
			['!'] = '[ SHELL ]',
			t = '[ TERMINAL ]',
		},
	},
	provider = function(self) return self.mode_names[self.mode] end,
	update = {
		'ModeChanged',
		pattern = '*:*',
		callback = vim.schedule_wrap(function() vim.cmd('redrawstatus') end),
	},
}

local filename = {
	provider = function()
		local fname = vim.fn.expand('%:~:.')
		if fname == '' then fname = '' end
		return fname
	end,
	flexible = 2,
	{ provider = '%<' },
}

local git_diff = {
	condition = conditions.is_git_repo(),

	init = function(self) self.status_dict = vim.b.gitsigns_status_dict or {} end,

	{
		provider = function(self)
			local head = self.status_dict.head or '?'
			return 'GIT:' .. head .. ' '
		end,
		hl = { bold = true },
	},

	{
		provider = function(self)
			local n = self.status_dict.added or 0
			return n > 0 and ('[+]%d'):format(n) or ''
		end,
	},

	{
		provider = function(self)
			local n = self.status_dict.changed or 0
			return n > 0 and ('[~]%d'):format(n) or ''
		end,
	},

	{
		provider = function(self)
			local n = self.status_dict.removed or 0
			return n > 0 and ('[-]%d'):format(n) or ''
		end,
	},

	{ provider = '%<' },
}

local diagnostics = {
	condition = conditions.has_diagnostics(),

	init = function(self)
		local c = vim.diagnostic.count(0) or {}
		self.errors = c[vim.diagnostic.severity.ERROR] or 0
		self.warnings = c[vim.diagnostic.severity.WARN] or 0
		self.info = c[vim.diagnostic.severity.INFO] or 0
		self.hints = c[vim.diagnostic.severity.HINT] or 0
	end,

	update = { 'DiagnosticChanged', 'BufEnter' },

	provider = function(self)
		local parts = {}

		if (self.warnings or 0) > 0 then table.insert(parts, 'WARN:' .. self.warnings) end

		if (self.errors or 0) > 0 then table.insert(parts, 'ERROR:' .. self.errors) end

		if (self.info or 0) > 0 then table.insert(parts, 'INFO:' .. self.info) end

		if (self.hints or 0) > 0 then table.insert(parts, 'HINT:' .. self.hints) end

		return table.concat(parts, ' ')
	end,
}

local recording = {
	provider = function() return vim.fn.reg_recording() ~= '' and 'RECORDING' or '' end,
}

local lsp_status = {
	static = {},
	provider = function(self)
		self.clients = {}
		for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
			if client.name ~= 'null-ls' and client.name ~= 'copilot' then table.insert(self.clients, client.name) end
		end
	end,

	{
		flexible = 3,
		{
			provider = function(self)
				if #self.clients == 0 then return 'LSP:INACTIVE' end
				return 'LSP:ACTIVE'
			end,
		},
	},
	update = {
		'LspAttach',
		'BufEnter',
		'BufLeave',
	},
}

local statusline = {
	{ provider = ' ' },
	nvim_modes,
	{ provider = ' ' },
	filename,
	{ provider = ' ' },
	git_diff,
	{ provider = '%=' },
	diagnostics,
	{ provider = ' ' },
	recording,
	{ provider = ' ' },
	lsp_status,
}

require('heirline').setup({ statusline = statusline })
