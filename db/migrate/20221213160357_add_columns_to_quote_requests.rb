class AddColumnsToQuoteRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :quote_requests, :response_status, :boolean, default: false
    add_column :quote_requests, :response_comment, :text
  end
end
