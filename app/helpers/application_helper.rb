module ApplicationHelper
  def page_title
    title = "とあるアニメの評価目録"
    title = @page_title + " - " + title if @page_title
    title
  end
end
