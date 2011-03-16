%% Connection Parameters
-record(apns_connection, {ssl_seed          = "someseedstring"                      :: string(),
                          apple_host        = "gateway.sandbox.push.apple.com"      :: string(),
                          apple_port        = 2195                                  :: integer(),
                          cert_file         = "priv/cert.pem"                       :: string(),
                          timeout           = 30000                                 :: integer(),
                          error_fun         = fun(X,Y) -> erlang:display({X,Y}) end :: fun((binary(), apns:status()) -> stop | _),
                          feedback_host     = "feedback.sandbox.push.apple.com"     :: string(),
                          feedback_port     = 2196                                  :: integer(),
                          feedback_fun      = fun erlang:display/1                  :: fun((string()) -> _),
                          feedback_timeout  = 30*60*1000                            :: pos_integer()
                          }).
-record(apns_msg, {id = apns:message_id()   :: binary(),
                   expiry = apns:expiry(60) :: non_neg_integer(), %% default = 1 minute
                   device_token             :: string(),
                   alert = none             :: none | apns:alert(),
                   badge = none             :: none | integer(),
                   sound = none             :: none | string(),
                   extra = []               :: [apns_mochijson2:json_property()]}).