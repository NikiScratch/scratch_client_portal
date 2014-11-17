OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '57a1j5BWUwnUBsVVhVQefQOWt', '4Zq68nxwwheKuFScaAy63YXpEaqOT6bTUtkxzemMuPf70r1fDD'
  provider :facebook, '330400413787673', '072a1d9b5aaa307a3f0803008b9500ae'
  provider :identity, on_failed_registration: lambda { |env|
    IdentitiesController.action(:new).call(env)
}


OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
end