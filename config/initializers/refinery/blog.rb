# encoding: utf-8
Refinery::Blog.configure do |config|
  config.per_page = 20

  # Configure how many records (posts/categories) per page should be displayed
  # in the list of records in the Blog admin area
  config.per_admin_page = 20

  # Supported: nil
  config.sharing_service = 'share_this'

  # Supported: ["discus"]
  config.comment_service = 'discus'
end
