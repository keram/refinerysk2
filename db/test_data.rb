require 'factory_girl_rails'

FactoryGirl.define do
  factory :page, :class => Refinery::Page do
    sequence(:title) { |n| "majka #{n}" }
    status 'draft'
    deletable false
    show_in_menu true
  end

end


# source_dates = (-50..400).to_a
# (1..500).each do |i|

# FactoryGirl.build_list(:blog_category, 10)

def children_for page, title
  page.children.create({
      :title => title,
      :deletable => true,
      :status => 'live',
      :show_in_menu => true,
      :parent_id => page.id
  })
end

def childrens_for page, number=5
  if number > 0
    (1..number).each do |i|
      child = children_for page, "x #{i} child of #{page.id}"
      childrens_for child, [rand(1..5), number - 1].min
    end
  end
end

 (1..2).each do |i|

 attributes = {
      :deletable => true,
      :status => 'live',
      :show_in_menu => true,
      :parent_id => nil
  }

  page = FactoryGirl.create(:page, attributes)
  childrens_for page
end
p 'done'
