# Required to allow get requests, which enables a security flaw but that's how the tutorial is set up.
OmniAuth.config.allowed_request_methods = [:post, :get]
OmniAuth.config.silence_get_warning = true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'bk1HZdrOH7Tj3n8NJ6uxs6WX0', '4UzTT6HyUCIzXNFXWFHcsxHcLRpzM47y9uKMxFSMBOT85brzNN'
end