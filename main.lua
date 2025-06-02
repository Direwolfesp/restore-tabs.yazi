local function fail(s, ...) ya.notify { title = "restore-session.yazi", content = string.format(s, ...), timeout = 4, level = "error" } end
local function info(s, ...) ya.notify { title = "restore-session.yazi", content = string.format(s, ...), timeout = 2, level = "info" } end

-- dumps all the tabs into a file
-- it should be used as a replacement of
-- regular "quit"
local quit_and_save = ya.sync(function(state)
    -- maybe the path could be improved
    local file_name = os.getenv("HOME") .. "/.config/yazi/plugins/restore-tabs.yazi/session.txt"

    -- iterate each tab
    local output = io.open(file_name, "w")
    if output ~= nil then
        for i=1, #cx.tabs do
            local parent = cx.tabs[i].parent.cwd
            local name = cx.tabs[i].name
            output:write(parent .. "/" .. name .. "\n")
        end
        output:close()
    else
        fail("Couldn't store session into '%s'", file_name)
    end
    ya.emit("quit", {}) -- exit
end)

-- Restores and updates the active tabs
local  restore_session = ya.sync(function(state)
    local file_name = os.getenv("HOME") .. "/.config/yazi/plugins/restore-tabs.yazi/session.txt"

    local input = io.open(file_name, "r")
    if input ~= nil then
        for line in input:lines() do
            ya.emit("tab_create", {line})
        end

        input:close()
        info("Session restored successfully")
    end
end)

return {
    entry = function(_, job)
        local action = job.args[1]
        if not action then
            return
        end

        if action == "store_session" then
            quit_and_save()
            return
        end

        if action == "restore_session" then
            restore_session()
            return
        end
    end,
}
