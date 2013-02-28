Configus.build Rails.env do
  env :production do
    admin do
      email 'admin@np.kaize.ru'
      password 'fPl7d9'
      first_name 'admin'
      last_name 'admin'
    end

    mailer do
      default_host "itc73.kaize.ru"
      default_from "noreplay@itc73.kaize.ru"
    end

    token do
      lifetime 1.hour
    end

    facebook do
      app_id ''
      app_secret ''
    end

    page_slugs [:index, :about, :contacts, :courses, :schedule]
  end

  env :development, parent: :production do
    admin do
      email 'admin@np.kaize.ru'
      password '123456'
    end

    facebook do
      app_id '387051044726059'
      app_secret '904b7c96c0042a5548b9ae85e0382591'
      #app_id '106746716171244'
      #app_secret '74d7290db6060d909dbccb70c29d907e'
    end

  end

  env :test, parent: :production do

  end

  env :staging, parent: :production do
    admin do
      email 'admin@np.kaize.ru'
      password '123456'
    end

    basic_auth do
      username 'admin'
      password '123654'
    end

    facebook do
      app_id '106746716171244'
      app_secret '74d7290db6060d909dbccb70c29d907e'
    end

  end
end
