-- Seperator Block
function SeperatorText()
    local input = vim.fn.input("Geben Sie den Text ein: ")
    local line_len = 80
    local new_line = ""
    if input == "" then
        new_line = string.rep("#", line_len)
    else
        local pad = math.floor((line_len - #input - 2) / 2)
        new_line = string.rep("#", pad) .. " " .. input .. " " .. string.rep("#", pad)
        if #new_line < line_len then
            new_line = new_line .. "#"
        end
    end
    vim.api.nvim_set_current_line(new_line)
end
