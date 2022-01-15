class Homepage < ApplicationRecord
  belongs_to :store


  def url_type_to_jp
    if url_type == 0
      return "HP"

    elsif url_type == 1
      return "Twitter"

    elsif url_type == 2
      return "Instagram"

    elsif url_type == 3
      return "Facebook"

    elsif url_type == 4
      return "LINE"

    else
      return "その他"
    end
  end
end
