-- Contains the color config for the editor
function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
