class Task < ApplicationRecord

    FORMAT = AutoHtml::Pipeline.new(
    	AutoHtml::HtmlEscape.new,
    	AutoHtml::Image.new,
    	AutoHtml::YouTube.new(width: "100%", height: "250"),
    	AutoHtml::Link.new(target: "_blank", rel: "nofollow"),
    	AutoHtml::SimpleFormat.new)

    belongs_to :user

    def content=(t)
    	super(t)
    	self[:content_html] = FORMAT.call(t)
    end
end
