local api = vim.api

api.nvim_create_user_command("Q", "q", {})
api.nvim_create_user_command("W", "w", {})
api.nvim_create_user_command("Wq", "wq", {})
api.nvim_create_user_command("WQ", "wq", {})
api.nvim_create_user_command("Qa", "qa", {})
api.nvim_create_user_command("QA", "qa", {})
