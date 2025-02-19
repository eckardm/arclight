# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Item breadcrumb', type: :feature do
  it 'results page shows navigable breadcrumbs' do
    visit search_catalog_path q: 'expansion', search_field: 'all_fields'
    document = page.all('article').find do |doc|
      doc.all('h3 a', text: 'Phase II: Expansion').present?
    end

    within document do
      within '.breadcrumb-links' do
        expect(page).to have_css 'a', text: 'Alpha Omega Alpha Archives'
        expect(page).to have_css 'a', text: 'Series I: Administrative Records'
        expect(page).to have_css 'a', text: 'Reports'
        expect(page).to have_css 'a', text: 'Expansion Plan'
        click_link 'Expansion Plan'
      end
    end
    expect(page).to have_css 'h1', text: 'Expansion Plan'
  end
  it 'show page breadcrumbs' do
    visit solr_document_path id: 'aoa271aspace_e8755922a9336970292ca817983e7139'
    expect(page).to have_css 'li.breadcrumb-item a', count: 6
  end
end
