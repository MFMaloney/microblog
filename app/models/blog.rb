class Blog < ActiveRecord::Base
 belongs_to :user

 validates(:text,
 			presence: true,
 			length: {maximum: 140})

 has_attached_file :avatar, styles:
   {medium: "300x300>", thumb: "100x100>"},
   default_url: ':style/missing.png',
   storage: :s3,
   s3_credentials: Proc.new{|a| a.instance.s3_credentials }
   		def s3_credentials
   			{bucket: "enzisbucket",
   			access_key_id: "AKIAJ66N3AXA4NNQ6VGQ",
   	        secret_access_key: "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"}
   	    end
   
   validates_attachment_content_type :avatar,
   content_type: /\Aimage\/.*\Z/

 def text_and_author
 	"#{text} by #{user.email}"
 end
end
