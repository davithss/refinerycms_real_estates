class RealEstatesController < ApplicationController

  before_filter :find_all_real_estates
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @real_estate in the line below:
    present(@page)
  end

  def show
    @real_estate = RealEstate.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @real_estate in the line below:
    present(@page)
  end

protected

  def find_all_real_estates
    @real_estates = RealEstate.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/real_estates").first
  end

end
