local status_ok, surround = pcall(require, 'mini.surround')
if not status_ok then
  return
end

surround.setup {
  opts = {
    mappings = {
      add = 'sa',
      delete = 'sd',
      find = 'sf',
      find_left = 'sF',
      highlight = 'sh',
      replace = 'sr',
      update_n_lines = 'sn',
    }
  }
}
