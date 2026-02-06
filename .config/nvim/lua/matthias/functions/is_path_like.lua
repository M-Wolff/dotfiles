function is_path_like(text)
    -- Absolute path: starts with / or ~
    if text:match("^[/~]") then
        return true
    end
    -- Relative path: ./ or ../
    if text:match("^%.%./?") or text:match("^%./") then
        return true
    end
    -- Contains at least one slash somewhere
    if text:match(".+/") then
        return true
    end
    return false
end
