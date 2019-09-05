# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Grouped search results', type: :feature do
  it 'displays collection group information' do
    visit search_catalog_path q: 'alpha', group: 'true'
    within '.al-grouped-title-bar' do
      expect(page).to have_css 'h3', text: /Alpha/
      expect(page).to have_css '.al-document-abstract-or-scope', text: /founded in 1902/
      expect(page).to have_css '.badge', text: '15.0 linear feet (36 boxes + oversize folder)'
    end
    within '.grouped-documents' do
      expect(page).to have_css 'article', count: 3
    end
  end
end
