Configus.build Rails.env do
  env :production do
    admin do
      email 'admin@np.kaize.ru'
      password 'fPl7d9'
    end

    page_slugs [:index, :about, :contacts, :courses, :schedule]
  end

  env :development, parent: :production do
    admin do
      email 'admin@np.kaize.ru'
      password '1234'
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
  end
end
