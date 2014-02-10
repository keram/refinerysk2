begin
  if Refinery::Page.any?
    puts 'destroy them'
    Refinery::Page.all.each do |page|
      page.deletable = true
      page.destroy!
    end
  end
rescue
  puts $!
end

plugin = Refinery::Plugins['blog']

pages = {
  blog: {
    title: 'Blog',
    deletable: true,
    custom_slug: 'blog',
    plugin_page_id: plugin.name
  },
  archive: {
    title: 'Archive',
    parent: :blog,
    deletable: true,
    show_in_menu: false,
    custom_slug: 'archive',
    plugin_page_id: "#{plugin.name}_archive"
  }
}

Refinery::Pages.seed(plugin, pages)
