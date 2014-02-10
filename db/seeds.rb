# Refinery::Page.all.each {|p| p.deletable = true; p.save; p.reload; p.destroy!; }
#
# # Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed
#
# # Added by Refinery CMS Blog extension
Refinery::Blog::Engine.load_seed

pages_plugin = Refinery::Plugins['pages']

pages = {
  home: {
    title: { sk: 'Úvod', en: 'Home' },
  },
  not_found: {
    title: { sk: 'Stránka nenájdená', en: 'Page not found' },
  },
  presentations: {
    title: { sk: 'Prezentácie a návody', en: 'Presentations' },
    status: 'live'
  },
  about: {
    title: { sk: 'O nás', en: 'About Us' },
    status: 'live',
    show_in_menu: false,
  },
  colophon: {
    title: { sk: 'Tiráž', en: 'Colophon' },
    status: 'live'
  },
  contact: {
    title: { sk: 'Kontakt', en: 'Contact' },
    status: 'live',
    deletable: true,
    show_in_menu: true
  },
  blog_archive: {
    title: { sk: 'Archív', en: 'Archive' },
    custom_slug: { sk: 'archiv', en: 'archive' }
  }
}


def import_users
  users = [
    {username: 'admin', email: 'admin@refinery.sk', roles: [:superuser, :refinery]},
    {username: 'editor', email: 'editor@refinery.sk', roles: [:refinery]}
  ]

  users.each do |user|
    u = Refinery::User.find_by_email(user[:email])
    roles = user.delete(:roles)

    unless u
      p = (Rails.env.production? && false) ? (0...32).map{ ('a'..'z').to_a[rand(26)] }.join : 'nbusr123'
      u = Refinery::User.create(user.merge({password: p, password_confirmation: p}))
      puts "User \"#{user[:username]}\" with email \"#{user[:email]}\" was created."
    end

    roles.each do |r|
      u.add_role(r)
    end

    u.plugins = Refinery::Plugins.registered.in_menu.sort_by {|p| p.position }.map(&:name)
  end
end

import_users

Refinery::Pages::Import.new(pages_plugin, pages).run



# Added by Refinery CMS Imageable extension
Refinery::Imageable::Engine.load_seed

# Added by RefineryCMS Snippets engine
Refinery::Snippets::Engine.load_seed
