class CreateGitcommits < ActiveRecord::Migration[5.2]
  def change
    create_table :gitcommits do |t|
      t.string :owner
      t.string :repo
      t.string :author_email
      t.string :commit_url
      t.string :commit_message

      t.timestamps
    end
  end
end
