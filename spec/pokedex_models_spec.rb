# spec/pokemon_spec.rb

require 'spec_helper'
require_relative '../lib/app/models/pokemon'

RSpec.describe PokedexModels::Pokemon do
  describe 'attributes' do
    it 'has name field' do
      pokemon = PokedexModels::Pokemon.new
      expect(pokemon).to respond_to(:name)
    end

    it 'has type field' do
      pokemon = PokedexModels::Pokemon.new
      expect(pokemon).to respond_to(:type)
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      pokemon = PokedexModels::Pokemon.new(name: nil, type: 'Fire')
      expect(pokemon).not_to be_valid
    end

    it 'validates presence of type' do
      pokemon = PokedexModels::Pokemon.new(name: 'Charmander', type: nil)
      expect(pokemon).not_to be_valid
    end

    # TODO: Add more validation tests as needed
  end
end
