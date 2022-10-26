local status, hopmotion = pcall(require, 'hop')
if not status then return end

hopmotion.setup({
	jump_on_sole_occurrence = true,
})

