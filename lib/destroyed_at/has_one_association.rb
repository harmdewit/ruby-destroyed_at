module DestroyedAt
  module HasOneAssociation
    def delete(method = options[:dependent])
      if DestroyedAt.has_destroy_at?(target) && load_target && method == :destroy
        DestroyedAt.destroy_target_of_association(owner, target)
      else
        super
      end
    end
  end
end

ActiveRecord::Associations::HasOneAssociation.send(:prepend, DestroyedAt::HasOneAssociation)
