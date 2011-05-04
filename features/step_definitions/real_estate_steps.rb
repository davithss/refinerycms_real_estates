Given /^I have no real_estates$/ do
  RealEstate.delete_all
end

Given /^I (only )?have real_estates titled "?([^\"]*)"?$/ do |only, titles|
  RealEstate.delete_all if only
  titles.split(', ').each do |title|
    RealEstate.create(:house => title)
  end
end

Then /^I should have ([0-9]+) real_estates?$/ do |count|
  RealEstate.count.should == count.to_i
end
