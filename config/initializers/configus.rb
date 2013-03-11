Configus.build Rails.env do
  env :production do
    omniauth do
      path_prefix ''
    end
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
    vkontakte do
      app_id ''
      app_secret ''
    end
    twitter do
      app_id ''
      app_secret ''
    end
    github do
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
    end
    vkontakte do
      app_id '3482595'
      app_secret 'PtTG18Tfck9UZxCY9k31'
    end
    twitter do
      app_id 'OlzSS51rkR5RSYDtH3EUmQ'
      app_secret 'lPYffFLD8ENiWEAVITgv8ml5CQfek59RvzDN1fqMBg'
    end
    github do
      app_id 'cc1467fd624803fbb130'
      app_secret 'dee6f0d097cf554a6ac5e6ec0755f47fd4208170'
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
    vkontakte do
      app_id '3484081'
      app_secret '8VgqkjhO8Pw9Zxonv9zi'
    end
    twitter do
      app_id 'iBLmyTHI45Q9fC8g1mXUeg'
      app_secret 'agnRiL1gUhHl9OmNNHUrkTLKsvw9TxN7RiwJ0CHaJg'
    end
    github do
      app_id '870a8bd1f1535a4f3c98'
      app_secret '9ec8618f3acfc50fd80899e02c786c499ad6b8a5'
    end

  end
end
