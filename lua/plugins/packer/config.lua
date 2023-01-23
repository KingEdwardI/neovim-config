-- can't use invariant_require here because of dependency cycles
local present, telescope = pcall(require, 'telescope')

if present then
  telescope.load_extension('packer')
end
