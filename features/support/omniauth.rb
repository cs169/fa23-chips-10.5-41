# frozen_string_literal: true

OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                     provider: 'google_oauth2',
                                                                     uid:      '123',
                                                                     info:     { email: 'test@example.com' }
                                                                   })

OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                                              provider: 'github',
                                                              uid:      '456',
                                                              info:     { email: 'test@example.com' }
                                                            })
