Given /^I have no categories$/ do
  Category.delete_all
end

Given /^I (only )?have categories titled "?([^\"]*)"?$/ do |only, titles|
  Category.delete_all if only
  titles.split(', ').each do |title|
    Category.create(:title => title)
  end
end

Then /^I should have ([0-9]+) categor[y|ies]+?$/ do |count|
  Category.count.should == count.to_i
end
