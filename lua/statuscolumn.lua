local statuscolumn = {};

--- [[ HELPER FUNCTIONS ]]

---@param hl string
---@return string
local function set_hl (hl)
    if type(hl) ~= "string" then
        return "";
    elseif vim.fn.hlexists(hl) == 0 then
        return "";
    else
        return "%#" .. hl .. "#";
    end
end

local function clamp (value, min, max)
  return math.min(math.max(value, min), max);
end


-- [[ STATUSCOLUMN COMPONENTS]]

--- Right Border Component
---@param config statuscolumn.border
---@return string
statuscolumn.border = function (_, _, config)
  ---|fS
  local function get (entry, index)
    if vim.islist(entry) then
      local i = clamp(index, 1, #entry);
      return entry[i];
    else
      return entry;
    end
  end

  -- local hl = get(config.hl, vim.v.relnum);
  -- by adding the () it extracted the table
  local hl = get(config.hl, vim.v.relnum);
  local text = get(config.text, vim.v.relnum);

  return table.concat({
    set_hl(hl),
    text or ""
  });

  ---|fE
end

---@class statuscolumn.separator
---
---@field kind "separator"
---
--- Text to use as separator.
---@field text? string
---
--- Width of the separator.
---@field width? integer
---
--- Highlight group for the separator.
---@field hl? string


--- Spacer component
---@param config statuscolumn.separator
statuscolumn.separator = function (_, _, config)
    return table.concat({
        set_hl(config.hl),
        string.rep(config.text or " ", config.width or 1)
    });
end

---@class statuscolumn.signs
---
---@field kind "signs"


--- The sign column component
---@return string
statuscolumn.signs = function ()
    return "%s";
end

--- configuration for line number component.
---@class statuscolumn.lnum
---
--- Component identifier.
---@field kind "lnum"
---
--- Highlight group for absolute line numbers.
---@field hl? string
---
--- Highlight group for relative line numbers.
---@field rel_hl? string


--- Shows the line number component
---@param buffer integer
---@param config statuscolumn.lnum
---@return string
statuscolumn.lnum = function (buffer, _, config)
    ---@type integer Maximum number of lines in the buffer.
    local line_count = vim.api.nvim_buf_line_count(buffer);

    local num = vim.v.relnum == 0 and vim.v.lnum or vim.v.relnum;
    local hl = vim.v.relnum == 0 and config.hl or config.rel_hl;

    return table.concat({
        set_hl(hl),
        "%@v:lua.__to_line@",
        string.rep(" ", #tostring(line_count) - #tostring(num)),
        num,
        "%X"
    });
    -- return table.concat({
    --     set_hl(hl),
    --     string.rep(" ", #tostring(line_count) - #tostring(num)),
    --     num
    -- });
end


-- [[ SETTING UP AND ORDERING COMPONENTS]]

statuscolumn.config = {
  -- other components
  {
    kind = "separator"
  },
  {
    kind = "signs"
  },
  {
    kind = "lnum",

    hl = "Special",
    rel_hi = "Comment"
  },
  {
    kind = "border",
    -- text = "▍",
    text = "▕ ",
    -- hl = "Comment"
    -- hl = "Special"

    -- All this does is specify a list of gradient colors(hl groups) instead of one color like above
    -- hl = function()
    --   local _o = {};
    --   ---@type string
    --   local mode = vim.api.nvim_get_mode().mode;
    --   -- local USE = gradient_map[mode] or gradient_map.default
    --   local USE = gradient_map.default
    --
    --   for g = 1, 7 do
    --     table.insert(_o, string.format(USE, g));
    --   end
    --   return _o;
    -- end

    hl = {
      "GradColor1",
      "GradColor2",
      "GradColor3",
      "GradColor4",
      "GradColor5",
      "GradColor6",
      "GradColor7",
    }


  },
};

-- [[ CREATE STATUSCOLUMN STRING (WILL RUN FOR EACH LINE) ]]

--- Function to create the statuscolumn.
---@return string
statuscolumn.render = function ()
    local _statuscolumn = "";

    --- Window whose statuscolumn we are
    --- creating.
    --- No, this is not a typo.
    ---@type integer
    local window = vim.g.statusline_winid;

    --- Buffer of the window.
    ---@type integer
    local buffer = vim.api.nvim_win_get_buf(window);

    for _, component in ipairs(statuscolumn.config) do
        local success, part_text = pcall(statuscolumn[component.kind], buffer, window, component);

        if success then
            --- Only add text if a function doesn't fail.
            _statuscolumn = _statuscolumn .. part_text;
        end
    end

    return _statuscolumn;
end


-- [[ MAIN SETUP FUNCTION ]]

statuscolumn.setup = function (config)
    if type(config) == "table" then
        statuscolumn.config = vim.tbl_deep_extend("force", statuscolumn.config, config);
    end

    -- vim.cmd [[highlight GradColor1 guifg=#3B82F6]]
    -- vim.cmd [[highlight GradColor2 guifg=#5A6DFE]]
    -- vim.cmd [[highlight GradColor3 guifg=#7B58FF]]
    -- vim.cmd [[highlight GradColor4 guifg=#9B44FF]]
    -- vim.cmd [[highlight GradColor5 guifg=#B736F0]]
    -- vim.cmd [[highlight GradColor6 guifg=#D427D1]]
    -- vim.cmd [[highlight GradColor7 guifg=#F214B5]]

    -- vim.cmd [[highlight GradColor1 guifg=#fc607d]]  -- bright blue
    -- vim.cmd [[highlight GradColor2 guifg=#ef6288]]
    -- vim.cmd [[highlight GradColor3 guifg=#e06495]]
    -- vim.cmd [[highlight GradColor4 guifg=#c667ac]]
    -- vim.cmd [[highlight GradColor5 guifg=#b869b8]]
    -- vim.cmd [[highlight GradColor6 guifg=#a56bc8]]
    -- vim.cmd [[highlight GradColor7 guifg=#8c6ede]]  -- red-orange

    -- Gradients for the line
    vim.cmd [[highlight GradColor1 guifg=#82aaff]]
    vim.cmd [[highlight GradColor2 guifg=#82aaff]]
    vim.cmd [[highlight GradColor3 guifg=#81a8fc]]
    vim.cmd [[highlight GradColor4 guifg=#7a99e7]]
    vim.cmd [[highlight GradColor5 guifg=#7188cd]]
    vim.cmd [[highlight GradColor6 guifg=#6979b8]]
    vim.cmd [[highlight GradColor7 guifg=#646ea8]]

    vim.o.relativenumber = true;
    vim.o.numberwidth = 1;
    vim.o.statuscolumn = "%!v:lua.require('statuscolumn').render()"; -- Renders for each line
end

return statuscolumn;
