module UserIdentities
  module Github
    extend ActiveSupport::Concern

    included do
      self::PROVIDERS << :github
    end

    module ClassMethods
      def create_with_omniauth_github(auth)
        self.create(
          uid: auth['uid'],
          name: auth['info']['name'],
          nickname: auth['info']['nickname'],
          avatar_url: auth['extra']['raw_info']['avatar_url'],
          email: auth['info']['email'],
          token: auth['credentials']['token']
        )
      end

      def update_with_omniauth_github(resource, auth)
        resource.update(
          name: auth['info']['name'],
          nickname: auth['info']['nickname'],
          avatar_url: auth['extra']['raw_info']['avatar_url'],
          email: auth['info']['email'],
          token: auth['credentials']['token']
        )
      end
    end

  end
end
