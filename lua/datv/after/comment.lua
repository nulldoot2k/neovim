local status, comment = pcall(require, "nvim_comment")

if not status then
  return
end

comment.setup({
  line_mapping = "<leader>/", 
  operator_mapping = "<leader>/", 
  comment_chunk_text_object = "ic"
})
