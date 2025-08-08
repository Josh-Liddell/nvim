local statuscolumn = {};


local gradient_map = {
  default = "BarsNormal%d",

  ["v"] = "BarsVisual%d",
  ["V"] = "BarsVisualLine%d",
  [""] = "BarsVisualBlock%d",

  ["s"] = "BarsVisual%d",
  ["S"] = "BarsVisualLine%d",
  [""] = "BarsVisualBlock%d",

  ["i"] = "BarsInsert%d",
  ["ic"] = "BarsInsert%d",
  ["ix"] = "BarsInsert%d",

  ["R"] = "BarsInsert%d",
  ["Rc"] = "BarsInsert%d",

  ["c"] = "BarsCommand%d",
  ["!"] = "BarsCommand%d",
};



--- Helper function for applying
--- highlight groups.
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

--- Border.
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
  local raw_hl = config.hl
  if type(raw_hl) == "function" then
    raw_hl = raw_hl()
  end
  local hl = get(raw_hl, vim.v.relnum)

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


--- The sign column.
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


--- Shows the line number.
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

--- Optional, configuration table.
--- Add this if you like tinkering.
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
    -- It can also be a list of highlight groups........
    hl = function()
      local _o = {};
      ---@type string
      local mode = vim.api.nvim_get_mode().mode;
      local USE = gradient_map[mode] or gradient_map.default

      for g = 1, 7 do
        table.insert(_o, string.format(USE, g));
      end
      return _o;
    end
  },
};

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

--- Optional, setup function.
statuscolumn.setup = function (config)
    if type(config) == "table" then
        statuscolumn.config = vim.tbl_deep_extend("force", statuscolumn.config, config);
    end

    vim.o.relativenumber = true;
    vim.o.numberwidth = 1;
    vim.o.statuscolumn = "%!v:lua.require('statuscolumn').render()";
end

return statuscolumn;
