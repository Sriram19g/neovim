local M = {}

function M.run_and_test()
    local file = vim.fn.expand("%:p")
    local filename = vim.fn.expand("%:t:r")
    local compile_cmd = string.format("g++ %s -o %s", file, filename)
    local run_cmd = string.format("./%s < input.txt > output.txt", filename)

    vim.cmd("w") -- Save current file

    -- Compile
    local compile_output = vim.fn.system(compile_cmd)
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({ { "❌ Compilation Failed", "ErrorMsg" } }, true, {})
        print(compile_output)
        return
    end

    -- Run
    vim.fn.system(run_cmd)

    -- Reload output.txt buffer if it's open
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local name = vim.api.nvim_buf_get_name(buf)
        if name:match("output.txt$") and vim.api.nvim_buf_is_loaded(buf) then
            -- Reload buffer from disk and scroll to bottom
            vim.api.nvim_buf_call(buf, function()
                vim.cmd("checktime")
                vim.cmd("normal! G")
            end)
        end
    end

    vim.api.nvim_echo({ { "✅ Compiled and ran successfully. Output written to output.txt", "Normal" } }, true, {})
end

return M
