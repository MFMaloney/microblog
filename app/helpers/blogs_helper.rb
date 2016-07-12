module BlogsHelper
	def edit_blog_link(blog)
		link_to("Edit This Blog", edit_blog_url(blog))
	end
end
