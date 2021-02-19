module CocktailsHelper

  def cocktail_image_path(cocktail, options = {})
    if cocktail.photo.attached?
      cl_image_tag(cocktail.photo.key)
    else
      # cl_image_path('cocktail_placeholder')
      image_tag 'bg.jpg', options
    end
  end

  def cocktail_asset_path(cocktail)
    if cocktail.photo.attached?
      cl_image_path(cocktail.photo.key)
    else
      asset_path('bg.jpg')
    end
  end
end
