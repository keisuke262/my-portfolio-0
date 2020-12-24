#CSS, Javascript, Helper関係のファイルが自動生成されない
#Routerにルーティングを自動的に追加することもない

Rails.application.config.generators do |g|
    g.stylesheets false
    g.javascripts false
    g.helper false
    g.skip_routes true
  end