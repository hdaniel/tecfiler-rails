migration 1, :add_users do

  up do
    create_table(:users) do |t|
      
      column :id, Integer, :serial => true

      column :username, String

      ## Database authenticatable
      column :email, String,              :null => false, :default => ""
      column :encrypted_password, String, :null => false, :default => ""

      ## Recoverable
      column :reset_password_token, String
      column :reset_password_sent_at, DateTime

      ## Rememberable
      column :remember_created_at, DateTime

      ## Trackable
      column :sign_in_count, Integer, :default => 0
      column :current_sign_in_at, DateTime
      column :last_sign_in_at, DateTime
      column :current_sign_in_ip, String
      column :last_sign_in_ip, String

      ## Confirmable
      column :confirmation_token, String
      column :confirmed_at, DateTime
      column :confirmation_sent_at, DateTime
      column :unconfirmed_email, String # Only if using reconfirmable

      ## Lockable
      column :failed_attempts, Integer, :default => 0 # Only if lock strategy is :failed_attempts
      column :unlock_token, String # Only if unlock strategy is :email or :both
      column :locked_at, DateTime

      ## Token authenticatable
      column :authentication_token, String

      column :created_at, DateTime
      column :updated_at, DateTime
    end

    # add_index :users, :email,                :unique => true
    # add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  down do
    drop_table :users
  end

end
