class Passnger < ApplicationRecord
  belongs_to :booking
end

# Sort out Rails Associations
# Make sure the migration makes sense and supports the asssociations
# Add some ActiveRecord validations for the models
# Test the relations inside Console before working on the controller.