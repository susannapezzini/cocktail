module CocktailsHelper
  
  def cocktail_image_path(cocktail)
    if cocktail.photo.attached?
      cl_image_path(cocktail.photo.key)
      cl_image_tag(cocktail.photo.key)
    else
      # cl_image_path('cocktail_placeholder')
      asset_path('bg.jpg')
    end
  end
end
