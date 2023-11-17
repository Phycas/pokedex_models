module PokedexModels
    class Pokemon
      include Mongoid::Document
      
      field :number, type: Integer
      field :name, type: String
      field :type, type: String
  
      validates :number, :name, :type, presence: true
    end
  end
  