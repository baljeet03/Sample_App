module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    # gravatar_url = "http://shushi168.com/data/out/11/38012635-apple-image.png"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
