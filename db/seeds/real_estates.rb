User.all.each do |user|
  if user.plugins.where(:name => 'real_estates').blank?
    user.plugins.create(:name => 'real_estates',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Real Estates',
  :link_url => '/real_estates',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/real_estates(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
