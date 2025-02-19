# frozen_string_literal: true

require 'spec_helper'

describe 'Document Tools', type: :feature do
  context 'in search results' do
    it 'renders the bookmark option in the title bar for all documents' do
      visit search_catalog_path q: '', search_field: 'all_fields'

      expect(page).to have_css('.al-document-title-bar form.bookmark-toggle', count: 10)
    end
  end

  context 'on the record view' do
    before { visit solr_document_path(doc_id) }

    context 'for collections' do
      let(:doc_id) { 'aoa271' }

      it 'does not render the bookmark option' do
        expect(page).not_to have_css('.al-document-title-bar form.bookmark-toggle')
      end
    end

    context 'for compontents' do
      let(:doc_id) { 'm0198-xmlaspace_ref11_d0s' }

      pending 'renders the bookmark option' do
        expect(page).to have_css('.al-document-title-bar form.bookmark-toggle')
      end
    end
  end
end
